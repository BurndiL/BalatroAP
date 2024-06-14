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

-- gets called when connection wants to be established. Also saves Connection info in json
G.FUNCS.APConnect = function()
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
function Game.init_game_object(args)
    local init_game_object = init_game_objectRef(args)

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

    return init_game_object
end

-- DeathLink 

G.FUNCS.die = function()

    if G.STAGE == G.STAGES.RUN then

        foreignDeathlink = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            delay = 0.2,
            func = function()
                G.STATE = G.STATES.GAME_OVER
                if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
                    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
                end
                G:save_settings()
                G.FILE_HANDLER.force = true
                G.STATE_COMPLETE = false
                return true
            end
        }))
    end
end

-- make joker say death link cause, not working yet

local localizeRef = localize
function localize(args, misc_cat)
    local localize = ''

    localize = localizeRef(args, misc_cat)

    return localize
end

local add_speech_bubbleRef = Card_Character.add_speech_bubble
function Card_Character.add_speech_bubble(args, text_key, align, loc_vars)
    -- sendDebugMessage(tostring(G.AP.death_link_cause))
    if G.AP.death_link_cause and loc_vars and loc_vars.quip then
        text_key = 'deathlink'
    end

    local add_speech_bubble = add_speech_bubbleRef(args, text_key, align, loc_vars)

    return add_speech_bubble
end

-- send out deathlink

function sendDeathLinkBounce(cause, source)
    cause = cause or "Balatro"
    source = source or G.AP.APSlot or "BalaroPlayer"
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
function Game.update_game_over(args, dt)
    -- only sends deathlink if run ended before and during ante 8
    -- also checks if run is over because of deathlink coming in (not sure if necessary)
    if G.GAME.round_resets.ante <= G.GAME.win_ante and not foreignDeathlink then
        sendDeathLinkBounce("Run ended at ante " .. G.GAME.round_resets.ante)
    end
    return update_game_overRef(args, dt)
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
                Func = G.FUNCS.APConnect
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
function Game.update(arg_298_0, dt)
    local game_update = game_updateRef(arg_298_0, dt)
    if G.APClient ~= nil then
        G.APClient:poll()
    end

    if G.STAGE == G.STAGES.MAIN_MENU and foreignDeathlink then

        foreignDeathlink = false
    end

    return game_update
end

local game_drawRef = Game.draw
function Game.draw(args)
    local game_draw = game_drawRef(args)

    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        love.graphics.print("Connected to Archipelago at " .. G.AP.APAddress .. ":" .. G.AP.APPort .. " as " ..
                                G.AP.APSlot, 10, 30)
        -- print("connected")
    else
        love.graphics.print("Not connected to Archipelago.", 10, 30)
    end

    return game_draw
end

-- load APSettings when opening Profile Select
-- also create new profile when first loading (might have to move this somewhere more fitting)

local game_load_profileRef = Game.load_profile
function Game.load_profile(args, _profile)

    if unloadAPProfile then
        _profile = 1
        unloadAPProfile = false
    end

    if G.AP.profile_Id == -1 then
        G.AP.profile_Id = #G.PROFILES + 1
        G.PROFILES[G.AP.profile_Id] = {}
        sendDebugMessage("Created AP Profile in Slot " .. tostring(G.AP.profile_Id))
    end

    local game_load_profile = game_load_profileRef(args, _profile)

    local APSettings = load_file('APSettings.json')

    APSettings = json.decode(APSettings)

    if APSettings ~= nil then
        G.AP.APSlot = APSettings['APSlot'] or G.AP.APSlot
        G.AP.APAddress = APSettings['APAddress'] or G.AP.APAddress
        G.AP.APPort = APSettings['APPort'] or G.AP.APPort
        G.AP.APPassword = APSettings['APPassword'] or G.AP.APPassword
    end

    return game_load_profile
end

-- unlock Items based on APItems

