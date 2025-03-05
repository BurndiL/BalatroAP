--- STEAMODDED HEADER
--- MOD_NAME: Archipelago Randomizer
--- MOD_ID: Rando
--- MOD_AUTHOR: [Burndi, SpaD_Overolls, Myst, Silvris]
--- MOD_DESCRIPTION: Archipelago Client for Balatro
--- PREFIX: rand
--- BADGE_COLOR: 4E8BE6
--- DISPLAY_NAME: Archipelago
--- VERSION: 0.1.9e-indev-7
--- DEPENDENCIES: [Steamodded>=1.0.0~BETA-0302d]
----------------------------------------------
------------MOD CODE -------------------------

G.AP = {
    APAddress = "archipelago.gg",
    APPort = 38281,
    APSlot = "Player1",
    APPassword = "",
    id_offset = 5606000
}

G.AP.stake_unlock_modes = {
    ["unlocked"] = 0,
    ["vanilla"] = 1,
    ["linear"] = 2,
    ["stake_as_item"] = 3,
    ["stake_as_item_per_deck"] = 4
}

G.AP.location_id_to_item_name = {}
G.AP.game_over_by_deathlink = false

G.AP.this_mod = SMODS.current_mod
G.AP.this_mod.process_loc_text = function()
	G.localization.misc.labels.rand_ap_borrowed = 'Borrowed'
	G.localization.descriptions.Other.debuffed_default_b = {}
	G.localization.descriptions.Other.debuffed_default_b.name = G.localization.descriptions.Other.debuffed_default.name
	G.localization.descriptions.Other.debuffed_default_b.text = {}
	for k, v in ipairs(G.localization.descriptions.Other.debuffed_default.text) do
		G.localization.descriptions.Other.debuffed_default_b.text[k] = v
	end
end

NFS.load(G.AP.this_mod.path .. "ap_connection.lua")()
NFS.load(G.AP.this_mod.path .. "utils.lua")()
NFS.load(G.AP.this_mod.path .. "misc.lua")()
NFS.load(G.AP.this_mod.path .. "stake.lua")()
NFS.load(G.AP.this_mod.path .. "UIdefinitions.lua")()
NFS.load(G.AP.this_mod.path .. "atlas.lua")()
NFS.load(G.AP.this_mod.path .. "modsupport.lua")()

json = NFS.load(G.AP.this_mod.path .. "json.lua")()
AP = require('lua-apclientpp')

local isInProfileTabCreation = false
local isInRunInfoTabCreation = false
local isInProfileOptionCreation = false
local unloadAPProfile = false
local ap_profile_delete = false
local standard_deck = nil

local deck_list = {}
deck_list[0] = 'Red Deck'
deck_list[1] = 'Blue Deck'
deck_list[2] = 'Yellow Deck'
deck_list[3] = 'Green Deck'
deck_list[4] = 'Black Deck'
deck_list[5] = 'Magic Deck'
deck_list[6] = 'Nebula Deck'
deck_list[7] = 'Ghost Deck'
deck_list[8] = 'Abandoned Deck'
deck_list[9] = 'Checkered Deck'
deck_list[10] = 'Zodiac Deck'
deck_list[11] = 'Painted Deck'
deck_list[12] = 'Anaglyph Deck'
deck_list[13] = 'Plasma Deck'
deck_list[14] = 'Erratic Deck'

G.AP.profile_Id = -1
G.AP.GameObjectInit = false
G.AP.StakesInit = false
G.AP.UnlockConsCache = {}
G.AP.ChallengeCache = {}

G.AP.Spectral = {
	item = nil,
	active = false,
	item_detected = false
}

-- stake cursor used for AP logic
G.viewed_stake_act = {}
G.viewed_stake_act[1] = 1
G.viewed_stake_act[2] = 1

-- true if the profile was selected and loaded
function isAPProfileLoaded()
    return G.SETTINGS and G.AP and G.SETTINGS.profile == G.AP.profile_Id
end

-- true if the profile is selected in profile selection, does not have to be loaded yet
function isAPProfileSelected()
    return G.focused_profile == G.AP.profile_Id
end

G.AP.create_ap_profile = function()
	if G.AP.profile_Id == -1 then
        G.AP.profile_Id = #G.PROFILES + 1
        G.PROFILES[G.AP.profile_Id] = {}
		delete_ap_profile()
        G.AP.log("Created AP Profile in Slot " .. tostring(G.AP.profile_Id))
		
		-- load data to avoid resetting the text inputs
		local APSettings = NFS.read('APSettings.json')

		if APSettings ~= nil then
			APSettings = json.decode(APSettings)
			if APSettings ~= nil then
				G.AP.APSlot = APSettings['APSlot'] or G.AP.APSlot
				G.AP.APAddress = APSettings['APAddress'] or G.AP.APAddress
				G.AP.APPort = APSettings['APPort'] or G.AP.APPort
				G.AP.APPassword = APSettings['APPassword'] or G.AP.APPassword
			end
		end
    end
end

G.FUNCS.can_APConnect = function(e)
    if (G.APClient) then
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
    NFS.write('APSettings.json', APInfo)

    APConnect()
end

-- gets called when connection wants to be ended (for example when selecting non AP profile)
G.FUNCS.APDisconnect = function(sanity_check)
    G.APClient = nil
    collectgarbage("collect")
    unloadAPProfile = true
    standard_deck = nil
	G.E_MANAGER.queues.ap_hints = nil
	G.AP.GameObjectInit = false
	
	G.PROFILES[G.AP.profile_Id] = {}
	
	G.AP.hints = nil
	G.AP.hint_locations = nil
	G.AP.player_names = nil
	G.AP.hint_priotiy = nil
	
	G.AP.Spectral = {
		item = nil,
		active = false,
		item_detected = false
	}
	if sanity_check then
		if G.SETTINGS.profile == G.AP.profile_Id then G.SETTINGS.profile = 1 end
	end
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
		
		local ap_interest = G.PROFILES[G.AP.profile_Id]["maxinterest"] or 0
		
        init_game_object.interest_cap = init_game_object.interest_cap +
                                            (ap_interest * 5 or 0)

        init_game_object.starting_params.joker_slots = init_game_object.starting_params.joker_slots +
                                                           (G.PROFILES[G.AP.profile_Id]["bonusjoker"] or 0)

        init_game_object.starting_params.consumable_slots = init_game_object.starting_params.consumable_slots +
                                                                (G.PROFILES[G.AP.profile_Id]["bonusconsumable"] or 0)
		
		init_game_object.ap_seed = G.APClient:get_seed()
		init_game_object.ap_jokers_removed = AreJokersRemoved()	
		init_game_object.ap_consums_removed = AreConsumablesRemoved()
		init_game_object.ap_modded_items = G.AP.this_mod.config.modded

    end

    return init_game_object
end

-- DeathLink 

G.FUNCS.die = function()

    if G.STAGE == G.STAGES.RUN and G.AP.slot_data and IsDeathlinkOn() then

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
    if isAPProfileLoaded() and
        (G.AP.death_link_cause and G.AP.death_link_cause ~= "unknown" and loc_vars and
            loc_vars.quip) then
        -- split cause into chunks
        local lines = split_text_to_lines(G.AP.death_link_cause)

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
        G.AP.death_link_cause = nil
        G.AP.death_link_source = nil
        return t
    end
    return speech_bubbleref(text_key, loc_vars)
end

-- send out deathlink

function sendDeathLinkBounce(cause, source)

    G.AP.log("sendDeathLinkBounce started")
    cause = cause or "Balatro"
    source = source or G.AP.APSlot or "BalatroPlayer"
    local time = G.APClient:get_server_time()
    G.AP.LAST_DEATH_LINK_TIME = time
    G.AP.log("AP:sendDeathLinkBounce " .. tostring(time) .. " " .. cause .. " " .. source)
    local res = G.APClient:Bounce({
        time = time,
        cause = cause,
        source = source
    }, {}, {}, {"DeathLink"})
end

local update_game_overRef = Game.update_game_over
function Game:update_game_over(dt)

    -- only sends deathlink if run ended before and during ante 8
    -- also checks if run is over because of deathlink coming in (not sure if necessary)
    if isAPProfileLoaded() and not G.STATE_COMPLETE and G.AP.slot_data and IsDeathlinkOn() and
        G.GAME.round_resets.ante <= G.GAME.win_ante and not G.AP.game_over_by_deathlink then

        sendDeathLinkBounce("Run ended at ante " .. G.GAME.round_resets.ante)
    end
    G.AP.game_over_by_deathlink = false
    return update_game_overRef(self, dt)
end

-- game changes

local game_updateRef = Game.update
function Game:update(dt)
    local game_update = game_updateRef(self, dt)
    if G.APClient ~= nil then
        G.APClient:poll()
    elseif isAPProfileLoaded() then
		G.FUNCS.APDisconnect()
		G.focused_profile = 1
		G.SETTINGS.profile = 1
		G.FUNCS.load_profile()
	end
    return game_update
end

-- hook to make bypass_lock consumables usable
G.FUNCS.can_use_consumeableRef = G.FUNCS.can_use_consumeable
G.FUNCS.can_use_consumeable = function(e)
	local unlocked = nil
	if isAPProfileLoaded() and e.config.ref_table.bypass_lock then
		unlocked = e.config.ref_table.config.center.unlocked
		e.config.ref_table.config.center.unlocked = true
	end

	local ret = G.FUNCS.can_use_consumeableRef(e)
	
	if isAPProfileLoaded() and e.config.ref_table.bypass_lock then
		e.config.ref_table.config.center.unlocked = unlocked
	end
	
	return ret
end

