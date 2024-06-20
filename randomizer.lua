--- STEAMODDED HEADER
--- MOD_NAME: Randomizer
--- MOD_ID: Rando
--- MOD_AUTHOR: [Burndi, Silvris]
--- MOD_DESCRIPTION: Archipelago
----------------------------------------------
------------MOD CODE -------------------------
-- TODO
-- TECH:
-- make most functions only execute when balatro profile is loaded 
-- test if outgoing deathlink works
-- FEATURES:
-- 
-- Traps: Discard random cards, boss blinds
-- Hint Pack
-- When Deathlink: joker will tell you the cause(backlog)
G.AP = {
    APAddress = "localhost",
    APPort = 38281,
    APSlot = "Player1",
    APPassword = "",
    id_offset = 5606000
}

G.AP.this_mod = SMODS.current_mod

require(G.AP.this_mod.path .. "ap_connection")
require(G.AP.this_mod.path .. "utils")
json = require(G.AP.this_mod.path .. "json")
AP = require('lua-apclientpp')

local isInProfileTabCreation = false
local isInProfileOptionCreation = false
local unloadAPProfile = false
local foreignDeathlink = false
local ap_profile_delete = false

G.AP.profile_Id = -1
G.AP.GameObjectInit = false

-- true if the profile was selected and loaded
function isAPProfileLoaded()
    return G.SETTINGS.profile == G.AP.profile_Id
end

-- true if the profile is selected in profile selection, does not have to be loaded yet
function isAPProfileSelected()
    return G.focused_profile == G.AP.profile_Id
end

G.FUNCS.can_APConnect = function(e)
    if ((G.APClient and G.APClient:get_state() == AP.State.SLOT_CONNECTED)) then
        e.config.button = nil
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    else
        e.config.button = 'APConnect'
        e.config.colour = G.C.RED
    end
end

-- gets called when connection wants to be established. Also saves Connection info in json
G.FUNCS.APConnect = function(e)
    local APInfo = json.encode({
        APAddress = G.AP.APAddress,
        APPort = G.AP.APPort,
        APSlot = G.AP.APSlot,
        APPassword = G.AP.APPassword
    })
    save_file('APSettings.json', APInfo)

    APConnect()
end

-- gets called when connection wants to be ended (for example when selecting non AP profile)
G.FUNCS.APDisconnect = function()
    G.APClient = nil
    collectgarbage("collect")
    unloadAPProfile = true

end

-- Initialize AP Buffs

local init_game_objectRef = Game.init_game_object
function Game:init_game_object()
    local init_game_object = init_game_objectRef(self)

    if isAPProfileLoaded() then

        init_game_object.starting_params.hands = init_game_object.starting_params.hands +
                                                     (G.PROFILES[G.AP.profile_Id]["bonushands"] or 0)

        init_game_object.starting_params.discards = init_game_object.starting_params.discards +
                                                        (G.PROFILES[G.AP.profile_Id]["bonusdiscards"] or 0)

        init_game_object.starting_params.dollars = init_game_object.starting_params.dollars +
                                                       (G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] or 0)

        init_game_object.starting_params.hand_size = init_game_object.starting_params.hand_size +
                                                         (G.PROFILES[G.AP.profile_Id]["bonushandsize"] or 0)

        init_game_object.interest_cap = init_game_object.interest_cap +
                                            (G.PROFILES[G.AP.profile_Id]["maxinterest"] or 0)
    end

    foreignDeathlink = false
    return init_game_object
end

-- DeathLink 

G.FUNCS.die = function()

    if G.STAGE == G.STAGES.RUN and G.AP.slot_data and G.AP.slot_data.deathlink then

        foreignDeathlink = true
        -- G.SETTINGS.screenshake = 300
        G.STATE = G.STATES.GAME_OVER
        if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
            G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
        end
        G:save_settings()
        G.FILE_HANDLER.force = true
        G.STATE_COMPLETE = false
    end
