G.FUNCS.AP_unlock_stake = function(stake_name)
    for k, v in ipairs(G.P_CENTER_POOLS.Stake) do
        if (v.name == stake_name) then
            G.PROFILES[G.AP.profile_Id].stake_unlocks[k] = true
            v.unlocked = true
            if G.AP.StakesInit then
                notify_alert(G.P_CENTER_POOLS.Stake[k].key, 'Stake')
            end

        end
    end
end

G.FUNCS.AP_unlock_stake_per_deck = function(stake_key, deck_key)
    for k, v in ipairs(G.P_CENTER_POOLS.Stake) do
        if stake_key == nil then
            sendDebugMessage("stake_key is nil, this is bad!")
        end

        if G.PROFILES[G.AP.profile_Id].deck_usage[deck_key] == nil then
            sendDebugMessage("deck_usage is nil, this is bad!")
        end

        -- check for existence of the deck_usage to avoid crashes when the key is blank
        if (v.key == stake_key) and G.PROFILES[G.AP.profile_Id].deck_usage[deck_key] then

            G.PROFILES[G.AP.profile_Id].deck_usage[deck_key].stake_unlocks[k] = true

            if G.AP.StakesInit then
                notify_alert(stake_key .. deck_key, 'BackStake')
            end

        end
    end

end

-- handle stakes