local game_drawRef = Game.draw
function Game:draw()
    local game_draw = game_drawRef(self)
    if G and G.STAGES and G.STAGE == G.STAGES.MAIN_MENU and G.AP.status_text then
	
		local status = G.AP.status_text:get_UIE_by_ID('status_text')
		local status_string = ""
		local goal = G.AP.status_text:get_UIE_by_ID('goal_text')
		local goal_string = ""
        if G.APClient ~= nil then
            if G.APClient:get_state() == AP.State.SLOT_CONNECTED then
                status_string = string.gsub(G.AP.this_mod.config.connection_status ~= 3 and localize("k_ap_connected") or 
					localize('k_ap_connected_no_ip'),'#3#', tostring(G.AP.APSlot))
				if G.AP.this_mod.config.connection_status ~= 3 then
					status_string = string.gsub(status_string, '#2#', tostring(G.AP.APPort))
					status_string = string.gsub(status_string, "#1#", tostring(G.AP.APAddress))
				end

                if G.AP.goal and G.AP.GameObjectInit then
					
					local goal_loc = localize('ap_goal_text')
					
					if goal_loc and type(goal_loc) == "table" then
						goal_string = localize("k_ap_goal") .. ": "..goal_loc[G.AP.goal+1]
					end
                    -- beat # of decks
                    if G.AP.goal == 0 then
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.decks_win_goal))
                        goal_string = string.gsub(goal_string, "#2#", tostring(G.PROFILES[G.AP.profile_Id].ap_progress))

                        -- unlock # of jokers
                    elseif G.AP.goal == 1 then
                        local unlocked_jokers = get_unlocked_jokers()
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.jokers_unlock_goal))
                        goal_string = string.gsub(goal_string, "#2#", tostring(unlocked_jokers))

                        -- beat specific ante
                    elseif G.AP.goal == 2 then
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.ante_win_goal))

                        -- beat # decks on at least # stake
                    elseif G.AP.goal == 3 then
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.decks_win_goal))
                        goal_string = string.gsub(goal_string, "#2#", tostring(G.PROFILES[G.AP.profile_Id].ap_progress))

                        if G.AP.StakesInit then
                            for i = 1, 8, 1 do
                                if G.P_CENTER_POOLS.Stake[i].stake_level == tonumber(G.AP.slot_data.required_stake) then
                                    goal_string = string.gsub(goal_string, "#3#", localize({
                                        type = "name_text",
                                        key = G.P_CENTER_POOLS.Stake[i].key,
                                        set = "Stake"
                                    }))
                                    break
                                end
                            end
                        else
                            goal_string = string.gsub(goal_string, "#3#",
                                localize("b_stake") .. " " .. tostring(G.AP.slot_data.required_stake))
                        end

                        -- win with # jokers on at least # stake
                    elseif G.AP.goal == 4 then
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.jokers_unlock_goal))
                        goal_string = string.gsub(goal_string, "#2#", tostring(G.PROFILES[G.AP.profile_Id].ap_progress))

                        if G.AP.StakesInit then
                            for i = 1, 8, 1 do
                                if G.P_CENTER_POOLS.Stake[i].stake_level == tonumber(G.AP.slot_data.required_stake) then
                                    goal_string = string.gsub(goal_string, "#3#", localize({
                                        type = "name_text",
                                        key = G.P_CENTER_POOLS.Stake[i].key,
                                        set = "Stake"
                                    }))
                                    break
                                end
                            end
                        else
                            goal_string = string.gsub(goal_string, "#3#",
                                localize("b_stake") .. " " .. tostring(G.AP.slot_data.required_stake))
                        end

                        -- win with # of unique combinations of deck and stake
                    elseif G.AP.goal == 5 then
                        goal_string = string.gsub(goal_string, "#1#", tostring(G.AP.slot_data.unique_deck_win_goal))
                        goal_string = string.gsub(goal_string, "#2#", tostring(G.PROFILES[G.AP.profile_Id].ap_progress))
                    end
                end
            else
                status_string = string.gsub(localize("k_ap_connecting"), "#1#", tostring(G.AP.APAddress))
                status_string = string.gsub(status_string, "#2#", tostring(G.AP.APPort))
            end

        else
            status_string = localize("k_ap_not_connected")
        end
		
		if status then
			status.config.text = status_string
			status.config.text_drawable:set(status.config.text)
		end
		
		if goal then
			goal.config.text = goal_string
			goal.config.text_drawable:set(goal.config.text)
		end
		
		G.AP.status_text:recalculate()
    end

    return game_draw
end

-- load APSettings when opening Profile Select
-- also create new profile when first loading (might have to move this somewhere more fitting)

local game_load_profileRef = Game.load_profile
function Game:load_profile(_profile)
	-- print(tostring(_profile).." "..tostring(isAPProfileLoaded()).." "..tostring(G.AP.GameObjectInit))
    if unloadAPProfile then
        _profile = _profile == G.AP.profile_Id and 1 or _profile
        unloadAPProfile = false
    end
    ap_profile_delete = false

    G.AP.create_ap_profile()
	
	if _profile ~= G.AP.profile_Id or not G.AP.GameObjectInit then
		local game_load_profile = game_load_profileRef(self, _profile)
	elseif _profile == G.AP.profile_Id and G.AP.GameObjectInit then
		G.SETTINGS.profile = G.AP.profile_Id
	end
	
    return game_load_profile
end

local back_initRef = Back.init
function Back:init(selected_back)

    if isAPProfileLoaded() and not selected_back then
        selected_back = G.P_CENTERS[standard_deck or 'b_red']
    end
    return back_initRef(self, selected_back)
end
-- unlock Items based on APItems

G.FUNCS.AP_unlock_item = function(item, notify)
    --G:save_notify(item)
    table.sort(G.P_CENTER_POOLS["Back"], function(a, b)
        return (a.order - (a.unlocked and 100 or 0)) < (b.order - (b.unlocked and 100 or 0))
    end)
    --G:save_progress()
    if item.set == 'Back' then
        discover_card(item)
    end

    if item.set == 'Joker' and G.DISCOVER_TALLIES and G.DISCOVER_TALLIES.jokers and G.DISCOVER_TALLIES.jokers.tally then
        G.DISCOVER_TALLIES.jokers.tally = G.DISCOVER_TALLIES.jokers.tally + 1
    end

    G.FILE_HANDLER.force = true

    -- prevent duplicate notification on stake_unlock_mode 4
    if not (item.set == 'Back' and tonumber(G.AP.slot_data.stake_unlock_mode) ==
        G.AP.stake_unlock_modes.stake_as_item_per_deck) then
        if notify then notify_alert(item.key, item.set) end
    end
end