end

-- jimbo yaps about deathlink cause

local speech_bubbleref = G.UIDEF.speech_bubble
function G.UIDEF.speech_bubble(text_key, loc_vars)
    if not G.GAME.game_over_by_deathlink and G.AP.death_link_cause and G.AP.death_link_cause ~= "unknown" and loc_vars and
        loc_vars.quip then
        -- split cause into chunks
        local lines = {}
        local count = 0
        for word in G.AP.death_link_cause:gmatch("%S+") do
            if count % 4 == 0 then
                lines[#lines + 1] = ""
            end
            count = count + 1
            lines[#lines] = lines[#lines] .. " " .. word
        end

        G.localization.quips_parsed.ap_death = {
            multi_line = true
        }
        for k, v in ipairs(lines) do
            G.localization.quips_parsed.ap_death[k] = loc_parse_string(v)
        end

        local text = {}
        localize {
            type = 'quips',
            key = 'ap_death',
            vars = {},
            nodes = text
        }
        local row = {}
        for k, v in ipairs(text) do
            row[#row + 1] = {
                n = G.UIT.R,
                config = {
                    align = "cl"
                },
                nodes = v
            }
        end
        local t = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                minh = 1,
                r = 0.3,
                padding = 0.07,
                minw = 1,
                colour = G.C.JOKER_GREY,
                shadow = true
            },
            nodes = {{
                n = G.UIT.C,
                config = {
                    align = "cm",
                    minh = 1,
                    r = 0.2,
                    padding = 0.1,
                    minw = 1,
                    colour = G.C.WHITE
                },
                nodes = {{
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minh = 1,
                        r = 0.2,
                        padding = 0.03,
                        minw = 1,
                        colour = G.C.WHITE
                    },
                    nodes = row
                }}
            }}
        }
        return t
    end
    return speech_bubbleref(text_key, loc_vars)
end

-- send out deathlink

function sendDeathLinkBounce(cause, source)
    cause = cause or "Balatro"
    source = source or G.AP.APSlot or "BalatroPlayer"
    local time = G.APClient:get_server_time()
    sendDebugMessage("AP:sendDeathLinkBounce " .. tostring(time) .. " " .. cause .. " " .. source)
    local res = G.APClient:Bounce({
        time = time,
        cause = cause,
        source = source
    }, {}, {}, {"DeathLink"})
    sendDebugMessage("AP:sendDeathLinkBounce " .. tostring(G.APClient))
    sendDebugMessage("AP:sendDeathLinkBounce " .. tostring(res))
end

local update_game_overRef = Game.update_game_over
function Game:update_game_over(dt)
    -- only sends deathlink if run ended before and during ante 8
    -- also checks if run is over because of deathlink coming in (not sure if necessary)
    if isAPProfileLoaded() and G.AP.slot_data and G.AP.slot_data.deathlink and G.GAME.round_resets.ante <=
        G.GAME.win_ante and not foreignDeathlink and not G.GAME.game_over_by_deathlink then
        sendDeathLinkBounce("Run ended at ante " .. G.GAME.round_resets.ante)
        G.GAME.game_over_by_deathlink = true
    end
    return update_game_overRef(self, dt)
end

-- Profile interface

local create_tabsRef = create_tabs
function create_tabs(args)
    -- when profile interface is created, add archipelago tab 
    if isInProfileTabCreation then
        args.tabs[G.AP.profile_Id] = {
            label = "ARCHIPELAGO",
            chosen = G.focused_profile == G.AP.profile_Id,
            tab_definition_function = G.UIDEF.profile_option,
            tab_definition_function_args = G.AP.profile_Id
        }
    end

    local create_tabs = create_tabsRef(args)

    return create_tabs
end

local profile_selectRef = G.UIDEF.profile_select
function G.UIDEF.profile_select()
    isInProfileTabCreation = true

    local profile_select = profile_selectRef()

    isInProfileTabCreation = false
    return profile_select