-- reinsert the stakes in the desired order, removing the modded ones
function init_AP_stakes()

    local _defaul_stakes = {}
    _defaul_stakes[1] = {
        name = "White Stake",
        key = "stake_white",
        original_key = "white",
        applied_stakes = {},
        atlas = "chips",
        pos = {
            x = 0,
            y = 0
        },
        sticker_pos = {
            x = 1,
            y = 0
        },
        colour = G.C.WHITE,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[2] = {
        name = "Red Stake",
        key = "stake_red",
        original_key = "red",
        applied_stakes = {"white"},
        atlas = "chips",
        pos = {
            x = 1,
            y = 0
        },
        sticker_pos = {
            x = 2,
            y = 0
        },
        modifiers = function()
            G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
            G.GAME.modifiers.no_blind_reward.Small = true
        end,
        colour = G.C.RED,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[3] = {
        name = "Green Stake",
        key = "stake_green",
        original_key = "green",
        applied_stakes = {"red"},
        atlas = "chips",
        pos = {
            x = 2,
            y = 0
        },
        sticker_pos = {
            x = 3,
            y = 0
        },
        modifiers = function()
            G.GAME.modifiers.scaling = math.max(G.GAME.modifiers.scaling or 0, 2)
        end,
        colour = G.C.GREEN,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[4] = {
        name = "Black Stake",
        key = "stake_black",
        original_key = "black",
        applied_stakes = {"green"},
        atlas = "chips",
        pos = {
            x = 4,
            y = 0
        },
        sticker_pos = {
            x = 0,
            y = 1
        },
        modifiers = function()
            G.GAME.modifiers.enable_eternals_in_shop = true
        end,
        colour = G.C.BLACK,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[5] = {
        name = "Blue Stake",
        key = "stake_blue",
        original_key = "blue",
        applied_stakes = {"black"},
        atlas = "chips",
        pos = {
            x = 3,
            y = 0
        },
        sticker_pos = {
            x = 4,
            y = 0
        },
        modifiers = function()
            G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
        end,
        colour = G.C.BLUE,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[6] = {
        name = "Purple Stake",
        key = "stake_purple",
        original_key = "purple",
        applied_stakes = {"blue"},
        atlas = "chips",
        pos = {
            x = 0,
            y = 1
        },
        sticker_pos = {
            x = 1,
            y = 1
        },
        modifiers = function()
            G.GAME.modifiers.scaling = math.max(G.GAME.modifiers.scaling or 0, 3)
        end,
        colour = G.C.PURPLE,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[7] = {
        name = "Orange Stake",
        key = "stake_orange",
        original_key = "orange",
        applied_stakes = {"purple"},
        atlas = "chips",
        pos = {
            x = 1,
            y = 1
        },
        sticker_pos = {
            x = 2,
            y = 1
        },
        modifiers = function()
            G.GAME.modifiers.enable_perishables_in_shop = true
        end,
        colour = G.C.ORANGE,
        shiny = false,
        loc_txt = {}
    }

    _defaul_stakes[8] = {
        name = "Gold Stake",
        key = "stake_gold",
        original_key = "gold",
        applied_stakes = {"orange"},
        atlas = "chips",
        pos = {
            x = 2,
            y = 1
        },
        sticker_pos = {
            x = 3,
            y = 1
        },
        modifiers = function()
            G.GAME.modifiers.enable_rentals_in_shop = true
        end,
        colour = G.C.GOLD,
        shiny = true,
        loc_txt = {}
    }

    -- create a copy of included stake list
    local _stake_list = {}
    for i = 1, #G.AP.slot_data.included_stakes, 1 do
        _stake_list[i] = G.AP.slot_data.included_stakes[i]
    end

    -- insert unused stakes at the end of the list
    -- (we must have all 8 stakes existing, otherwise
    -- the game crashes when trying to apply a nonexistent stake)
    --      (^ could be solved by rerouting the applied stakes)
    --      (but that changes the difficulties of the stakes)
    for i = 1, 8, 1 do
        if not tableContains(_stake_list, i) then
            _stake_list[#_stake_list + 1] = i
        end
    end

    for i = 1, 8, 1 do
        -- just copy these values
        G.P_CENTER_POOLS.Stake[i].name = _defaul_stakes[_stake_list[i]].name
        G.P_CENTER_POOLS.Stake[i].key = _defaul_stakes[_stake_list[i]].key
        G.P_CENTER_POOLS.Stake[i].original_key = _defaul_stakes[_stake_list[i]].original_key
        G.P_CENTER_POOLS.Stake[i].applied_stakes = _defaul_stakes[_stake_list[i]].applied_stakes
        G.P_CENTER_POOLS.Stake[i].atlas = _defaul_stakes[_stake_list[i]].atlas
        G.P_CENTER_POOLS.Stake[i].pos = _defaul_stakes[_stake_list[i]].pos
        G.P_CENTER_POOLS.Stake[i].sticker_pos = _defaul_stakes[_stake_list[i]].sticker_pos
        G.P_CENTER_POOLS.Stake[i].modifiers = _defaul_stakes[_stake_list[i]].modifiers
        G.P_CENTER_POOLS.Stake[i].colour = _defaul_stakes[_stake_list[i]].colour
        G.P_CENTER_POOLS.Stake[i].shiny = _defaul_stakes[_stake_list[i]].shiny
        G.P_CENTER_POOLS.Stake[i].loc_txt = _defaul_stakes[_stake_list[i]].loc_txt
        G.P_CENTER_POOLS.Stake[i].stake_level = _stake_list[i]

        -- read global unlock from the profile
        G.P_CENTER_POOLS.Stake[i].unlocked = G.PROFILES[G.AP.profile_Id].stake_unlocks[i]

        -- set the unlocked stake data if not last in/outside of included list
        G.P_CENTER_POOLS.Stake[i].unlocked_stake = i < #G.AP.slot_data.included_stakes and
                                                       _defaul_stakes[_stake_list[i + 1]].original_key or nil
    end

    -- remove excess stakes generated by other mods
    while #G.P_CENTER_POOLS.Stake > 8 do
        table.remove(G.P_CENTER_POOLS.Stake, #G.P_CENTER_POOLS.Stake)
    end

    -- update the colors
    for i = 1, #G.P_CENTER_POOLS.Stake do
        G.C.STAKES[i] = G.P_CENTER_POOLS.Stake[i].colour or G.C.WHITE
    end

    -- empty queue
    for i = 1, #G.AP.StakeQueue do
        if type(G.AP.StakeQueue[i]) == "table" then
            G.FUNCS.AP_unlock_stake_per_deck(G.AP.StakeQueue[i].stake, G.AP.StakeQueue[i].deck)
        elseif type(G.AP.StakeQueue[i]) == "string" then
            G.FUNCS.AP_unlock_stake(G.AP.StakeQueue[i])
        end
    end

    G.AP.StakeQueue = {}
    G.AP.StakesInit = true
end

-- Reinject Stakes upon disconnect
local SMODSstake_inject_classRef = SMODS.Stake.inject_class
SMODS.Stake.inject_class = function(self)
    if G.AP and G.AP.StakesInit then
        self.injected = false
        G.AP.StakesInit = false
    end
    SMODSstake_inject_classRef(self)
end

function check_stake_unlock(_stake, _deck_key)
    -- [Mode 0] all unlocked mode
    if tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(0) then
        return true
    end

    -- [Mode 1] linear progression (vanilla)
    -- (beating a stake unlocks the next one in the list)
    -- (per deck)
    if tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(1) then
        if G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key] then
            local _stake_progress = 0
            for k, v in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key].wins) do
                _stake_progress = math.max(_stake_progress, k)
            end

            if _stake <= _stake_progress + 1 then
                return true
            end
        elseif _stake == 1 then
            return true
        end

        return false
    end

    -- [Mode 2] global unlocks
    -- (stakes are unlocked if their .unlocked exists and is true)
    -- stakes are items
    if tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(2) then
        if G.P_CENTER_POOLS.Stake[_stake].unlocked then
            return G.P_CENTER_POOLS.Stake[_stake].unlocked
        end

        return false
    end

    -- [Mode 3] individual unlocks
    -- (stakes are unlocked if their entry in deck_usage.stake_unlocks exists and is true)
    -- stakes are items for each deck; the decks themselves are not items
    if tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(3) then
        if G.PROFILES[G.SETTINGS.profile].deck_usage and G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key] and
            G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key].stake_unlocks then
            return G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key].stake_unlocks[_stake] or false
        end

    end

    return false
end

local GUIDEFrun_setup_option = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(type)
    if isAPProfileLoaded() then

        if not G.SAVED_GAME then
            G.SAVED_GAME = get_compressed(G.SETTINGS.profile .. '/' .. 'save.jkr')
            if G.SAVED_GAME ~= nil then
                G.SAVED_GAME = STR_UNPACK(G.SAVED_GAME)
            end
        end

        -- fix AP stake cursor when viewing the continue screen
        if G.SAVED_GAME ~= nil then
            saved_game = G.SAVED_GAME
            G.viewed_stake = saved_game.GAME.stake or 1
            G.viewed_stake_act[2] = saved_game.GAME.stake or 1
            G.viewed_stake_act[1] = 0
        end
    end
    return GUIDEFrun_setup_option(type)
end

local UIDEF_deck_stake_columnRef = G.UIDEF.deck_stake_column
function G.UIDEF.deck_stake_column(_deck_key)
    -- hijack to use custom logic in AP
    if isAPProfileLoaded() then
        local deck_usage = G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key]
        local stake_col = {}
        local valid_option = nil
        local num_stakes = #G.AP.slot_data.included_stakes

        for i = num_stakes, 1, -1 do
            valid_option = false
            local _wins = deck_usage and deck_usage.wins[i] or 0
            if check_stake_unlock(i, _deck_key) == true then
                valid_option = true
            end

            stake_col[#stake_col + 1] = {
                n = G.UIT.R,
                config = {
                    id = i,
                    align = "cm",
                    colour = _wins > 0 and G.C.GREY or G.C.CLEAR,
                    outline = 0,
                    outline_colour = G.C.WHITE,
                    r = 0.1,
                    minh = 2 / 8,
                    minw = valid_option and 0.45 or 0.25,
                    func = 'RUN_SETUP_check_back_stake_highlight'
                },
                nodes = {{
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        minh = valid_option and 1.36 / 8 or 1.04 / 8,
                        minw = valid_option and 0.37 or 0.13,
                        colour = _wins > 0 and get_stake_col(i) or G.C.UI.TRANSPARENT_LIGHT,
                        r = 0.1
                    },
                    nodes = {}
                }}
            }
            if i > 1 then
                stake_col[#stake_col + 1] = {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        minh = 0.8 / 8,
                        minw = 0.04
                    },
                    nodes = {}
                }
            end
        end
        return {
            n = G.UIT.ROOT,
            config = {
                align = 'cm',
                colour = G.C.CLEAR
            },
            nodes = stake_col
        }
    else
        return UIDEF_deck_stake_columnRef(_deck_key)
    end