local game_init_item_prototypesRef = Game.init_item_prototypes
function Game:init_item_prototypes()
    local game_init_item_prototypes = game_init_item_prototypesRef(self)
	
    if isAPProfileLoaded() then
		-- load serverside data
		G.AP.server_load()
		G.PROFILES[G.AP.profile_Id].name = G.AP['APSlot'] 
		G.PROFILES[G.AP.profile_Id].Archipelago = true 
		
		-- AP lock sticker
		if not G.AP.locked_stickers then
			G.AP.locked_stickers = {}
			G.AP.locked_stickers[1] = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["rand_ap_lock"], {x = 0, y = 0})
			G.AP.locked_stickers[2] = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["rand_ap_lock"], {x = 1, y = 0})
		end
		
		-- borrowed sticker
		SMODS.Stickers.rand_ap_borrowed.no_collection = nil
		
        if tableContains(G.AP.slot_data.included_decks, 'b_red') then
            standard_deck = 'b_red'
        end

        -- Locked text | Decks require description setup similar to the old system here
        -- everything else uses "Other.wip_locked" and overwrites it with their text (not here)
        for k, v in pairs(G.localization.descriptions.Back) do
            v.unlock_parsed = {}
            local loc_target = k == 'b_challenge' and G.localization.descriptions.Other.ap_locked_Deck_c.text_parsed or
                                   G.localization.descriptions.Other.ap_locked_Back.text_parsed

            for _line, _string in pairs(loc_target) do
                v.unlock_parsed[_line] = _string
            end

            local _name = loc_parse_string("{C:inactive,s:0.8}(" .. v.name .. ")")
            v.unlock_parsed[#v.unlock_parsed + 1] = _name

            G.localization.descriptions.Back[k] = v
        end
		
		--safeguard bcos crashes on seed mismatch
		G.PROFILES[G.AP.profile_Id]["jokers"] = G.PROFILES[G.AP.profile_Id]["jokers"] or {}
		G.PROFILES[G.AP.profile_Id]["backs"] = G.PROFILES[G.AP.profile_Id]["backs"] or {}
		G.PROFILES[G.AP.profile_Id]["vouchers"] = G.PROFILES[G.AP.profile_Id]["vouchers"] or {}
		G.PROFILES[G.AP.profile_Id]["packs"] = G.PROFILES[G.AP.profile_Id]["packs"] or {}
		G.PROFILES[G.AP.profile_Id]["consumables"] = G.PROFILES[G.AP.profile_Id]["consumables"] or {}
		
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

        self.P_LOCKED = {}
        for k, v in pairs(self.P_CENTERS) do
            -- for jokers
            if string.find(k, '^j_') then
				
				v.alerted = true
				
                if AreJokersRemoved() then
                    v.wip = true
                    v.unlocked = false
                    v.discovered = false
                    v.hidden = true
					v.ap_unlocked = false
                else
                    v.unlocked = true
                    v.discovered = true
                    v.hidden = false
                    v.ap_unlocked = false
                end

                if G.PROFILES[G.AP.profile_Id]["jokers"][v.key] ~= nil then

                    if AreJokersRemoved() then
                        v.wip = nil
                        v.unlocked = true
                        v.discovered = true
                        v.hidden = false
						v.ap_unlocked = true
                    else
                        v.ap_unlocked = true
                    end

                    if (G.AP.JokerQueue[v] == true) then
                        G.FUNCS.AP_unlock_item(v)
                    end
                end
                -- for backs (decks)
            elseif string.find(k, '^b_') then
				v.alerted = true
                v.unlocked = false
                G.AP.UnlockConsCache[k] = v.unlock_condition
                v.unlock_condition = nil
                if G.PROFILES[G.AP.profile_Id]["backs"][v.key] ~= nil then
                    v.unlocked = true
                    v.discovered = true
                    v.hidden = false
                    if (G.AP.BackQueue[v] == true) then
                        G.FUNCS.AP_unlock_item(v)
                    end
                end

                if not tableContains(G.AP.slot_data.included_decks, k) and k ~= 'b_challenge' then
                    SMODS.Back:take_ownership(k, {}):delete()
                elseif not standard_deck and k ~= 'b_challenge' then
                    standard_deck = k
                end

                -- create (or fix) deck_usage (for stake unlocks)
                if not G.PROFILES[G.AP.profile_Id].deck_usage or type(G.PROFILES[G.AP.profile_Id].deck_usage) ~= 'table' then
                    G.PROFILES[G.AP.profile_Id].deck_usage = {}
                end
                if not G.PROFILES[G.AP.profile_Id].deck_usage[k] then
                    G.PROFILES[G.AP.profile_Id].deck_usage[k] = {}
                end
                if not G.PROFILES[G.AP.profile_Id].deck_usage[k].count then
                    G.PROFILES[G.AP.profile_Id].deck_usage[k].count = 0
                end
                if not G.PROFILES[G.AP.profile_Id].deck_usage[k].wins then
                    G.PROFILES[G.AP.profile_Id].deck_usage[k].wins = {}
                end
                if not G.PROFILES[G.AP.profile_Id].deck_usage[k].losses then
                    G.PROFILES[G.AP.profile_Id].deck_usage[k].losses = {}
                end
				if not G.PROFILES[G.AP.profile_Id].deck_stake then
					G.PROFILES[G.AP.profile_Id].deck_stake = {}
				end
				
                if not G.PROFILES[G.AP.profile_Id].deck_stake[k] then
                    G.PROFILES[G.AP.profile_Id].deck_stake[k] = {}
                    for i = 1, 8, 1 do
                        G.PROFILES[G.AP.profile_Id].deck_stake[k][i] = false
                    end
                end

                -- for vouchers
            elseif string.find(k, '^v_') and not string.find(k, '^v_rand_ap_item') then
                v.wip = true
                v.unlocked = false
				v.ap_unlocked = false
				v.alerted = true
                if G.PROFILES[G.AP.profile_Id]["vouchers"][v.key] ~= nil then
                    -- progressive vouchers
                    if v.requires then
                        if (not G.P_CENTERS[v.requires[1]].unlocked) then
                            G.P_CENTERS[v.requires[1]].nextVoucher = v
                            v = G.P_CENTERS[v.requires[1]]
                        end
                    elseif v.nextVoucher then
                        v = v.nextVoucher
                    end
                    v.wip = nil
                    v.unlocked = true
                    v.discovered = true
                    v.hidden = false
					v.ap_unlocked = true
                    if (G.AP.VoucherQueue[v] == true) then
                        G.FUNCS.AP_unlock_item(v)
                    end
                end
			elseif k == 'v_rand_ap_item' then
				v.alerted = true
                -- for packs
            elseif string.find(k, '^p_') then
                v.unlocked = false
				v.discovered = false
                v.wip = true
				v.alerted = true
				v.ap_unlocked = false
				for pack_key, pack_center in pairs(G.PROFILES[G.AP.profile_Id]["packs"]) do
					if string.find(k, pack_key) and pack_center ~= nil then
					--if G.PROFILES[G.AP.profile_Id]["packs"][v.key] ~= nil then
						v.wip = nil
						v.unlocked = true
						v.discovered = true
						v.hidden = false
						v.ap_unlocked = true
						if (G.AP.PackQueue[v] == true) then
							G.FUNCS.AP_unlock_item(v)
						end
						break
					end
				end
                -- for consumables

            elseif string.find(k, '^c_') and not string.find(k, '^c_base') then --and 
				--not tableContains({'c_rand_ap_tarot', 'c_rand_ap_planet', 'c_rand_ap_spectral'}, k) then
				
				v.discovered = true
				v.alerted = true
                if AreConsumablesRemoved() then
                    v.wip = true
                    v.unlocked = false
					v.ap_unlocked = false
                else
                    v.unlocked = true
                    v.ap_unlocked = false
                end

                if G.PROFILES[G.AP.profile_Id]["consumables"][v.key] ~= nil then
                    if AreConsumablesRemoved() then
                        v.wip = nil
                        v.unlocked = true
                        v.discovered = true
                        v.hidden = false
						v.ap_unlocked = true
                    else
                        v.ap_unlocked = true
						v.discovered = true
                    end

                    if (G.AP.ConsumableQueue[v] == true) then
                        G.FUNCS.AP_unlock_item(v)
                    end
                end
            end
            -- back up unlock_condition
            if v.unlock_condition and not G.AP.UnlockConsCache[k] then
                G.AP.UnlockConsCache[k] = v.unlock_condition
            end

            v.unlock_condition = v.unlock_condition or {}

            -- modded item overrides (backs excluded)
			if G.AP.this_mod.config.modded ~= 1 and not string.find(k, '^b_') then
				if not IsVanillaItem(k) then
                    v.modded = true
					v.alerted = true
				    if G.AP.this_mod.config.modded == 2 then
						v.ap_unlocked = false
						v.wip = true
						v.unlocked = false
						v.discovered = false
						v.hidden = false
					else
						v.ap_unlocked = true
						v.wip = nil
						v.unlocked = true
						v.discovered = true
						v.hidden = false
					end
				end
			end
			
			-- Grab IDs for local vanilla items
			if not v.modded then
				for _id, _key in pairs(G.APItems) do
					if _key == v.key or (string.find(v.key, _key)) then
						v.ap_id = _id
						break
					end
				end
			end
        end

        -- Handle global stake unlock save data
        if not G.PROFILES[G.AP.profile_Id].stake_unlocks then
            G.PROFILES[G.AP.profile_Id].stake_unlocks = {}
            for i = 1, 8, 1 do
                G.PROFILES[G.AP.profile_Id].stake_unlocks[i] = false
            end
            -- G.PROFILES[G.AP.profile_Id].stake_unlocks[1] = true
            -- ^ uncomment to force the first stake to be always open 
        end

        -- AP goal progress
        if not G.PROFILES[G.AP.profile_Id].ap_progress then
            G.PROFILES[G.AP.profile_Id].ap_progress = G.AP.check_progress() or 0
        end

        -- Pick the hardest stake as the required one if AP.slot_data lacks one
        if G.AP.slot_data.required_stake == nil then
            G.AP.slot_data.required_stake = 1
            for i = 1, #G.AP.slot_data.included_stakes, 1 do
                G.AP.slot_data.required_stake = math.max(G.AP.slot_data.required_stake,
                    G.AP.slot_data.included_stakes[i])
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

                elseif (v.type == "bonusjoker") then
                    G.PROFILES[G.AP.profile_Id]["bonusjoker"] = (G.PROFILES[G.AP.profile_Id]["bonusjoker"] or 0) + 1

                elseif (v.type == "bonusconsumable") then
                    G.PROFILES[G.AP.profile_Id]["bonusconsumable"] =
                        (G.PROFILES[G.AP.profile_Id]["bonusconsumable"] or 0) + 1
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

        G.FUNCS.initialize_shop_items()

        self.P_CENTERS['b_red'] = self.P_CENTERS[standard_deck]

        -- handle challenges
        local ci = 1
        G.PROFILES[G.SETTINGS.profile].challenge_unlocks = G.PROFILES[G.SETTINGS.profile].challenge_unlocks or {}

        while ci <= #G.CHALLENGES do
            -- remove modded challenges
            if not IsVanillaItem(G.CHALLENGES[ci].key) then
                G.AP.ChallengeCache[#G.AP.ChallengeCache + 1] = G.CHALLENGES[ci]
                table.remove(G.CHALLENGES, ci)
            else -- prepare vanilla challenges
                -- init save data
                G.PROFILES[G.SETTINGS.profile].challenge_unlocks[G.CHALLENGES[ci].key] =
                    G.PROFILES[G.SETTINGS.profile].challenge_unlocks[G.CHALLENGES[ci].key] or false

                -- wrape the unlock checking function to check ap values in ap mode
                if G.CHALLENGES[ci].unlockedRefAP == nil then
                    G.CHALLENGES[ci].unlockedRefAP = G.CHALLENGES[ci].unlocked
                    G.CHALLENGES[ci].unlocked = function(self)
                        if isAPProfileLoaded() then
                            return G.PROFILES[G.SETTINGS.profile].challenge_unlocks[self.key] and
                                       G.PROFILES[G.SETTINGS.profile].challenge_unlocks[self.key]
                        else
                            return self.unlockedRefAP
                        end
                    end
                end
                ci = ci + 1
            end
        end

        init_AP_stakes()
		G.AP.team_id = G.APClient:get_team_number()
        G.AP.player_id = G.APClient:get_player_number()
		G.APClient:Get({"_read_hints_"..tostring(G.AP.team_id).."_"..tostring(G.AP.player_id)})
		
		if not G.AP.hint_event then
			G.AP.hint_event = Event {
				blockable = false,
				blocking = false,
				pause_force = true,
				no_delete = true,
				trigger = 'after',
				delay = 10,
				func = function()
					if isAPProfileLoaded() then
						G.AP.hint_event.start_timer = false
						--G.AP.log("autoscout hints")
						G.APClient:Get({"_read_hints_"..tostring(G.AP.team_id).."_"..tostring(G.AP.player_id)})
					else G.AP.hint_event = nil end
					return not isAPProfileLoaded()
				end
			}
			
			G.E_MANAGER:add_event(G.AP.hint_event, 'other')
		end
		
		-- fix decks not being sorted on initial load
        table.sort(G.P_CENTER_POOLS["Back"], function (a, b) return (a.order - (a.unlocked and 100 or 0)) < (b.order - (b.unlocked and 100 or 0)) end)
    else
        -- restore unlock conditions
        for k, v in pairs(G.AP.UnlockConsCache) do
            if self.P_CENTERS[k] then
                self.P_CENTERS[k].unlock_condition = v
            end
        end

        G.AP.UnlockConsCache = {}

        -- remove wip tag
        for k, v in pairs(self.P_CENTERS) do
            if v.wip then
                self.P_CENTERS[k].wip = nil
            end
        end
		
		-- borrowed sticker
		SMODS.Stickers.rand_ap_borrowed.no_collection = true
		
        -- fix some custom implementation of the Challenge Deck
        G.P_CENTERS['b_challenge'].name = "Challenge Deck"
        G.P_CENTERS['b_challenge'].unlocked = true
        -- remove it from the pool if its there somehow
        for k, v in ipairs(G.P_CENTER_POOLS.Back) do
            if v == G.P_CENTERS['b_challenge'] then
                table.remove(G.P_CENTER_POOLS.Back, k)
                break
            end
        end

        -- restore challenges removed by ap
        if #G.AP.ChallengeCache > 0 then
            for _, v in pairs(G.AP.ChallengeCache) do
                G.CHALLENGES[#G.CHALLENGES + 1] = v
            end

            G.AP.ChallengeCache = {}
        end
		
		-- reload metadata just in case because it doesnt want to work properly
		if not love.filesystem.getInfo(G.SETTINGS.profile..'') then love.filesystem.createDirectory( G.SETTINGS.profile..'' ) end
		if not love.filesystem.getInfo(G.SETTINGS.profile..'/'..'meta.jkr') then love.filesystem.append( G.SETTINGS.profile..'/'..'meta.jkr', 'return {}') end

		convert_save_to_meta()

		local meta = STR_UNPACK(get_compressed(G.SETTINGS.profile..'/'..'meta.jkr') or 'return {}')
		meta.discovered = meta.discovered or {}

		for k, v in pairs(self.P_CENTERS) do
			if not v.discovered and (string.find(k, '^j_') or string.find(k, '^b_') or string.find(k, '^e_') or string.find(k, '^c_') or string.find(k, '^p_') or string.find(k, '^v_')) and meta.discovered[k] then 
				v.discovered = true
			end
		end
		
		-- Delete Archipelago profile
		delete_ap_profile()
    end
    return game_init_item_prototypes
end

-- handle shop cards

local card_apply_to_runRef = Card.apply_to_run
function Card:apply_to_run(center)

    local card_apply_to_run = card_apply_to_runRef(self, center)

    local temp_interest_cap = G.GAME.interest_cap
    local center_table = {
        name = center and center.name or self and self.ability.name,
        extra = center and center.config.extra or self and self.ability.extra
    }

    if isAPProfileLoaded() then
        if center_table.name == 'Seed Money' or center_table.name == 'Money Tree' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.interest_cap = temp_interest_cap + 25
                    return true
                end
            }))
        end

    end

    return card_apply_to_run
end

local get_next_voucher_keyRef = get_next_voucher_key
function get_next_voucher_key(_from_tag)
    local get_next_voucher = get_next_voucher_keyRef(_from_tag)
    -- normally when no voucher is available it would put blank in shop, prevent that (if blank is not unlocked)
    if isAPProfileLoaded() then
        if G.P_LOCKED[get_next_voucher] or get_next_voucher == 'v_rand_ap_item' or get_next_voucher == "UNAVAILABLE" then
            return nil
        end
    end

    return get_next_voucher
end

local create_cardRef = create_card