end

local create_text_inputRef = create_text_input
function create_text_input(args)
    local create_text_input = create_text_inputRef(args)

    if isInProfileOptionCreation then

        create_text_input['config']['draw_layer'] = nil
        create_text_input['nodes'][1]['config']['draw_layer'] = nil

        local ui_letters = create_text_input['nodes'][1]['nodes'][1]['nodes'][1]['nodes'][1]
        -- sendDebugMessage("Is not null: " .. tostring(#ui_letters))

        if #ui_letters > 0 then
            ui_letters[#ui_letters]['config']['id'] = 'position_' .. args.prompt_text
        end
    end

    return create_text_input
end

local profile_optionRef = G.UIDEF.profile_option
function G.UIDEF.profile_option(_profile)
    G.focused_profile = _profile
    if isAPProfileSelected() then -- AP profile tab code

        isInProfileOptionCreation = true
        local t = {
            n = G.UIT.ROOT,
            config = {
                align = 'cm',
                colour = G.C.CLEAR
            },
            nodes = {{
                n = G.UIT.R,
                config = {
                    align = 'cm',
                    padding = 0.1,
                    minh = 0.8
                },
                nodes = {((_profile == G.SETTINGS.profile) or not profile_data) and {
                    n = G.UIT.R,
                    config = {
                        align = "cm"
                    },
                    nodes = {create_text_input({
                        w = 4,
                        max_length = 16,
                        prompt_text = 'Server Address',
                        ref_table = G.AP,
                        ref_value = 'APAddress',
                        extended_corpus = true,
                        keyboard_offset = 1,
                        callback = function()
                            -- code for when enter is hit (?)
                        end
                    }), create_text_input({
                        w = 4,
                        max_length = 16,
                        prompt_text = 'PORT',
                        ref_table = G.AP,
                        ref_value = 'APPort',
                        extended_corpus = false,
                        keyboard_offset = 1,
                        callback = function()
                            -- code for when enter is hit (?)
                        end
                    })}
                }}
            }, {
                n = G.UIT.R,
                config = {
                    align = 'cm',
                    padding = 0.1,
                    minh = 0.8
                },
                nodes = {((_profile == G.SETTINGS.profile) or not profile_data) and {
                    n = G.UIT.R,
                    config = {
                        align = "cm"
                    },
                    nodes = {create_text_input({
                        w = 4,
                        max_length = 16,
                        prompt_text = 'Slot name',
                        ref_table = G.AP,
                        ref_value = 'APSlot',
                        extended_corpus = true,
                        keyboard_offset = 1,
                        callback = function()
                            -- code for when enter is hit (?)
                        end
                    }), create_text_input({
                        w = 4,
                        max_length = 16,
                        prompt_text = 'Password',
                        ref_table = G.AP,
                        ref_value = 'APPassword',
                        extended_corpus = true,
                        keyboard_offset = 1,
                        callback = function()
                            -- code for when enter is hit (?)
                        end
                    })}
                }}
            }, UIBox_button({
                button = "APConnect",
                label = {"Connect"},
                minw = 3,
                func = "can_APConnect"
            }), {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    padding = 0,
                    minh = 0.7
                },
                nodes = {{
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        minw = 3,
                        maxw = 4,
                        minh = 0.6,
                        padding = 0.2,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        func = 'can_delete_AP_profile',
                        button = "delete_profile",
                        shadow = true,
                        focus_args = {
                            nav = 'wide'
                        }
                    },
                    nodes = {{
                        n = G.UIT.T,
                        config = {
                            text = _profile == G.SETTINGS.profile and localize('b_reset_profile') or
                                localize('b_delete_profile'),
                            scale = 0.3,
                            colour = G.C.UI.TEXT_LIGHT
                        }
                    }}
                }}
            }, {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    padding = 0
                },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        id = 'warning_text',
                        text = localize('ph_click_confirm'),
                        scale = 0.4,
                        colour = G.C.CLEAR
                    }
                }}
            }}
        }
        isInProfileOptionCreation = false
        return t

    else -- if not AP profile behave normally

        local profile_option = profile_optionRef(_profile)
        return profile_option
    end