end

local stake_optionRef = G.UIDEF.stake_option
function G.UIDEF.stake_option(_type)
    -- hijack the logic when AP is loaded
    if isAPProfileLoaded() then
        local middle = {
            n = G.UIT.R,
            config = {
                align = "cm",
                minh = 1.7,
                minw = 7.3
            },
            nodes = {{
                n = G.UIT.O,
                config = {
                    id = nil,
                    func = 'RUN_SETUP_check_stake2',
                    object = Moveable()
                }
            }}
        }

        local stake_options = {}
        -- add unlocked stakes as options
        for i = 1, #G.AP.slot_data.included_stakes, 1 do
            if check_stake_unlock(i, G.GAME.viewed_back.effect.center.key) == true then
                stake_options[#stake_options + 1] = i
            end
        end

        -- when everything is locked, force the cursor into the bottom slot
        if #stake_options == 0 then
            G.viewed_stake = 1
            G.viewed_stake_act[1] = 1
            G.viewed_stake_act[2] = G.viewed_stake_act[2]
        else
            G.viewed_stake_act[2] = G.viewed_stake_act[2] or 1
            local _failsafe = true
            for i = 1, #stake_options, 1 do
                if stake_options[i] <= G.viewed_stake_act[2] then
                    G.viewed_stake_act[1] = i
                    _failsafe = false
                end
            end

            if _failsafe == true and tableContains(stake_options, G.viewed_stake_act[2]) == false then
                G.viewed_stake_act[1] = 1
            end

            G.viewed_stake = stake_options[G.viewed_stake_act[1]]
            G.viewed_stake_act[2] = stake_options[G.viewed_stake_act[1]]
        end

        return {
            n = G.UIT.ROOT,
            config = {
                align = "tm",
                colour = G.C.CLEAR,
                minh = 2.03,
                minw = 8.3
            },
            nodes = {_type == 'Continue' and middle or create_option_cycle({
                options = stake_options,
                opt_callback = 'change_stake',
                current_option = G.viewed_stake_act[1],
                colour = G.C.RED,
                w = 6,
                mid = middle
            })}
        }
    else
        return stake_optionRef(_type)
    end
end


local GUIDEFviewed_stake_optionRef = G.UIDEF.viewed_stake_option
function G.UIDEF.viewed_stake_option()
    if isAPProfileLoaded() then
        G.viewed_stake = G.viewed_stake or 1
        G.viewed_stake_act[1] = G.viewed_stake_act[1] or 1
        G.viewed_stake_act[2] = G.viewed_stake_act[2] or 1

        if _type ~= 'Continue' then
            G.PROFILES[G.SETTINGS.profile].MEMORY.stake = G.viewed_stake
        end

        local stake_sprite = get_stake_sprite(G.viewed_stake)

        return {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                colour = G.C.BLACK,
                r = 0.1
            },
            nodes = {{
                n = G.UIT.C,
                config = {
                    align = "cm",
                    padding = 0
                },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        text = localize('k_stake'),
                        scale = 0.4,
                        colour = G.C.L_BLACK,
                        vert = true
                    }
                }}
            }, {
                n = G.UIT.C,
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {{
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        padding = 0
                    },
                    nodes = {{
                        n = G.UIT.O,
                        config = {
                            colour = G.C.BLUE,
                            object = stake_sprite,
                            hover = true,
                            can_collide = false
                        }
                    }}
                }, G.UIDEF.stake_description(G.viewed_stake)}
            }}
        }
    else
        return GUIDEFviewed_stake_optionRef()
    end