function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local consumablelist = {'Tarot', 'Planet', 'Spectral'}
	local banned_keys = {'sho'}
	-- non-shop cards are unlocked only
    if isAPProfileLoaded() then 
		if _type == 'Joker' and not tableContains(banned_keys, key_append) then
			G.AP.swap_lock_state(true, {'Joker'})
		end
		
		if tableContains(consumablelist, _type) and not tableContains(banned_keys, key_append) then
			G.AP.swap_lock_state(true, {_type})
		end
    end

    local create_card = create_cardRef(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

    if isAPProfileLoaded() then 
		if _type == 'Joker' and not tableContains(banned_keys, key_append) then
			G.AP.swap_lock_state(AreJokersRemoved(), {'Joker'})
		end
		
		if tableContains(consumablelist, _type) and not tableContains(banned_keys, key_append) then
			G.AP.swap_lock_state(AreConsumablesRemoved(), {_type})
		end
    end

    return create_card
end

local cardArea_emplaceRef = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    local cardAreaemplace = nil

    cardAreaemplace = cardArea_emplaceRef(self, card, location, stay_flipped)
	
	local center = card.config.center
	
	-- bypass lock and apply borrow
	if isAPProfileLoaded() and G.AP.bypass_lock and not card.playing_card then
		if not center.ap_unlocked then
			card.bypass_lock = true
			card.ability.rand_ap_borrowed = true
		end
	end
	
	-- prevent SMODS better calc from saving the AP check voucher on redeem
	if G.vouchers and self == G.vouchers and card.config.center.key == 'v_rand_ap_item' then
		self:remove_card(card, false)
		card:remove()
	end
	
    if isAPProfileLoaded() and (((center.unlocked == false and not card.bypass_lock) or center.key == 'j_rand_fallback') and 
        ((G.your_collection ~= nil and tableContains(G.your_collection, self) == false) or G.your_collection == nil)) then

        if (center.unlocked == false and not card.bypass_lock) or center.key == 'j_rand_fallback' then
            self:remove_card(card, false)
			card:remove()
        end

    end
    if isAPProfileLoaded() and not card.bypass_lock and not card.playing_card then
		G.AP.update_ap_debuff(card)
    end

    return cardAreaemplace
end

-- AreJokersRemoved + AreConsumablesRemoved
-- to not check the card type every time
function IsCardRemoved(center)
	
	if center.set == 'Joker' then
		return AreJokersRemoved()
	elseif tableContains({'Tarot', 'Planet', 'Spectral'}, center.set) then
		return AreConsumablesRemoved()
	else
		return true
	end
end

-- to quickly change card lock state
function G.AP.swap_lock_state(_removed, _types)
	if not _types then _types = {'Tarot', 'Planet', 'Spectral'} end
	if type(_types) == 'string' then _types = {_types} end
	
	for k, v in pairs(G.P_CENTERS) do
		if not v.modded and not v.ap_unlocked then
			if tableContains(_types, v.set) then
				v.wip = _removed
				v.unlocked = not _removed
			end
		end
	end
end

-- to recalc rates for shop
function G.AP.recalc_shop_rates(rates)
	local total_rate = 0
	local modified -- need to know if we modified to not advance rng
	               -- unless absolutely necessary
	
	for k, v in ipairs(rates) do
		if k ~= 4 then -- exclude playing cards
			local pool_poll, pool_poll_key = get_current_pool(v.type, v.key)
			if pool_poll[1] == "j_rand_fallback" then
				modified = true
				v.val = 0
			else
				total_rate = total_rate + v.val
			end
		else
			total_rate = total_rate + v.val
		end
	end
	
	if total_rate == 0 then
		total_rate = 1
		rates[1].val = 1
	end
	return total_rate, modified
end

local card_loadRef = Card.load

function Card:load(cardTable, other_card)

	card_loadRef(self, cardTable, other_card)

    if isAPProfileLoaded() then
		G.AP.update_ap_debuff(self)
    end

end

-- used to determine if a card is supposed to be debuffed by AP
function G.AP.should_ap_debuff(card)
	if isAPProfileLoaded() and (card.config.center.ap_unlocked == false) and not IsCardRemoved(card.config.center) then
		return true
    end
	return false
end

-- used to undebuff unlocked cards
function G.AP.check_cardarea_debuff(key)
	local check_debuff = function(v)
		if v and type(v) == 'table' and v.config.center.key == key and v.debuff and not v.bypass_lock then
			G.AP.update_ap_debuff(v, true)
		end
	end
	
	if G.jokers and G.jokers.cards then
		for k, v in pairs(G.jokers.cards) do
			check_debuff(v)
		end
	end

	if G.consumeables and G.consumeables.cards then
		for k, v in pairs(G.consumeables.cards) do
			check_debuff(v)
		end
	end

	if G.shop_jokers and G.shop_jokers.cards then
		for k, v in pairs(G.shop_jokers.cards) do
			check_debuff(v)
		end
	end
	
	if G.pack_cards and G.pack_cards.cards then
		for k, v in pairs(G.pack_cards.cards) do
			check_debuff(v)
		end
	end
	
	if G.your_collection then
		for kk, vv in pairs(G.your_collection) do
			if vv.cards then
				for k, v in pairs(vv.cards) do
					check_debuff(v)
				end
			end
		end
	end
end

function G.AP.update_ap_debuff(card, juice)
	local center = card.config.center
	if not isAPProfileLoaded() then return nil end
	if IsCardRemoved(center) then return nil end
	if card.bypass_lock then return nil end
	
	if center.ap_unlocked then
		if card.debuff and juice then card:juice_up(0.1, 0.06) end
		SMODS.debuff_card(card, nil, 'archipelago')
	else
		SMODS.debuff_card(card, true, 'archipelago')
	end
end

local card_can_use_consumeableRef = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
    if (isAPProfileLoaded()) then
        if (self.config and self.config.center) then
            if self.config.center.unlocked == true then

                -- to avoid weird bug 
                if self.ability and self.ability.consumeable and self.ability.consumeable.mod_num == nil then
                    self.ability.consumeable.mod_num = -1
                end

                local card_can_use_result = card_can_use_consumeableRef(self, any_state, skip_check)

                if self.ability and self.ability.consumeable and self.ability.consumeable.mod_num == -1 then
                    self.ability.consumeable.mod_num = nil
                end

                return card_can_use_result
            end
        end
        return false
    end

    return card_can_use_consumeableRef(self, any_state, skip_check)
end

-- scout hints where relevant
local set_abilityRef = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	set_abilityRef(self, center, initial, delay_sprites)
	
	if isAPProfileLoaded() then
		
		if ((self.debuff and self.config.center.ap_unlocked == false) or self.config.center.unlocked == false) and center.ap_id and G.AP.hints then
			
			local _hint
			for i = 1, #G.AP.hints do
				if G.AP.hints[i].item == center.ap_id then
					_hint = G.AP.hints[i]
					break
				end
			end
			
			if _hint then
				if not G.AP.hint_locations[_hint.location] then
					if not G.E_MANAGER.queues.ap_hints then G.E_MANAGER.queues.ap_hints = {} end
					G.AP.hint_priotiy = G.AP.hint_priotiy or {}
					G.AP.hint_priotiy[_hint.location] = _hint
					G.AP.make_hint_step(nil, _hint)
				end
			end
			
		end
	end
end

-- hints in main menu
local main_menuRef = Game.main_menu
function Game:main_menu(change_context)
	
	if isAPProfileLoaded() then
		
		if self.AP.hints then
			self.P_LOCKED = {}
			
			for i = 1, #self.AP.hints do
				local hint = self.AP.hints[i]
				if not hint.found then
					if self.P_CENTERS[self.APItems[hint.item]] then
						local center = self.P_CENTERS[self.APItems[hint.item]]
						self.P_LOCKED[#self.P_LOCKED+1] = center
						
						if center.set == 'Tarot' or center.set == 'Planet' or center.set == 'Spectral' then
							if not center.ap_og_set then center.ap_og_set = center.set end
							center.set = 'Joker'
						end
					end
				end
			end
		end
	else
		delete_ap_profile()
	end
	
	main_menuRef(self, change_context)
	
	if isAPProfileLoaded() then
		for i = 1, #self.P_LOCKED do
			if self.P_LOCKED[i].ap_og_set then
				self.P_LOCKED[i].set = self.P_LOCKED[i].ap_og_set
			end
		end
		
		if self.title_top.cards[1] then
			self.title_top.cards[1].ability.rand_ap_borrowed = true
		end
	end
	
	G.E_MANAGER:add_event(Event({
		func = function()
			if G.APClient and not isAPProfileLoaded() then
				G.APClient = nil
			end
			return true
		end
	}))
end

SMODS.Sticker {
	key = 'ap_borrowed',
	default_compat = false,
	atlas = 'ap_lock',
	loc_txt = {
		name = 'Borrowed',
		text = {
			"Bypasses lock",
			"restrictions."
		}
	},
	pos = { x = 0, y = 1 },
	sets = {}, -- so it doesnt spawn naturally
	badge_colour = {0.4666, 0.286, 0.6588, 1},
	no_collection = true
}



-- AP Items in shop

local min_cost = 1
local max_cost = 10

G.FUNCS.initialize_shop_items = function()
    min_cost = G.AP.slot_data.minimum_price
    max_cost = G.AP.slot_data.maximum_price
end

SMODS.Voucher {
    key = 'ap_item',
    loc_txt = {},
	alerted = true,
    atlas = 'ap_item_voucher',
    cost = 0,
    config = {
        extra = {
            id = 0,
            sprite = 0,
            cost = 0,
            ante = 0
        }
    },
    load = function(self, card, card_table, other_card)

        -- generate dummy data for vouchers w/o it
        -- (turns voucher w/o data into an invalid location)
        if not card.ability.extra then
            card.ability.extra = {
                id = -1,
                cost = 0,
                sprite = 0,
                ante = 1
            }
        end

        -- scout the location and change the price 
        -- (has to be delayed to let the card to init)
        G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = 'after',
            delay = 0.01,
            func = function()
                if card.ability.id ~= 0 then
                    if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                        card.cost = card.ability.extra.cost -- random cost if valid id
                        G.FUNCS.resolve_location_id_to_name(card.ability.extra.id) -- scout the location
                    else
                        card.cost = 0 -- free if the location is invalid
                    end
                end
                return true
            end
        }))
    end,
	redeem = function(self, card)
		G.GAME.used_vouchers["v_rand_ap_item"] = false

		if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
			sendLocationCleared(card.ability.extra.id)
		end
	end,
    set_sprites = function(self, card, front)
        if card.ability and card.ability.extra and card.ability.extra.id ~= 0 then
            if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                -- restore alt sprite on load
                card.children.center:set_sprite_pos({
                    x = card.ability.extra.sprite,
                    y = 0
                })
            else -- change to empty voucher if location is invalid
                card.children.center.atlas = G.ASSET_ATLAS["Voucher"]
                card.children.center:set_sprite_pos({
                    x = 8,
                    y = 2
                })
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
		if not card then return nil end -- sanity check
        if card.ability.extra.id == 0 then
            return {} -- no location = default description
        elseif G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
            if (G.AP.location_id_to_item_name[card.ability.extra.id] and -- construct entry if names are available
                G.AP.location_id_to_item_name[card.ability.extra.id].item_name) and tableContains({1,2}, G.AP.this_mod.config.item_names) then

                local _item_name = tostring(G.AP.location_id_to_item_name[card.ability.extra.id].item_name)
                local _desc = {}
				local _info_queue = {}
				local _skip_name = nil
				
				if G.AP.location_id_to_item_name[card.ability.extra.id].game == 'Balatro' then
					_item_name, _desc, _info_queue = G.AP.localize_name(G.AP.location_id_to_item_name[card.ability.extra.id].item_id,
					G.AP.location_id_to_item_name[card.ability.extra.id].player_name == G.AP.APSlot)
					_skip_name = true
				end
				
				-- Add as hint
				G.AP.location_seen(card.ability.extra.id)
				
				if not _skip_name then
					if #_item_name <= 24 and #_item_name > 0 then -- use short names as the voucher name
						G.localization.descriptions.Voucher.v_rand_ap_item_location.name_parsed = {loc_parse_string(
							_item_name)}
					else -- otherwise put it into description
						G.localization.descriptions.Voucher.v_rand_ap_item_location.name_parsed = G.localization
																									  .descriptions.Voucher
																									  .v_rand_ap_item
																									  .name_parsed
						_desc = split_text_to_lines(_item_name)
						for k, v in pairs(_desc) do
							_desc[k] = "{C:attention}" .. v
						end
					end
				else
					if not _item_name then
						G.localization.descriptions.Voucher.v_rand_ap_item_location.name_parsed = G.localization
																								  .descriptions.Voucher
																								  .v_rand_ap_item
																								  .name_parsed
					else
						G.localization.descriptions.Voucher.v_rand_ap_item_location.name_parsed = {loc_parse_string(_item_name)}
					end
					
					for i = 1, #_info_queue do
						-- TODO: fix loc_vars here
						--info_queue[#info_queue+1] = _info_queue[i]
					end
				end

                for k, v in pairs(G.localization.descriptions.Voucher.v_rand_ap_item_location.text) do
                    _desc[#_desc + 1] = v
                end

                G.localization.descriptions.Voucher.v_rand_ap_item_location.text_parsed = {}
                for k, v in pairs(_desc) do
                    G.localization.descriptions.Voucher.v_rand_ap_item_location.text_parsed[k] = loc_parse_string(v)
                end
				
				local _player_name = G.AP.location_id_to_item_name[card.ability.extra.id].player_name
				if _player_name == G.AP.APSlot then 
					_player_name = localize('k_ap_you')
				end
				
                return {
                    vars = {_player_name},
                    key = 'v_rand_ap_item_location'
                }
            else
                return {} -- default description if item name is unavailable
            end
        else -- use a special message if the location is invalid
            return {
                key = 'v_rand_ap_item_invalid'
            }
        end
    end,
    set_card_type_badge = function(self, card, badges)
        if card.ability and card.ability.sprite == 1 then
            badges[#badges + 1] = create_badge(localize("k_ap_check"), {0.4666, 0.286, 0.6588, 1}, nil, 1.2)
        else
            badges[#badges + 1] = create_badge(localize("k_ap_check"), G.C.DARK_EDITION, nil, 1.2)
        end
    end,
    inject = function(self) -- prevent injection outside of AP
        if isAPProfileLoaded() then
            SMODS.Center.inject(self)
        end
    end,
    unlocked = true,
    discovered = true,
    requires = {'fuck!! shit!!!! (put here anything so it doesnt spawn naturally)'}
}

SMODS.Consumable {
	key = 'ap_tarot',
	set = 'Tarot',
    name = 'Archipelago Tarot',
	atlas = 'ap_item_tarot',
	inject = function(self) -- prevent injection outside of AP
    	if isAPProfileLoaded() and G.AP.slot_data["consumable_pool_locations"] then
    	    SMODS.Center.inject(self)
    	end
    end,
	in_pool = function(self)
		if get_tarot_location(1) then
			return true
		end
        return false
	end,
	config = {
		extra = {id = 0}
	},
	load = function(self, card, card_table, other_card)
		G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = 'after',
            delay = 0.01,
            func = function()
                if card.ability.id ~= 0 then
                    if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                        G.FUNCS.resolve_location_id_to_name(card.ability.extra.id) -- scout the location
                    else
                        card.cost = 0 -- free if the location is invalid
                    end
                end
                return true
            end
        }))
	end,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, card)
		if not card then return nil end -- sanity check
		if card.debuff then return nil end
        if card.ability.extra.id == 0 then
            return {} -- no location = default description
        elseif G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
            if (G.AP.location_id_to_item_name[card.ability.extra.id] and -- construct entry if names are available
                G.AP.location_id_to_item_name[card.ability.extra.id].item_name) and tableContains({1,3}, G.AP.this_mod.config.item_names) then

                local _item_name = tostring(G.AP.location_id_to_item_name[card.ability.extra.id].item_name)
                local _desc = {}
				local _info_queue = {}
				local _skip_name = nil
				
				if G.AP.location_id_to_item_name[card.ability.extra.id].game == 'Balatro' then
					_item_name, _desc, _info_queue = G.AP.localize_name(G.AP.location_id_to_item_name[card.ability.extra.id].item_id,
					G.AP.location_id_to_item_name[card.ability.extra.id].player_name == G.AP.APSlot)
					_skip_name = true
				end
				
				-- Add as hint
				G.AP.location_seen(card.ability.extra.id)

				if not _skip_name then
					if #_item_name <= 24 then -- use short names as the voucher name
						G.localization.descriptions.Tarot.c_rand_ap_tarot_location.name_parsed = {loc_parse_string(
							_item_name)}
					else -- otherwise put it into description
						G.localization.descriptions.Tarot.c_rand_ap_tarot_location.name_parsed = G.localization
																									  .descriptions.Tarot
																									  .c_rand_ap_tarot
																									  .name_parsed
						_desc = split_text_to_lines(_item_name)
						for k, v in pairs(_desc) do
							_desc[k] = "{C:attention}" .. v
						end
					end
				else
					if not _item_name then
						G.localization.descriptions.Tarot.c_rand_ap_tarot_location.name_parsed = G.localization
																									  .descriptions.Tarot
																									  .c_rand_ap_tarot
																									  .name_parsed
					else
						G.localization.descriptions.Tarot.c_rand_ap_tarot_location.name_parsed = {loc_parse_string(_item_name)}
					end
					
					for i = 1, #_info_queue do
						-- TODO: fix loc_vars here
						--info_queue[#info_queue+1] = _info_queue[i]
					end
				end
				
                for k, v in pairs(G.localization.descriptions.Tarot.c_rand_ap_tarot_location.text) do
                    _desc[#_desc + 1] = v
                end

                G.localization.descriptions.Tarot.c_rand_ap_tarot_location.text_parsed = {}
                for k, v in pairs(_desc) do
                    G.localization.descriptions.Tarot.c_rand_ap_tarot_location.text_parsed[k] = loc_parse_string(v)
                end

                local _player_name = G.AP.location_id_to_item_name[card.ability.extra.id].player_name
				if _player_name == G.AP.APSlot then 
					_player_name = localize('k_ap_you')
				end

                return {
                    vars = {_player_name},
                    key = 'c_rand_ap_tarot_location'
                }
            else
                return {} -- default description if item name is unavailable
            end
        else -- use a special message if the location is invalid
            return {
                key = 'c_rand_ap_tarot_invalid'
            }
        end
    end,
	set_ability = function(self, card, initial, delay_sprites)
		G.E_MANAGER:add_event(Event({
			blockable = false,
			trigger = 'after',
			func = function()
				-- only fire if outside of collection
				if not (G.your_collection and tableContains(G.your_collection, card.area)) and card.ability.extra.id == 0 then
					local id = get_tarot_location(25)
					if id then
						card.ability.extra.id = id
					else -- set to blank card if invalid id
						card.cost = 0
						card.ability.extra.id = -1
						card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
						card.children.center:set_sprite_pos({
							x = 6,
							y = 2
						})
					end
				end
				return true
			end
		}))
	end,
	set_sprites = function(self, card, card_table, other_card)
		if card.ability and card.ability.extra and card.ability.extra.id ~= 0 then
			if G.APClient ~= nil and not tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
				card.children.center:set_sprite_pos({
					x = 6,
					y = 2
				})
			end
		end
	end,
	use = function(self, card, area, copier)
		delay(0.4)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			local success = false
			if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				sendLocationCleared(card.ability.extra.id)
				success = true
			end
			attention_text({
				text = success and localize('k_ap_yeah') or localize('k_nope_ex'),
				scale = 1.3, 
				hold = 1.4,
				major = card,
				backdrop_colour = G.C.SECONDARY_SET.Tarot,
				align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and 'tm' or 'cm',
				offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and -0.2 or 0},
				silent = true
			})
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
				play_sound('tarot2', 0.76, 0.4);return true end}))
			play_sound('tarot2', 1, 0.4)
			card:juice_up(0.3, 0.5)
		consumable_update_sprite(card.ability.extra.id)
		return true end }))
	end,
	unlocked = true,
	discovered = true,
	cost = 3,
}