end

-- game changes

local game_updateRef = Game.update
function Game:update(dt)
    if not dt then
        return
    end
    local game_update = game_updateRef(self, dt)
    if G.APClient ~= nil then
        G.APClient:poll()
    end

    if G.STAGE == G.STAGES.MAIN_MENU and foreignDeathlink then

        foreignDeathlink = false
    end

    return game_update
end

local game_drawRef = Game.draw
function Game:draw()
    local game_draw = game_drawRef(self)

    if G.APClient ~= nil then
        if G.APClient:get_state() == AP.State.SLOT_CONNECTED then
            love.graphics.print("Connected to Archipelago at " .. G.AP.APAddress .. ":" .. G.AP.APPort .. " as " ..
                                    G.AP.APSlot, 10, 30)
        else
            love.graphics.print("Connecting to Archipelago at " .. G.AP.APAddress .. ":" .. G.AP.APPort, 10, 30)
        end

    else
        love.graphics.print("Not connected to Archipelago.", 10, 30)
    end

    return game_draw
end

-- load APSettings when opening Profile Select
-- also create new profile when first loading (might have to move this somewhere more fitting)

local game_load_profileRef = Game.load_profile
function Game:load_profile(_profile)

    if unloadAPProfile then
        _profile = 1
        unloadAPProfile = false
    end
    ap_profile_delete = false

    if G.AP.profile_Id == -1 then
        G.AP.profile_Id = #G.PROFILES + 1
        G.PROFILES[G.AP.profile_Id] = {}
        sendDebugMessage("Created AP Profile in Slot " .. tostring(G.AP.profile_Id))
    end

    local game_load_profile = game_load_profileRef(self, _profile)

    local APSettings = load_file('APSettings.json')

    if APSettings ~= nil then
        APSettings = json.decode(APSettings)
        if APSettings ~= nil then
            G.AP.APSlot = APSettings['APSlot'] or G.AP.APSlot
            G.AP.APAddress = APSettings['APAddress'] or G.AP.APAddress
            G.AP.APPort = APSettings['APPort'] or G.AP.APPort
            G.AP.APPassword = APSettings['APPassword'] or G.AP.APPassword
        end
    end

    return game_load_profile
end

-- unlock Items based on APItems