end

-- cursor logic
local GFUNCSchange_stakeRef = G.FUNCS.change_stake
G.FUNCS.change_stake = function(args)
    if isAPProfileLoaded() then
        local valid_stakes = {}
        for i = 1, #G.AP.slot_data.included_stakes, 1 do
            if check_stake_unlock(i, G.GAME.viewed_back.effect.center.key) == true then
                valid_stakes[#valid_stakes + 1] = i
            end
        end

        if args.cycle_config then
            G.viewed_stake_act[1] = args.to_key
            G.viewed_stake_act[2] = valid_stakes[G.viewed_stake_act[1]]
        else
            for k, v in pairs(valid_stakes) do
                if v == args.to_key then
                    G.viewed_stake_act[1] = k
                    G.viewed_stake_act[2] = valid_stakes[G.viewed_stake_act[1]]
                    break
                end
            end
        end

        if #valid_stakes == 0 then
            G.viewed_stake = 1
            G.viewed_stake_act[1] = 1
            G.viewed_stake_act[2] = 1
            G.PROFILES[G.SETTINGS.profile].MEMORY.stake = 1
        else
            G.viewed_stake = valid_stakes[G.viewed_stake_act[1]]
            G.PROFILES[G.SETTINGS.profile].MEMORY.stake = G.viewed_stake
            G.viewed_stake_act[2] = valid_stakes[G.viewed_stake_act[1]]
        end
    else
        return GFUNCSchange_stakeRef(args)
    end
end

-- handle stakes (stuff that can be easily handled by patches)
-- white highlight on stake selection
local GFUNCSRUN_SETUP_check_back_stake_highlightRef = G.FUNCS.RUN_SETUP_check_back_stake_highlight
G.FUNCS.RUN_SETUP_check_back_stake_highlight = function(e)
    if isAPProfileLoaded() then
        if G.viewed_stake_act[2] == e.config.id and e.config.outline < 0.1 then
            e.config.outline =
                check_stake_unlock(G.viewed_stake_act[2], G.GAME.viewed_back.effect.center.key) == true and 0.8 or 0
        elseif G.viewed_stake_act[2] ~= e.config.id and e.config.outline > 0.1 then
            e.config.outline = 0
        end
    else
        return GFUNCSRUN_SETUP_check_back_stake_highlightRef(e)
    end
end

-- stakes button
local GUIDEFrun_infoRef = G.UIDEF.run_info
function G.UIDEF.run_info()
    local _run_info = nil

    if isAPProfileLoaded() then
        local _stake_slot = G.GAME.stake
        G.GAME.stake = G.P_CENTER_POOLS.Stake[_stake_slot].stake_level
        _run_info = GUIDEFrun_infoRef()
        G.GAME.stake = _stake_slot
    end

    if _run_info == nil then
        _run_info = GUIDEFrun_infoRef()
    end

    return _run_info
end

-- "also applies" in stakes menu
local GUIDEFcurrent_stakeRef = G.UIDEF.current_stake
function G.UIDEF.current_stake()
    local _current_stake = GUIDEFcurrent_stakeRef()

    if isAPProfileLoaded() then
        if G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level < 3 then
            _current_stake.nodes[2] = nil
        else
            other_col = nil

            local stake_desc_rows = {{
                n = G.UIT.R,
                config = {
                    align = "cm",
                    padding = 0.05
                },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        text = localize('k_also_applied'),
                        scale = 0.4,
                        colour = G.C.WHITE
                    }
                }}
            }}

            local _applied_stakes = {}
            for i = G.P_CENTER_POOLS.Stake[G.GAME.stake].stake_level - 1, 1, -1 do
                for k, v in pairs(G.P_CENTER_POOLS.Stake) do
                    if v.stake_level == i then
                        _applied_stakes[i] = k
                        break
                    end
                end
            end

            for i = #_applied_stakes, 2, -1 do
                local _stake_desc = {}
                local _stake_center = G.P_CENTER_POOLS.Stake[_applied_stakes[i]]

                localize {
                    type = 'descriptions',
                    key = _stake_center.key,
                    set = _stake_center.set,
                    nodes = _stake_desc
                }
                local _full_desc = {}
                for k, v in ipairs(_stake_desc) do
                    _full_desc[#_full_desc + 1] = {
                        n = G.UIT.R,
                        config = {
                            align = "cm"
                        },
                        nodes = v
                    }
                end
                _full_desc[#_full_desc] = nil -- remove to show "also applies previous stakes"
                stake_desc_rows[#stake_desc_rows + 1] = {
                    n = G.UIT.R,
                    config = {
                        align = "cm"
                    },
                    nodes = {{
                        n = G.UIT.C,
                        config = {
                            align = 'cm'
                        },
                        nodes = {{
                            n = G.UIT.C,
                            config = {
                                align = "cm",
                                colour = get_stake_col(_applied_stakes[i]),
                                r = 0.1,
                                minh = 0.35,
                                minw = 0.35,
                                emboss = 0.05
                            },
                            nodes = {}
                        }, {
                            n = G.UIT.B,
                            config = {
                                w = 0.1,
                                h = 0.1
                            }
                        }}
                    }, {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            padding = 0.03,
                            colour = G.C.WHITE,
                            r = 0.1,
                            minh = 0.7,
                            minw = 4.8
                        },
                        nodes = _full_desc
                    }}
                }
            end

            other_col = {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    padding = 0.05,
                    r = 0.1,
                    colour = G.C.L_BLACK
                },
                nodes = stake_desc_rows
            }
            _current_stake.nodes[2] = other_col
        end
    end

    return _current_stake