SMODS.Consumable {
	key = 'ap_planet',
	set = 'Planet',    
    name = 'Archipelago Belt',
	atlas = 'ap_item_tarot',
	pos = {x = 1, y = 0},
	inject = function(self) -- prevent injection outside of AP
        if isAPProfileLoaded() and G.AP.slot_data["consumable_pool_locations"] then
            SMODS.Center.inject(self)
        end
    end,
    in_pool = function(self)
		if get_tarot_location(1) then
			return true
		end
        return false
	end,
	set_card_type_badge = function(self, card, badges)
           badges[#badges + 1] = create_badge(localize("k_asteroid_belt"), G.C.SECONDARY_SET.Planet, nil, 1.2)
    end,
	config = {
		extra = {id = 0}
	},
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, card)
		if not card then return nil end -- sanity check
		if card.debuff then return nil end
        if card.ability.extra.id == 0 then
            return {} -- no location = default description
        elseif G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
            if (G.AP.location_id_to_item_name[card.ability.extra.id] and -- construct entry if names are available
                G.AP.location_id_to_item_name[card.ability.extra.id].item_name) and tableContains({1,3}, G.AP.this_mod.config.item_names) then

                local _item_name = tostring(G.AP.location_id_to_item_name[card.ability.extra.id].item_name)
                local _desc = {}
				local _info_queue = {}
				local _skip_name = nil
				
				if G.AP.location_id_to_item_name[card.ability.extra.id].game == 'Balatro' then
					_item_name, _desc, _info_queue = G.AP.localize_name(G.AP.location_id_to_item_name[card.ability.extra.id].item_id,
					G.AP.location_id_to_item_name[card.ability.extra.id].player_name == G.AP.APSlot)
					_skip_name = true
				end
				
				-- Add as hint
				G.AP.location_seen(card.ability.extra.id)
				
				if not _skip_name then
					if #_item_name <= 24 then -- use short names as the voucher name
						G.localization.descriptions.Planet.c_rand_ap_planet_location.name_parsed = {loc_parse_string(
							_item_name)}
					else -- otherwise put it into description
						G.localization.descriptions.Planet.c_rand_ap_planet_location.name_parsed = G.localization
																									  .descriptions.Planet
																									  .c_rand_ap_planet
																									  .name_parsed
						_desc = split_text_to_lines(_item_name)
						for k, v in pairs(_desc) do
							_desc[k] = "{C:attention}" .. v
						end
					end
				else
					if not _item_name then
						G.localization.descriptions.Planet.c_rand_ap_planet_location.name_parsed = G.localization
																									  .descriptions.Planet
																									  .c_rand_ap_planet
																									  .name_parsed
					else
						G.localization.descriptions.Planet.c_rand_ap_planet_location.name_parsed = {loc_parse_string(_item_name)}
					end
					
					for i = 1, #_info_queue do
						-- TODO: fix loc_vars here
						--info_queue[#info_queue+1] = _info_queue[i]
					end
				end
				
                for k, v in pairs(G.localization.descriptions.Planet.c_rand_ap_planet_location.text) do
                    _desc[#_desc + 1] = v
                end

                G.localization.descriptions.Planet.c_rand_ap_planet_location.text_parsed = {}
                for k, v in pairs(_desc) do
                    G.localization.descriptions.Planet.c_rand_ap_planet_location.text_parsed[k] = loc_parse_string(v)
                end

                local _player_name = G.AP.location_id_to_item_name[card.ability.extra.id].player_name
				if _player_name == G.AP.APSlot then 
					_player_name = localize('k_ap_you')
				end

                return {
                    vars = {_player_name},
                    key = 'c_rand_ap_planet_location'
                }
            else
                return {} -- default description if item name is unavailable
            end
        else -- use a special message if the location is invalid
            return {
                key = 'c_rand_ap_planet_invalid'
            }
        end
    end,
	load = function(self, card, card_table, other_card)
		G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = 'after',
            delay = 0.01,
            func = function()
                if card.ability.id ~= 0 then
                    if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                        G.FUNCS.resolve_location_id_to_name(card.ability.extra.id) -- scout the location
                    else
                        card.cost = 0 -- free if the location is invalid
                    end
                end
                return true
            end
        }))
	end,
	set_ability = function(self, card, initial, delay_sprites)
		G.E_MANAGER:add_event(Event({
			blockable = false,
			trigger = 'after',
			func = function()
				-- only fire if outside of collection
				if not (G.your_collection and tableContains(G.your_collection, card.area)) and card.ability.extra.id == 0 then
					local id = get_tarot_location(5)
					if id then
						card.ability.extra.id = id
					else -- set to blank card if invalid id
						card.cost = 0
						card.ability.extra.id = -1
						card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
						card.children.center:set_sprite_pos({
							x = 7,
							y = 2
						})
					end
				end
				return true
			end
		}))
	end,
	set_sprites = function(self, card, card_table, other_card)
		if card.ability and card.ability.extra and card.ability.extra.id ~= 0 then
			if G.APClient ~= nil and not tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
				card.children.center:set_sprite_pos({
					x = 7,
					y = 2
				})
			end
		end
	end,
	use = function(self, card, area, copier)
		delay(0.4)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			local success = false
			if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				sendLocationCleared(card.ability.extra.id)
				success = true
			end
			attention_text({
				text = success and localize('k_ap_yeah') or localize('k_nope_ex'),
				scale = 1.3, 
				hold = 1.4,
				major = card,
				backdrop_colour = G.C.SECONDARY_SET.Planet,
				align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and 'tm' or 'cm',
				offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and -0.2 or 0},
				silent = true
			})
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
				play_sound('tarot2', 0.76, 0.4);return true end}))
			play_sound('tarot2', 1, 0.4)
			card:juice_up(0.3, 0.5)
		consumable_update_sprite(card.ability.extra.id)
		return true end }))
	end,
	unlocked = true,
	discovered = true,
	cost = 3,
}