local game_init_item_prototypesRef = Game.init_item_prototypes
function Game:init_item_prototypes()
    local game_init_item_prototypes = game_init_item_prototypesRef(self)

    if isAPProfileLoaded() then
        -- Locked text (this system might have to be largely overhauled, can't be bothered tho 😀)
        G.localization.descriptions["Booster"] = {}
        -- G.localization.descriptions["Tarot"] = {}
        -- G.localization.descriptions["Planet"] = {}
        -- G.localization.descriptions["Spectral"] = {}
        for g_k, group in pairs(G.localization) do
            if g_k == 'descriptions' then
                for grpkey, set in pairs(group) do
                    for x, center in pairs(set) do

                        if string.find(tostring(x), '^b_') or string.find(tostring(x), '^j_') or
                            string.find(tostring(x), '^v_') or
                            (string.find(tostring(x), '^c_') and not string.find(tostring(x), '^c_base')) or
                            string.find(tostring(x), '^p_') then

                            center.demo_locked = {}
                            center.demo_locked[1] = loc_parse_string("AP Item")

                            center.deck_locked_win = {}
                            center.deck_locked_win[1] = loc_parse_string("AP Item")

                            center.unlock_parsed = {}
                            center.unlock_parsed[1] = loc_parse_string("AP Item")

                            if string.find(tostring(x), '^p_') then
                                G.localization.descriptions["Booster"][x] = center
                            end
                        end

                    end
                end
            end
        end

        for k, v in pairs(G.AP.JokerQueue) do
            G.PROFILES[G.AP.profile_Id]["jokers"][k] = true
        end

        for k, v in pairs(G.AP.BackQueue) do
            G.PROFILES[G.AP.profile_Id]["backs"][k] = true
        end

        for k, v in pairs(G.AP.VoucherQueue) do
            G.PROFILES[G.AP.profile_Id]["vouchers"][k] = true
        end

        for k, v in pairs(G.AP.PackQueue) do
            G.PROFILES[G.AP.profile_Id]["packs"][k] = true
        end

        for k, v in pairs(G.AP.ConsumableQueue) do
            G.PROFILES[G.AP.profile_Id]["consumables"][k] = true
        end

        alert_unlock = function(item)
            G:save_notify(item)
            table.sort(G.P_CENTER_POOLS["Back"], function(a, b)
                return (a.order - (a.unlocked and 100 or 0)) < (b.order - (b.unlocked and 100 or 0))
            end)
            G:save_progress()
            G.FILE_HANDLER.force = true
            -- notify_alert(item.key, item.set)
        end

        self.P_LOCKED = {}
        for k, v in pairs(self.P_CENTERS) do
            -- for jokers
            if string.find(k, '^j_') then
                v.unlocked = false
                if G.PROFILES[G.AP.profile_Id]["jokers"][v.name] ~= nil then
                    v.unlocked = true
                    v.discovered = true

                    if (G.AP.JokerQueue[v] == true) then
                        alert_unlock(v)
                    end
                end
                -- for backs (decks)
            elseif string.find(k, '^b_') then
                v.unlocked = false
                if G.PROFILES[G.AP.profile_Id]["backs"][v.name] ~= nil then
                    v.unlocked = true
                    v.discovered = true
                    if (G.AP.BackQueue[v] == true) then
                        alert_unlock(v)
                    end
                end
                -- for vouchers
            elseif string.find(k, '^v_') then
                v.unlocked = false
                if G.PROFILES[G.AP.profile_Id]["vouchers"][v.name] ~= nil then
                    v.unlocked = true
                    v.discovered = true
                    if (G.AP.VoucherQueue[v] == true) then
                        alert_unlock(v)
                    end
                end
                -- for packs
            elseif string.find(k, '^p_') then
                v.unlocked = false
                if G.PROFILES[G.AP.profile_Id]["packs"][v.name] ~= nil then
                    v.unlocked = true
                    v.discovered = true
                    if (G.AP.PackQueue[v] == true) then
                        alert_unlock(v)
                    end
                end
                -- for consumables

            elseif string.find(k, '^c_') and not string.find(k, '^c_base') then
                v.unlocked = false

                if G.PROFILES[G.AP.profile_Id]["consumables"][v.name] ~= nil then
                    v.unlocked = true
                    v.discovered = true
                    if (G.AP.ConsumableQueue[v] == true) then
                        alert_unlock(v)
                    end
                end
            end

            v.unlock_condition = v.unlock_condition or {}

            if v.unlocked ~= nil and v.unlocked == false then
                v.discovered = v.unlocked
                self.P_LOCKED[#self.P_LOCKED + 1] = v
            end

        end

        -- Handle Queued Bonus stuff

        for k, v in pairs(G.AP.BonusQueue) do
            if (not G.PROFILES[G.AP.profile_Id]["received_indeces"][v.idx]) then

                if (v.type == "bonusdiscards") then
                    G.PROFILES[G.AP.profile_Id]["bonusdiscards"] =
                        (G.PROFILES[G.AP.profile_Id]["bonusdiscards"] or 0) + 1
                elseif (v.type == "bonusstartingmoney") then
                    G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] =
                        (G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] or 0) + 1
                elseif (v.type == "bonushands") then
                    G.PROFILES[G.AP.profile_Id]["bonushands"] = (G.PROFILES[G.AP.profile_Id]["bonushands"] or 0) + 1

                elseif (v.type == "bonushandsize") then
                    G.PROFILES[G.AP.profile_Id]["bonushandsize"] =
                        (G.PROFILES[G.AP.profile_Id]["bonushandsize"] or 0) + 1
                elseif (v.type == "maxinterest") then
                    G.PROFILES[G.AP.profile_Id]["maxinterest"] = (G.PROFILES[G.AP.profile_Id]["maxinterest"] or 0) + 1
                end

                G.PROFILES[G.AP.profile_Id]["received_indeces"][v.idx] = true
            end
        end

        -- remove queued items
        G.AP.BonusQueue = {}
        G.AP.BackQueue = {}
        G.AP.VoucherQueue = {}
        G.AP.JokerQueue = {}
        G.AP.PackQueue = {}
        G.AP.ConsumableQueue = {}
        G.AP.GameObjectInit = true
    end
    return game_init_item_prototypes