end

-- setup stake before run
local SMODSsetup_stakeRef = SMODS.setup_stake
function SMODS.setup_stake(i)
    if isAPProfileLoaded() then
        if G.P_CENTER_POOLS['Stake'][i].modifiers then
            G.P_CENTER_POOLS['Stake'][i].modifiers()
        end
        if G.P_CENTER_POOLS['Stake'][i].applied_stakes then
            for k, v in pairs(G.P_CENTER_POOLS['Stake']) do
                if v.original_key == G.P_CENTER_POOLS['Stake'][i].applied_stakes[1] then
                    SMODS.setup_stake(k)
                    break
                end
            end
        end
    else
        SMODSsetup_stakeRef(i)
    end
end

-- deck win stickers (check stake level instead of slot)
local get_deck_win_stickerRef = get_deck_win_sticker
function get_deck_win_sticker(_center)
    if isAPProfileLoaded() then
        if G.PROFILES[G.SETTINGS.profile].deck_usage[_center.key] and
            G.PROFILES[G.SETTINGS.profile].deck_usage[_center.key].wins then
            local _w = -1
            for k, v in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage[_center.key].wins) do
                if v > 0 then
                    _w = math.max(G.P_CENTER_POOLS.Stake[k].stake_level, _w)
                end
            end
            if _w > 0 then
                return G.sticker_map[_w]
            end
        end
    else
        return get_deck_win_stickerRef(_center)
    end