SMODS.Consumable {
	key = 'ap_spectral',
    name = 'Archipelago Spectral',
	set = 'Spectral',
	atlas = 'ap_item_tarot',
	pos = {x = 2, y = 0},
	inject = function(self) -- prevent injection outside of AP
        if isAPProfileLoaded() and G.AP.slot_data["consumable_pool_locations"] then
            SMODS.Center.inject(self)
        end
    end,
    in_pool = function(self)
		if get_tarot_location(1) then
			return true
		end
        return false
	end,
	config = {
		extra = {id = 0}
	},
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, card)
		if not card then return nil end -- sanity check
        if card.ability.extra.id == 0 then
            return {} -- no location = default description
        elseif G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
            return {} -- also default description because thats the gimmick LOL
        else -- use a special message if the location is invalid
            return {
                key = 'c_rand_ap_spectral_invalid'
            }
        end
    end,
	load = function(self, card, card_table, other_card)
		G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = 'after',
            func = function()
                if card.ability.id ~= 0 then
                    if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                        G.FUNCS.resolve_location_id_to_name(card.ability.extra.id) -- scout the location
                    else
                        card.cost = 0 -- free if the location is invalid
                    end
                end
                return true
            end
        }))
	end,
	set_ability = function(self, card, initial, delay_sprites)
		G.E_MANAGER:add_event(Event({
			blockable = false,
			trigger = 'after',
			func = function()
				-- only fire if outside of collection
				if not (G.your_collection and tableContains(G.your_collection, card.area)) and card.ability.extra.id == 0 then
					local id = get_tarot_location()
					if id then
						card.ability.extra.id = id
						if G.APClient ~= nil then
							G.FUNCS.resolve_location_id_to_name(card.ability.extra.id)
						end
					else -- set to blank card if invalid id
						card.cost = 0
						card.ability.extra.id = -1
						card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
						card.children.center:set_sprite_pos({
							x = 5,
							y = 2
						})
					end
				end
				return true
			end
		}))
	end,
	set_sprites = function(self, card, card_table, other_card)
		if card.ability and card.ability.extra and card.ability.extra.id ~= 0 then
			if G.APClient ~= nil and not tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				card.children.center.atlas = G.ASSET_ATLAS["Tarot"]
				card.children.center:set_sprite_pos({
					x = 5,
					y = 2
				})
			end
		end
	end,
	use = function(self, card, area, copier)
		G.AP.Spectral.active = false
		G.AP.Spectral.item = nil
		G.AP.Spectral.item_detected = false
		delay(0.4)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			local success = false
			if G.APClient ~= nil and tableContains(G.APClient.missing_locations, card.ability.extra.id) then
				-- the gimmick
				if G.AP.location_id_to_item_name[card.ability.extra.id] and 
					G.AP.location_id_to_item_name[card.ability.extra.id].player_name and
						G.AP.location_id_to_item_name[card.ability.extra.id].player_name == G.AP.APSlot then
							G.AP.Spectral.active = true
				end
				
				sendLocationCleared(card.ability.extra.id)
				success = true
			end
			attention_text({
				text = success and localize('k_ap_yeah') or localize('k_nope_ex'),
				scale = 1.3, 
				hold = 1.4,
				major = card,
				backdrop_colour = G.C.SECONDARY_SET.Spectral,
				align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and 'tm' or 'cm',
				offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and -0.2 or 0},
				silent = true
			})
			
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
				play_sound('tarot2', 0.76, 0.4);return true end}))
			play_sound('tarot2', 1, 0.4)
			card:juice_up(0.3, 0.5)
				
			if G.AP.Spectral.active == true then
				G.E_MANAGER:add_event(Event({
					trigger = 'condition', 
					blockable = false, 
					blocking = true, 
					ref_table = G.AP.Spectral, 
					ref_value = 'item_detected',
					stop_val = true,
					func = function()
					
					if G.AP.Spectral.item ~= nil then
						G.AP.Spectral.item_detected = true
						return true
					end
					
				return false end}))
				
				G.E_MANAGER:add_event(Event({
					trigger = 'after', 
					blockable = true, 
					delay = 0.1,
					func = function()
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
							play_sound('tarot2', 0.76, 0.4);return true end}))
						play_sound('tarot2', 1, 0.4)
						card:juice_up(0.3, 0.5)
						
						local spec_success = false
						
						if G.AP.Spectral.item.type == 'tag' then
							spec_success = true
							G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(G.AP.Spectral.item.center)
                                    return true
                                end)
                            }))
						elseif G.AP.Spectral.item.type == 'center' then
							if G.AP.Spectral.item.center.set == 'Joker' and
								#G.jokers.cards < G.jokers.config.card_limit then
									play_sound('timpani')
									spec_success = true
									G.E_MANAGER:add_event(Event({
										trigger = 'before',
										delay = 0.0,
										func = (function()
											local card = create_card(nil, G.jokers, nil, nil, true, nil, G.AP.Spectral.item.center.key)
											card:add_to_deck()
											G.jokers:emplace(card)
											return true
										end)}))
							elseif tableContains({'Tarot','Planet','Spectral'}, G.AP.Spectral.item.center.set) and 
								#G.consumeables.cards < G.consumeables.config.card_limit then
									spec_success = true
									G.E_MANAGER:add_event(Event({
										trigger = 'before',
										delay = 0.0,
										func = (function()
											local card = create_card(nil, G.consumables, nil, nil, true, nil, G.AP.Spectral.item.center.key)
											card:add_to_deck()
											G.consumeables:emplace(card)
											return true
										end)}))
							end
						end
						
						if spec_success == false then
							attention_text({
								text = localize('k_nope_ex'),
								scale = 1.3, 
								hold = 1.4,
								major = card,
								backdrop_colour = G.C.SECONDARY_SET.Spectral,
								align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and 'tm' or 'cm',
								offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) and -0.2 or 0},
								silent = true
							})
						end
					return true end}))
			end
			consumable_update_sprite(card.ability.extra.id)
		return true end }))
	end,
	unlocked = true,
	discovered = true,
	cost = 3,
}

-- Fallback Joker!
SMODS.Joker {
	key = 'fallback',
	no_collection = true,
	atlas = 'ap_lock',
	in_pool = function(self, args)
		return nil
	end,
	loc_txt = {
		name = 'Fallback Card',
		text = {
			"If you see this card,",
			"then something went wrong!",
			"Send us a bug report!"
		}
	}
}

G.AP.location_seen = function(id)
	G.APClient:LocationScouts({id}, 2)
end