end

-- handle shop cards

local can_redeem_APRef = G.FUNCS.can_redeem
G.FUNCS.can_redeem = function(e)
    -- if isAPProfileLoaded() and not e.config.ref_table.unlocked then
    --     e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    --     e.config.button = nil
    --     return
    -- end

    return can_redeem_APRef(e)
end

-- local can_buy_APRef = G.FUNCS.can_buy
-- G.FUNCS.can_buy = function(e)
--     -- Planet cards cant be bought yet
--     if isAPProfileLoaded() and not e.config.ref_table.unlocked then
--         e.config.colour = G.C.UI.BACKGROUND_INACTIVE
--         e.config.button = nil
--         return
--     end

--     return can_buy_APRef(e)
-- end

local get_next_voucher_keyRef = get_next_voucher_key
function get_next_voucher_key(_from_tag)
    local get_next_voucher = get_next_voucher_keyRef(_from_tag)
    -- normally when no voucher is available it would put blank in shop, prevent that (if blank is not unlocked)
    if isAPProfileLoaded() then
        if G.P_LOCKED[get_next_voucher] or get_next_voucher == "UNAVAILABLE" then
            return nil
        end
    end

    return get_next_voucher
end

local get_current_poolRef = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)

    -- to fix bugs, overwrite create_cards() instead and catch issues there

    local _pool, _pool_key = get_current_poolRef(_type, _rarity, _legendary, _append)

    if isAPProfileLoaded() then
        for k, v in pairs(_pool) do
            -- if j_joker not unlocked, put pluto card there (not a pretty solution, will probably be changed in future TODO)
            -- if G.P_LOCKED[v] and v == "j_joker" then
            --     _pool[k] = "UNAVAILABLE"
            -- end
        end
    end

    return _pool, _pool_key
end

local cardArea_emplaceRef = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    local cardAreaemplace = cardArea_emplaceRef(self, card, location, stay_flipped)
    if isAPProfileLoaded() and card.config.center.unlocked == false and
        (G.STATE == G.STATES.SHOP or G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE ==
            G.STATES.PLANET_PACK or G.STATE == G.STATES.BUFFOON_PACK or self == G.jokers or self == G.consumeables) then
        self:remove_card(card, false)
        card:start_dissolve({G.C.RED}, true, 0)
    end
    return cardAreaemplace
end

local can_skip_boosterRef = G.FUNCS.can_skip_booster
G.FUNCS.can_skip_booster = function(e)
    if isAPProfileLoaded() then
        if G.pack_cards and
            (G.STATE == G.STATES.PLANET_PACK or G.STATE == G.STATES.STANDARD_PACK or G.STATE == G.STATES.BUFFOON_PACK or
                (G.hand and (G.hand.cards[1] or (G.hand.config.card_limit <= 0)))) then
            e.config.colour = G.C.GREY
            e.config.button = 'skip_booster'
            return
        end

    end
    return can_skip_boosterRef(e)
end