local game_init_item_prototypesRef = Game.init_item_prototypes
function Game.init_item_prototypes(args)
    local game_init_item_prototypes = game_init_item_prototypesRef(args)

    if isAPProfileLoaded() then
        -- Locked text
        for g_k, group in pairs(G.localization) do
            if g_k == 'descriptions' then
                for _, set in pairs(group) do
                    for x, center in pairs(set) do

                        if string.find(tostring(x), '^b_') or string.find(tostring(x), '^j_') or string.find(tostring(x), '^v_') then
                            center.unlock_parsed = {}
                            center.unlock_parsed[1] = loc_parse_string("AP Item")
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

        alert_unlock = function(item)
            G:save_notify(item)
            table.sort(G.P_CENTER_POOLS["Back"], function(a, b)
                return (a.order - (a.unlocked and 100 or 0)) < (b.order - (b.unlocked and 100 or 0))
            end)
            G:save_progress()
            G.FILE_HANDLER.force = true
            notify_alert(item.key, item.set)
        end

        args.P_LOCKED = {}
        for k, v in pairs(args.P_CENTERS) do
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
            end

            v.unlock_condition = v.unlock_condition or {}

            if v.unlocked ~= nil and v.unlocked == false then
                v.discovered = v.unlocked
                args.P_LOCKED[#args.P_LOCKED + 1] = v
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
                elseif (v.type ==  "maxinterest") then
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
        G.AP.GameObjectInit = true
    end
    return game_init_item_prototypes
end

-- handle shop cards

local can_redeem_APRef = G.FUNCS.can_redeem
G.FUNCS.can_redeem = function(e)
    if isAPProfileLoaded() and not e.config.ref_table.unlocked then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
        return
    end

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
    local _pool, _pool_key = get_current_poolRef(_type, _rarity, _legendary, _append)

    if isAPProfileLoaded() then
        for k, v in pairs(_pool) do
            -- if j_joker not unlocked, put pluto card there (not a pretty solution, will probably be changed in future TODO)
            if G.P_LOCKED[v] or v == "j_joker" then
                _pool[k] = "c_pluto"
            end
        end
    end

    return _pool, _pool_key
end



-- handle profile deletion
G.FUNCS.can_delete_AP_profile = function(e)
    G.AP.CHECK_PROFILE_DATA = G.AP.CHECK_PROFILE_DATA or
                                  love.filesystem.getInfo(G.AP.profile_Id .. '/' .. 'profile.jkr')
    if (not G.AP.CHECK_PROFILE_DATA) or e.config.disable_button then
        G.AP.CHECK_PROFILE_DATA = false
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RED
        e.config.button = 'delete_AP_profile'
    end
end

local ap_profile_delete = false

G.FUNCS.delete_AP_profile = function(e)
    if ap_profile_delete then
        G.FUNCS.APDisconnect()
        ap_profile_delete = false
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
    return load_profile_funcRef(delete_prof_data)
end

-- other stuff 

-- circumvent Jokers being unlocked normally:

local unlock_cardRef = unlock_cardRef
function unlock_card(card)
    -- only intervene if 1. APProfile is loaded and 2. The receiving item is a AP Item (so planet/tarot/voucher etc are not included)
    if isAPProfileLoaded() and (card.set == 'Back' or card.set == 'Joker' or card.set == "Voucher") then
        return
    end

    return unlock_cardRef(card)
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
    end

    return check_for_unlock
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
    G.PROFILES[G.AP.profile_Id]["bonushands"] = 0
end

local back_generate_UIRef = Back.generate_UI
function Back.generate_UI(args, other, ui_scale, min_dims, challenge)
    local back_generate_UI = back_generate_UIRef(args, other, ui_scale, min_dims, challenge)

    return back_generate_UI
end

-- debug

function copy_uncrompessed(_file)
    local file_data = love.filesystem.getInfo(_file)
    if file_data ~= nil then
        local file_string = love.filesystem.read(_file)
        if file_string ~= '' then
            local success = nil
            success, file_string = pcall(love.data.decompress, 'string', 'deflate', file_string)
            love.filesystem.write(_file .. ".txt", file_string)
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