function get_tarot_location(_pool_length)
	if not G.APClient then return nil end
	if G.AP.slot_data["consumable_pool_locations"] then
        local valid_locations = {}
        local all_locations = G.AP.slot_data["consumable_pool_locations"]
        -- optional argument in case we want to make
        -- the selection of possible locations limited to a smaller pool
        _pool_length = _pool_length or #all_locations

        for i, v in ipairs(all_locations) do
            if (tableContains(G.APClient.missing_locations, v)) then
				local found = false
				local tarots = SMODS.find_card('c_rand_ap_tarot', true)
				
				for _, card in pairs(tarots) do
					if card.ability.extra.id == v then
						found = true
						break
					end
				end
				
				if found == false then
					local planets = SMODS.find_card('c_rand_ap_planet', true)
					for _, card in pairs(planets) do
						if card.ability.extra.id == v then
							found = true
							break
						end
					end
				end
				
				if found == false then
					local spectrals = SMODS.find_card('c_rand_ap_spectral', true)
					for _, card in pairs(spectrals) do
						if card.ability.extra.id == v then
							found = true
							break
						end
					end
				end
				
				if found == false then
					valid_locations[#valid_locations + 1] = v
				end
            end

            if #valid_locations >= _pool_length then
                break
            end
        end

        if #valid_locations ~= 0 then
			local id = valid_locations[math.random(#valid_locations)]
            G.FUNCS.resolve_location_id_to_name(id)

            G.AP.log("Returning Tarot Location" .. tostring(id))
            return id
        else
            G.AP.log("Out of Tarot Locations...")
            return nil
        end

    end
    return nil
end

G.FUNCS.resolve_location_id_to_name = function(id)
    if not G.AP.location_id_to_item_name[id] then
        G.APClient:LocationScouts({id})
    end
end

function consumable_update_sprite(_id)
	cards = {}
	for _, card in pairs(SMODS.find_card('c_rand_ap_tarot', true)) do
		if card.ability.extra.id == _id and card.children.center.atlas ~= G.ASSET_ATLAS["Tarot"] then
			cards[#cards+1] = card
		end
	end
	
	for _, card in pairs(SMODS.find_card('c_rand_ap_planet', true)) do
		if card.ability.extra.id == _id and card.children.center.atlas ~= G.ASSET_ATLAS["Tarot"] then
			cards[#cards+1] = card
		end
	end
	
	for _, card in pairs(SMODS.find_card('c_rand_ap_spectral', true)) do
		if card.ability.extra.id == _id and card.children.center.atlas ~= G.ASSET_ATLAS["Tarot"] then
			cards[#cards+1] = card
		end
	end
	
	if #cards > 0 then
		for i = 1, #cards do
			local percent = 1.15 - (i-0.999)/(#cards-0.998)*0.3
			G.E_MANAGER:add_event(
				Event({
					trigger = 'after',
					delay = 0.15,
					func = function() 
						cards[i].children.center.atlas = G.ASSET_ATLAS["Tarot"]
						cards[i].children.center:set_sprite_pos({
							x = cards[i].config.center.set == 'Planet' and 7 or 
								cards[i].config.center.set == 'Tarot' and 6 or 5,
							y = 2
						})
						play_sound('card1', percent)
						cards[i]:juice_up(0.3, 0.3)
					return true end }))	
		end
	end
end

function get_shop_location(_pool_length)
    if G.AP.slot_data["stake" .. tostring(G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level) .. "_shop_locations"] then
        local valid_locations = {}
        local all_locations = G.AP.slot_data["stake" .. tostring(G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level) ..
                                  "_shop_locations"]

        -- return existing check if its valid
        if G.GAME.current_shop_check ~= nil then
            if tableContains(all_locations, G.GAME.current_shop_check.id) and
                tableContains(G.APClient.missing_locations, G.GAME.current_shop_check.id) and
                G.GAME.current_shop_check.ante == G.GAME.round_resets.ante then
                G.FUNCS.resolve_location_id_to_name(G.GAME.current_shop_check.id)
                return G.GAME.current_shop_check
            end
        end
        -- optional argument in case we want to make
        -- the selection of possible locations limited to a smaller pool
        _pool_length = _pool_length or #all_locations

        for i, v in ipairs(all_locations) do
            if (tableContains(G.APClient.missing_locations, v)) then
                valid_locations[#valid_locations + 1] = v
            end

            if #valid_locations >= _pool_length then
                break
            end
        end

        if #valid_locations ~= 0 then
            local _check_data = {}

            _check_data.id = valid_locations[math.random(#valid_locations)]
            G.FUNCS.resolve_location_id_to_name(_check_data.id)

            _check_data.cost = math.random(min_cost, max_cost)
            _check_data.sprite = 0
            _check_data.ante = G.GAME.round_resets.ante

            -- easter egg sprite (becomes more common as the pool of remaining items shrinks)
            if math.random(#all_locations) >= (#all_locations - (#valid_locations * 0.5)) then
                _check_data.sprite = 1
            end

            G.AP.log("Returning Shop Location " .. tostring(_check_data.id) .. " with price of $" ..
                                 tostring(_check_data.cost))
            return _check_data
        else
            G.AP.log("Out of Shop Locations...")
            return nil
        end

    end
    return nil
end

local select_blindRef = G.FUNCS.select_blind

G.FUNCS.select_blind = function(e)
    if isAPProfileLoaded() then
        -- scout upcoming locations semi regularly
        G.GAME.current_shop_check = get_shop_location()
        local deck_name = G.GAME.selected_back.name

        if (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 8) then
            for k, v in pairs(deck_list) do
                if deck_name == v then
                    G.APClient:LocationScouts({G.AP.id_offset + (64 * k) + (G.GAME.round_resets.ante - 1) * 8 +
                        (G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level - 1)})
                    break -- break the loop once the correct deck is found
                end
            end
        end
    end

    return select_blindRef(e)
end

local start_runRef = Game.start_run
function Game:start_run(args)
	if isAPProfileLoaded() and not args.savetext then
		-- enable bypass_lock for challenges/decks
		G.AP.bypass_lock = true
	end
	
	start_runRef(self, args)
	
	if isAPProfileLoaded() then
		-- disable bypass_lock
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0,
		func = function()
			G.AP.bypass_lock = false
		return true; end}))
		
        -- scout upcoming locations semi regularly
        G.GAME.current_shop_check = get_shop_location()
        local deck_name = G.GAME.selected_back.name

        if (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 8) then
            for k, v in pairs(deck_list) do
                if deck_name == v then
                    G.APClient:LocationScouts({G.AP.id_offset + (64 * k) + (G.GAME.round_resets.ante - 1) * 8 +
                        (G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level - 1)})
                    break -- break the loop once the correct deck is found
                end
            end
        end
    end
end

local redeemref = Card.redeem

function Card:redeem()
    -- backup current round voucher in case AP Item Voucher was redeemed
    local current_round_voucher
    if (self.config.center_key == 'v_rand_ap_item') then
        current_round_voucher = G.GAME.current_round.voucher
    end
    redeemref(self)
    if self.config.center_key == 'v_rand_ap_item' then
        G.GAME.current_shop_check = nil
        G.GAME.current_round.voucher = current_round_voucher
    end
end

local game_update_shopRef = Game.update_shop

function Game:update_shop(dt)

    if isAPProfileLoaded() and not G.STATE_COMPLETE then
        local game_update_shop = game_update_shopRef(self, dt)
        -- first check if there are still shop locations to get
        G.GAME.current_shop_check = get_shop_location()

        if (G.GAME.current_shop_check ~= nil) then
            G.E_MANAGER:add_event(Event({

                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    local voucher_key = 'v_rand_ap_item'
                    G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
                    local card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2, G.shop_vouchers.T.y, G.CARD_W,
                        G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key], {
                            bypass_discovery_center = true,
                            bypass_discovery_ui = true
                        })
                    -- define the voucher
                    card.ability.extra = G.GAME.current_shop_check

                    if tableContains(G.APClient.missing_locations, card.ability.extra.id) then
                        card.cost = card.ability.extra.cost
                        card.children.center:set_sprite_pos({
                            x = card.ability.extra.sprite,
                            y = 0
                        })
                    else -- use undiscovered sprite + set cost to 0 if location is invalid
                        card.cost = 0
                        card.children.center.atlas = G.ASSET_ATLAS["Voucher"]
                        card.children.center:set_sprite_pos({
                            x = 8,
                            y = 2
                        })
                    end

                    create_shop_card_ui(card, 'Voucher', G.shop_vouchers)
                    card:start_materialize()
                    G.shop_vouchers:emplace(card)

                    return true
                end
            }))
        end

        return game_update_shop
    end
    return game_update_shopRef(self, dt)
end

-- handle profile deletion
-- deprecated
G.FUNCS.can_delete_AP_profile = function(e)
	e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
end

G.FUNCS.delete_AP_profile = function(e)
    if ap_profile_delete then
		local was_connected = isAPProfileLoaded()
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

local exit_overlay_menuRef = G.FUNCS.exit_overlay_menu
G.FUNCS.exit_overlay_menu = function(e)

    if not isAPProfileLoaded() then
        G.APClient = nil
        collectgarbage("collect")
    end
    return exit_overlay_menuRef(e)
end

-- When Load Profile Button is clicked
local load_profile_funcRef = G.FUNCS.load_profile

G.FUNCS.load_profile = function(delete_prof_data)
    if G.AP.GameObjectInit and G.APClient ~= nil then
        G.FUNCS.APDisconnect(true)
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

function get_unlocked_jokers()
    local count = 0
    if (G.P_CENTERS) then
        for k, v in pairs(G.P_CENTERS) do
            if string.find(tostring(k), '^j_') and not k == 'j_rand_fallback' and
                v.ap_unlocked == true and not v.modded then
                count = count + 1
            end
        end
    end
    return count
end

-- this is used to measure current progress on the AP goal
-- (separate function bcos its needed for profile reconstruction from server data)
function G.AP.check_progress()
	if G.AP.goal == 0 then
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
		
		return deck_wins
	elseif G.AP.goal == 1 then
		return get_unlocked_jokers()
		
	elseif G.AP.goal == 3 then
		local deck_stickers = 0
		
		for _, d in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage) do
			for k, v in pairs(d.wins) do
				if G.P_CENTER_POOLS.Stake[k].stake_level >= G.AP.slot_data.required_stake and v > 0 then
					deck_stickers = deck_stickers + 1
					break
				end
			end
		end
		
		return deck_stickers
	elseif G.AP.goal == 4 then
		local joker_stickers = 0
		
		for _, v in pairs(G.P_CENTERS) do
			if v.set == 'Joker' then
				if get_joker_win_sticker(v, true) >= G.AP.slot_data.required_stake then
					joker_stickers = joker_stickers + 1
				end
			end
		end
		
		return joker_stickers
	elseif G.AP.goal == 5 then
		local unique_wins = 0
		for k, v in pairs(G.P_CENTERS) do
			if string.find(tostring(k), '^b_') then
				if G.PROFILES[G.SETTINGS.profile].deck_usage[k] and
					G.PROFILES[G.SETTINGS.profile].deck_usage[k].wins then
					for _stake, _win in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage[k].wins) do
						if _win > 0 then
							unique_wins = unique_wins + 1
						end
					end
				end
			end
		end
		return unique_wins
	end
	return 0
end

local check_for_unlockRef = check_for_unlock
function check_for_unlock(args)
    local check_for_unlock = check_for_unlockRef(args)
    if isAPProfileLoaded() then
		-- ante up checks
        if args.type == 'ante_up' and args.ante and args.ante > 1 and args.ante < 10 then
            -- when an ante is beaten
            local deck_name = G.GAME.selected_back.name

            for k, v in pairs(deck_list) do
                if deck_name == v then
                    sendLocationCleared(G.AP.id_offset + (64 * k) + (args.ante - 2) * 8 +
                                            (G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level - 1))
                    break -- break the loop once the correct deck is found
                end
            end

        end

        -- also need to check for goal completions! (only check during run so accidental loading of a profile doesn't release/collect)
        if G.AP.goal then
            if G.STAGE == G.STAGES.RUN then
                -- beat # of decks goal
                if G.AP.goal == 0 then
					
					if args.type == 'win' then
						-- get all individual deck wins 
						local deck_wins = G.AP.check_progress()

						if deck_wins >= G.AP.slot_data.decks_win_goal then
							sendGoalReached()
						end

						G.PROFILES[G.AP.profile_Id].ap_progress = deck_wins
					end
					
                    -- unlock # of jokers (must be in run to avoid cringe bugs when loading in)
                elseif G.AP.goal == 1 then
                    if tonumber(get_unlocked_jokers() or 0) >= tonumber(G.AP.slot_data.jokers_unlock_goal) then
                        sendGoalReached()
                    end

                    -- beat ante
                elseif G.AP.goal == 2 then
                    if args.type == 'ante_up' and args.ante > G.AP.slot_data.ante_win_goal then
                        sendGoalReached()
                    end
                    -- (completionist+ edition) deck wins on at least # stake
                elseif G.AP.goal == 3 then
					if args.type == 'win' then
						local deck_stickers = G.AP.check_progress()

						if deck_stickers >= tonumber(G.AP.slot_data.decks_win_goal) then
							sendGoalReached()
						end

						G.PROFILES[G.AP.profile_Id].ap_progress = deck_stickers
					end
                    -- (completionist++ edition) win with # of jokers on at least # stake
                elseif G.AP.goal == 4 then
					if args.type == 'win' then
						local joker_stickers = G.AP.check_progress()

						if joker_stickers >= tonumber(G.AP.slot_data.jokers_unlock_goal) then
							sendGoalReached()
						end

						G.PROFILES[G.AP.profile_Id].ap_progress = joker_stickers
					end
                    -- number of unique wins
                elseif G.AP.goal == 5 then
					if args.type == 'win' then
						local unique_wins = G.AP.check_progress()
						
						if unique_wins >= G.AP.slot_data.unique_deck_win_goal then
							sendGoalReached()
						end

						G.PROFILES[G.AP.profile_Id].ap_progress = unique_wins
					end
                end
            end
        else
            G.AP.log("No goal available, this is not good", "ERROR")
        end

    end

    return check_for_unlock
end

function sendGoalReached()
    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        G.AP.log("Goal Reached. Sending Goal Reached to Server")
        G.APClient:StatusUpdate(30)
    end
end

function sendLocationCleared(id)
    G.AP.log("sending location cleared")
    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then

        if (tableContains(G.APClient.missing_locations, id)) then
            G.FUNCS.resolve_location_id_to_name(id)

            -- dont send out a location alert if sending item to yourself
            if (G.AP.location_id_to_item_name[id] and G.AP.location_id_to_item_name[id].player_name and
                G.AP.location_id_to_item_name[id].player_name ~= G.AP.APSlot) or G.AP.location_id_to_item_name[id] ==
                nil then
                notify_alert(id, "location")
            end
        end
        G.APClient:LocationChecks({id})
    end
end

-- gets called after connection has been established

G.FUNCS.set_up_APProfile = function()

    G.AP.log("set_up_APProfile called")

    G.PROFILES[G.AP.profile_Id]["received_indeces"] = {}
    G.PROFILES[G.AP.profile_Id]["jokers"] = {}
    G.PROFILES[G.AP.profile_Id]["backs"] = {}
    G.PROFILES[G.AP.profile_Id]["vouchers"] = {}
    G.PROFILES[G.AP.profile_Id]["packs"] = {}
    G.PROFILES[G.AP.profile_Id]["consumables"] = {}

    G.PROFILES[G.AP.profile_Id]["bonusdiscards"] = 0
    G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] = 0
    G.PROFILES[G.AP.profile_Id]["bonushands"] = 0
    G.PROFILES[G.AP.profile_Id]["maxinterest"] = 0
    G.PROFILES[G.AP.profile_Id]["bonusjoker"] = 0
    G.PROFILES[G.AP.profile_Id]["bonusconsumable"] = 0
end

-- prevent some debuffed jokers from working
local Card_add_to_deckRef = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if self.debuff and not from_debuff and isAPProfileLoaded() then
        if G.jokers then
            self.ability.joker_added_to_deck_but_debuffed = true
        end
		-- negative fix
		if self.edition and self.edition.card_limit then
			if self.ability.consumeable then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.edition.card_limit
			else
				G.jokers.config.card_limit = G.jokers.config.card_limit + self.edition.card_limit
			end
		end
    else
        Card_add_to_deckRef(self, from_debuff)
    end
end

-- prevent modded centers from being injected for AP if removed
local SMODScenter_injectRef = SMODS.Center.inject
function SMODS.Center.inject(self)
    if isAPProfileLoaded() then
        if IsVanillaItem(self.key) or
            (G.AP.this_mod.config.modded ~= 1 and not string.find(self.key, '^b_')) then
                SMODScenter_injectRef(self)
        end
    else
        SMODScenter_injectRef(self)
    end
end

-- challenge stuff
local Gamestart_runRef = Game.start_run
function Game:start_run(args)
    local _new_args = args

    -- ensure its always white stake
    if isAPProfileLoaded() then
        if args.challenge and #args.challenge ~= 0 then
            for k, v in ipairs(G.P_CENTER_POOLS.Stake) do
                if v.stake_level == 1 then
                    _new_args.stake = k
                    break
                end
            end
        end
    end

    return Gamestart_runRef(self, _new_args)
end

-- check whether jokers removed or debuffed
function AreJokersRemoved()
	if G.AP.this_mod.config.jokers == 3 or
		(G.AP.this_mod.config.jokers == 2 and G.AP.slot_data.remove_jokers) then
			return true
	end
	
	return nil
end

-- check whether consumables removed or debuffed
function AreConsumablesRemoved()
	if G.AP.this_mod.config.consumables == 3 or
		(G.AP.this_mod.config.consumables == 2 and G.AP.slot_data.remove_consumables) then
			return true
	end
	
	return nil
end

-- check if deathlink is on
function IsDeathlinkOn()
	if G.AP.this_mod.config.deathlink == 3 or
		(G.AP.this_mod.config.deathlink == 2 and G.AP.slot_data and G.AP.slot_data.deathlink) then
			return true
	end
	
	return nil
end

-- delete ap profile
function delete_ap_profile()
	G.E_MANAGER:add_event(Event({
		no_delete = true,
		blockable = false, 
		blocking = false,
		func = function()
			if G.AP.profile_Id then
				love.filesystem.remove(G.AP.profile_Id..'/'..'profile.jkr')
				love.filesystem.remove(G.AP.profile_Id..'/'..'save.jkr')
				love.filesystem.remove(G.AP.profile_Id..'/'..'meta.jkr')
				love.filesystem.remove(G.AP.profile_Id..'/'..'unlock_notify.jkr')
				love.filesystem.remove(G.AP.profile_Id..'')
			end
			return true
		end
	}))
end

-- custom function to render ap lock
function G.AP.render_ap_debuff(card)
	local sticker_type = 1
	-- remove bottom chain if aspect ratio isnt perfect card
	if card.T.w/card.T.h ~= G.CARD_W/G.CARD_H then sticker_type = 2 end
	card.children.center:draw_shader('rand_ap_debuff', nil, card.ARGS.send_to_shader)
	G.AP.locked_stickers[sticker_type].role.draw_major = card
	G.AP.locked_stickers[sticker_type]:draw_shader('dissolve', nil, nil, nil, card.children.center)
end

local base_debuff_ref = SMODS.DrawSteps.debuff.func
SMODS.DrawSteps.debuff.func = function(self)
	if isAPProfileLoaded() then
		if G.AP.should_ap_debuff(self) and G.AP.locked_stickers then
			G.AP.render_ap_debuff(self)
			return nil
		end
	end
	base_debuff_ref(self)
end

G.AP.localize_name = function(item_id, to_self)
	local _name = ""
	local _desc = {}
	local _info_queue = {}

	if G.APItems[item_id] then
		-- Backs
		if string.find(G.APItems[item_id], "^b_") then
			_name = localize({type = 'name_text', set = 'Back', key = G.APItems[item_id]})
			_info_queue[#_info_queue + 1] = G.P_CENTERS[G.APItems[item_id]] and G.P_CENTERS[G.APItems[item_id]]
		end
		-- Jokers
		if string.find(G.APItems[item_id], "^j_") then
			_name = localize({type = 'name_text', set = 'Joker', key = G.APItems[item_id]})
			_info_queue[#_info_queue + 1] = G.P_CENTERS[G.APItems[item_id]] and G.P_CENTERS[G.APItems[item_id]]
		end
		-- Consumables
		if string.find(G.APItems[item_id], "^c_") then
			_name = localize({type = 'name_text', 
				set = G.P_CENTERS[G.APItems[item_id]] and G.P_CENTERS[G.APItems[item_id]].set or 'Tarot', 
				key = G.APItems[item_id]})
			
			_info_queue[#_info_queue + 1] = G.P_CENTERS[G.APItems[item_id]] and G.P_CENTERS[G.APItems[item_id]]
		end
		-- Vouchers
		if string.find(G.APItems[item_id], "^v_") then
			if to_self then
				local target = G.APItems[item_id]
				if G.P_CENTERS[target].requires and not G.P_CENTERS[G.P_CENTERS[target].requires[1]].unlocked then
					target = G.P_CENTERS[target].requires[1]
				end
				
				_name = localize({type = 'name_text', set = 'Voucher', key = target})
				_info_queue[#_info_queue + 1] = G.P_CENTERS[target] and G.P_CENTERS[target]
			else
				_name = nil
				local targets = {[1] = "", [2] = ""}
				
				if G.P_CENTERS[G.APItems[item_id]].requires then
					targets[1] = G.P_CENTERS[G.APItems[item_id]].requires[1]
					targets[2] = G.APItems[item_id]
				else
					targets[1] = G.APItems[item_id]
					for k, v in pairs(G.P_CENTER_POOLS.Voucher) do
						if v.requires and v.requires[1] == G.APItems[item_id] then
							targets[2] = v.key
							break
						end
					end
				end
				
				_desc[1] = '{C:attention}'..localize({type = 'name_text', set = 'Voucher', key = targets[1]})
				_desc[2] = localize("k_ap_or")
				_desc[3] = '{C:attention}'..localize({type = 'name_text', set = 'Voucher', key = targets[2]})
				_info_queue[#_info_queue + 1] = G.P_CENTERS[targets[1]] and G.P_CENTERS[targets[1]]
				_info_queue[#_info_queue + 1] = G.P_CENTERS[targets[2]] and G.P_CENTERS[targets[2]]
			end
		end
		
		-- Boosters
		if string.find(G.APItems[item_id], "^p_") then
			
			_name = localize({type = 'name_text', set = 'Other', key = G.APItems[item_id]})
			
			local target_center = nil
			for i = 1, #G.P_CENTER_POOLS.Booster do
				if string.find(G.P_CENTER_POOLS.Booster[i].key, G.APItems[item_id]) then
					target_center = G.P_CENTER_POOLS.Booster[i]
					break
				end
			end
			
			if target_center then 
				_info_queue[#_info_queue + 1] = target_center
			end
		end
		
		-- Bonuses
		if string.find(G.APItems[item_id], "^op_") or string.find(G.APItems[item_id], "^fill_") then
			_name = localize({type = 'name_text', set = 'Bonus', key = G.APItems[item_id]})
		end
		
		-- Traps
		if string.find(G.APItems[item_id], "^t_") then
			_name = localize({type = 'name_text', set = 'Trap', key = G.APItems[item_id]})
		end
		
		-- Stakes
		if string.find(G.APItems[item_id], "^stake_") then
			_name = localize({type = 'name_text', set = 'Stake', key = G.APItems[item_id]})
			_info_queue[#_info_queue + 1] = G.P_CENTERS[G.APItems[item_id]] and G.P_CENTERS[G.APItems[item_id]]
		end
		
		-- Bundles
		if string.find(G.APItems[item_id], "^bundle_") then
			_name = localize({type = 'name_text', set = 'Bundle', key = G.APItems[item_id]})
		end
	else
		-- Stakes per Deck
		local _id = item_id - G.AP.id_offset
		if _id >= 400 then
			local _stake = "stake_white"
			local _back = "b_red"
			
			-- TODO: replace this with a loop
			if _id % 8 == 0 then
				_stake = "stake_white"
			elseif (_id - 1) % 8 == 0 then
				_stake = "stake_red"
			elseif (_id - 2) % 8 == 0 then
				_stake = "stake_green"
			elseif (_id - 3) % 8 == 0 then
				_stake = "stake_black"
			elseif (_id - 4) % 8 == 0 then
				_stake = "stake_blue"
			elseif (_id - 5) % 8 == 0 then
				_stake = "stake_purple"
			elseif (_id - 6) % 8 == 0 then
				_stake = "stake_orange"
			elseif (_id - 7) % 8 == 0 then
				_stake = "stake_gold"
			end
			
			local _back_keys = {'b_red', 'b_blue', 'b_yellow', 'b_green', 'b_black',
			'b_magic', 'b_nebula', 'b_ghost', 'b_abandoned', 'b_checkered',
			'b_zodiac', 'b_painted', 'b_anaglyph', 'b_plasma','b_erratic'}
			
			for i = 1, #_back_keys do
				if _id <= (399 + (8*i)) then
					_back = _back_keys[i]
					break
				end
			end
			
			_name = nil
			
			for i = 1, #G.P_CENTER_POOLS.Stake do
				if G.P_CENTER_POOLS.Stake[i].key == _stake then
					loc_colour()
					G.ARGS.LOC_COLOURS.ap_stake = G.P_CENTER_POOLS.Stake[i].colour
					break
				end
			end
			
			_desc[1] = "{C:ap_stake}"..localize({type = 'name_text', set = 'Stake', key = _stake})
			_desc[2] = '({C:attention}'..localize({type = 'name_text', set = 'Back', key = _back}).."{})"
			
			_info_queue[#_info_queue + 1] = G.P_CENTERS[_stake] and G.P_CENTERS[_stake]
			_info_queue[#_info_queue + 1] = G.P_CENTERS[_back] and G.P_CENTERS[_back]
		end
	end
	
	return _name, _desc, _info_queue
end
----------------------------------------------
------------MOD CODE END----------------------