local card_can_use_consumeableRef = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
    if (isAPProfileLoaded() and self.config and self.config.center and self.center.unlocked == false) then
        return false
    end
    return card_can_use_consumeableRef(self, any_state, skip_check)
end

-- handle profile deletion
G.FUNCS.can_delete_AP_profile = function(e)
    G.AP.CHECK_PROFILE_DATA = G.AP.CHECK_PROFILE_DATA or NFS.getInfo(G.AP.profile_Id .. '/' .. 'profile.jkr')
    if (not G.AP.CHECK_PROFILE_DATA) or e.config.disable_button or
        (G.APClient and G.APClient:get_state() == AP.State.SOCKET_CONNECTING) then
        G.AP.CHECK_PROFILE_DATA = false
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RED
        e.config.button = 'delete_AP_profile'
    end
end

G.FUNCS.delete_AP_profile = function(e)
    if ap_profile_delete then
        G.FUNCS.APDisconnect()
        ap_profile_delete = false
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = (function()
                G.FUNCS.exit_overlay_menu()
                return true
            end)
        }))
    end
    G.FUNCS.delete_profile(e)
    ap_profile_delete = true
    G.AP.CHECK_PROFILE_DATA = nil

end

-- When Load Profile Button is clicked
local load_profile_funcRef = G.FUNCS.load_profile

G.FUNCS.load_profile = function(delete_prof_data)
    if isAPProfileLoaded() and not isAPProfileSelected() and G.APClient ~= nil then
        G.FUNCS.APDisconnect()
        G.AP.GameObjectInit = false
    end
    ap_profile_delete = false
    return load_profile_funcRef(delete_prof_data)
end

-- other stuff 

-- circumvent Jokers being unlocked normally:

local unlock_cardRef = unlock_card
function unlock_card(card)
    -- only intervene if 1. APProfile is loaded and 2. The receiving item is a AP Item 
    if isAPProfileLoaded() and
        (card.set == 'Back' or card.set == 'Joker' or card.set == "Voucher" or card.set == "Booster" or card.set ==
            "Spectral" or card.set == "Planet" or card.set == "Tarot") then
        return
    end

    return unlock_cardRef(card)
end

local discover_cardRef = discover_card
function discover_card(card)
    if isAPProfileLoaded() and card.unlocked == false and
        (card.set == 'Back' or card.set == 'Joker' or card.set == "Voucher" or card.set == "Booster" or card.set ==
            "Spectral" or card.set == "Planet" or card.set == "Tarot") then
        return
    end
    return discover_cardRef(card)
end

-- Here you can unlock checks