end

-- joker win stickers (check stake level instead of slot)
local get_joker_win_stickerRef = get_joker_win_sticker
function get_joker_win_sticker(_center, index)
    if isAPProfileLoaded() then
        if G.PROFILES[G.SETTINGS.profile].joker_usage[_center.key] and
            G.PROFILES[G.SETTINGS.profile].joker_usage[_center.key].wins then
            local _w = 0
            for k, v in pairs(G.PROFILES[G.SETTINGS.profile].joker_usage[_center.key].wins) do
                _w = math.max(G.P_CENTER_POOLS.Stake[k].stake_level, _w)
            end
            if index then
                return _w
            end
            if _w > 0 then
                return G.sticker_map[_w]
            end
        end
        if index then
            return 0
        end
    else
        return get_joker_win_stickerRef(_center, index)
    end
end

-- set deck win (prevent higher stake wins from counting as a win for previous stakes)
local set_deck_winRef = set_deck_win
function set_deck_win()
    if isAPProfileLoaded() then
        if G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect.center and
            G.GAME.selected_back.effect.center.key then
            local deck_key = G.GAME.selected_back.effect.center.key
            if not G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] then
                G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] = {
                    count = 1,
                    order = G.GAME.selected_back.effect.center.order,
                    wins = {},
                    losses = {}
                }
            end
            if G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key] then
                G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].wins[G.GAME.stake] =
                    (G.PROFILES[G.SETTINGS.profile].deck_usage[deck_key].wins[G.GAME.stake] or 0) + 1
            end
            set_challenge_unlock()
            G:save_settings()
        end
    else
        return set_deck_winRef()
    end
end