local check_for_unlockRef = check_for_unlock
function check_for_unlock(args)
    local check_for_unlock = check_for_unlockRef(args)
    if isAPProfileLoaded() then
        if args.type == 'ante_up' and args.ante < 9 then
            sendDebugMessage("args.type is ante_up")
            -- when an ante is beaten
            local deck_name = G.GAME.selected_back.name
            local stake = get_deck_win_stake()

            sendDebugMessage("deck_name is " .. deck_name)
            -- specify the deck
            if deck_name == 'Red Deck' then
                sendLocationCleared(G.AP.id_offset + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Blue Deck' then
                sendLocationCleared(G.AP.id_offset + 64 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Yellow Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 2 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Green Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 3 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Black Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 4 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Magic Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 5 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Nebula Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 6 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Ghost Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 7 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Abandoned Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 8 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Checkered Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 9 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Zodiac Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 10 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Painted Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 11 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Anaglyph Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 12 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Plasma Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 13 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            elseif deck_name == 'Erratic Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 14 + (args.ante - 2) * 8 + (G.GAME.stake - 1))
            end
        end

        -- also need to check for goal completions!
        if G.AP.goal then
            -- beat # of decks goal
            if G.AP.goal == 0 then

                -- get all individual deck wins 
                local deck_wins = 0
                for k, v in pairs(G.P_CENTERS) do
                    if string.find(tostring(k), '^b_') then
                        if G.PROFILES[G.SETTINGS.profile].deck_usage[k] and
                            G.PROFILES[G.SETTINGS.profile].deck_usage[k].wins and
                            #G.PROFILES[G.SETTINGS.profile].deck_usage[k].wins > 0 then
                            deck_wins = deck_wins + 1
                        end
                    end
                end

                if deck_wins >= G.AP.slot_data.decks_win_goal then
                    sendGoalReached()
                end

                -- unlock # of jokers
            elseif G.AP.goal == 1 then

                if G.PROFILES[G.AP.profile_Id]["jokers"] and #G.PROFILES[G.AP.profile_Id]["jokers"] >=
                    G.AP.slot_data.jokers_unlock_goal then
                    sendGoalReached()
                end

                -- beat ante
            elseif G.AP.goal == 2 then
                if args.type == 'ante_up' and args.ante >= G.AP.slot_data.ante_win_goal then
                    sendGoalReached()
                end

            end

        else
            sendDebugMessage("No goal available, this is not good")
        end

    end

    return check_for_unlock
end

function sendGoalReached()
    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        sendDebugMessage("Goal Reached. Sending Goal Reached to Server")
        G.APClient:StatusUpdate(30)
    end
end

function sendLocationCleared(id)
    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        sendDebugMessage("sendLocationCleared: " .. tostring(id))
        sendDebugMessage("Queuing LocationCheck was successful: " .. tostring(G.APClient:LocationChecks({id})))
    end
end

-- gets called after connection has been established

G.FUNCS.set_up_APProfile = function()

    sendDebugMessage("set_up_APProfile called")

    G.PROFILES[G.AP.profile_Id]["received_indeces"] = {}
    G.PROFILES[G.AP.profile_Id]["jokers"] = {}
    G.PROFILES[G.AP.profile_Id]["backs"] = {}
    G.PROFILES[G.AP.profile_Id]["vouchers"] = {}
    G.PROFILES[G.AP.profile_Id]["packs"] = {}
    G.PROFILES[G.AP.profile_Id]["consumables"] = {}

    G.PROFILES[G.AP.profile_Id]["bonushands"] = 0
    G.PROFILES[G.AP.profile_Id]["bonusdiscards"] = 0
    G.PROFILES[G.AP.profile_Id]["bonushandsize"] = 0
    -- TODO add missing bonus lists
end

local back_generate_UIRef = Back.generate_UI
function Back:generate_UI(other, ui_scale, min_dims, challenge)
    local back_generate_UI = back_generate_UIRef(self, other, ui_scale, min_dims, challenge)

    return back_generate_UI
end

-- prevent achievements from being unlocked
local unlock_achievementRef = unlock_achievement
function unlock_achievement(achievement_name)
    if isAPProfileLoaded() then
        return
    end
    return unlock_achievementRef(achievement_name)
end

-- debug

function copy_uncompressed(_file)
    local file_data = NFS.getInfo(_file)
    if file_data ~= nil then
        local file_string = NFS.read(_file)
        if file_string ~= '' then
            local success = nil
            success, file_string = pcall(love.data.decompress, 'string', 'deflate', file_string)
            NFS.write(_file .. ".txt", file_string)
        end
    end
end

-- fix turning '0' into 'o'
local zeroWasInput = false

local text_input_keyRef = G.FUNCS.text_input_key
function G.FUNCS.text_input_key(args)
    if args.key == '0' then
        zeroWasInput = true
    end

    local text_input_key = text_input_keyRef(args)
    zeroWasInput = false

    return text_input_key

end

local modify_text_inputRef = MODIFY_TEXT_INPUT
function MODIFY_TEXT_INPUT(args)

    if zeroWasInput then
        args.letter = '0'
    end

    local modify_text_input = modify_text_inputRef(args)

    return modify_text_input

end

----------------------------------------------
------------MOD CODE END----------------------
