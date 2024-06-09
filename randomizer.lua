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
-- load Balatro profile 
-- disconnect when other profile is loaded
-- parse AP messages 
-- map ids to checks
-- lock/unlock decks depending on AP 
-- FEATURES:
-- 
-- Traps: Discard random cards, boss blinds
-- Hint Pack
-- When Deathlink: joker will tell you the cause


this_mod = SMODS.current_mod

require(this_mod.path .. "ap_connection")
require(this_mod.path .. "utils")
json = require(this_mod.path .. "json")
AP = require('lua-apclientpp')

local isInProfileTabCreation = false
local isInProfileOptionCreation = false
G.AP.profile_Id = -1

function isAPProfileLoaded()
    return G.focused_profile == G.AP.profile_Id
end

G.FUNCS.APConnect = function()
    local APInfo = json.encode(G.AP)
    save_file('APSettings.json', APInfo)

    APConnect()
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
    if isAPProfileLoaded() then -- AP profile tab code

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
                        -- normally saved values would go into ref table, maybe make json to save?
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
                        -- normally saved values would go into ref table, maybe make json to save?
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
                        -- normally saved values would go into ref table, maybe make json to save?
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
                        -- normally saved values would go into ref table, maybe make json to save?
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
            })}
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

    return game_update
end

local game_drawRef = Game.draw
function Game.draw(args)
    local game_draw = game_drawRef(args)

    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        love.graphics.print("Connected to Archipelago at " .. G.AP.APAddress .. ":".. G.AP.APPort .. " as " .. G.AP.APSlot,
            10, 30)
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

    if G.AP.profile_Id == -1 then
        G.AP.profile_Id = #G.PROFILES + 1
        G.PROFILES[G.AP.profile_Id] = {}
        sendDebugMessage("Created AP Profile in Slot " .. tostring(G.AP.profile_Id))
    end

    local game_load_profile = game_load_profileRef(args, _profile)
    -- copy_uncrompessed("1/save.jkr")
    -- copy_uncrompessed("1/meta.jkr")
    -- copy_uncrompessed("1/profile.jkr")

    -- local i = 1
    -- while i <= #G.P_LOCKED do
    --     sendDebugMessage(tostring(G.P_LOCKED[i].key))
    --     i = i+1
    -- end



    local APSettings = load_file('APSettings.json')

    APSettings = json.decode(APSettings)

    if APSettings ~= nil then
        G.AP.APSlot = APSettings['APSlot']
        G.AP.APAddress = APSettings['APAddress']
        G.AP.APPort = APSettings['APPort']
        G.AP.APPassword = APSettings['APPassword']
    end

    return game_load_profile
end

-- other stuff 

-- (not tested)
-- Here you can unlock checks

local check_for_unlockRef = check_for_unlock
function check_for_unlock(args)
    local check_for_unlock = check_for_unlockRef(args)
    if isAPProfileLoaded() then
        if args.type == 'ante_up' then
            sendDebugMessage("args.type is ante_up")
            -- when an ante is beaten
            local deck_name = G.GAME.selected_back.name
            local stake = get_deck_win_stake()

            sendDebugMessage("deck_name is " .. deck_name)
            -- specify the deck
            if deck_name == 'Red Deck' then          
                sendLocationCleared(G.AP.id_offset + (args.ante-1) * 8 + (G.GAME.stake-1))            
            elseif deck_name == 'Blue Deck' then
                sendLocationCleared(G.AP.id_offset + 64 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Yellow Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 2 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Green Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 3 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Black Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 4 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Magic Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 5 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Nebula Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 6 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Ghost Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 7 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Abandoned Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 8 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Checkered Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 9 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Zodiac Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 10 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Painted Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 11 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Anaglyph Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 12 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Plasma Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 13 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            elseif deck_name == 'Erratic Deck' then
                sendLocationCleared(G.AP.id_offset + 64 * 14 + (args.ante-1) * 8 + (G.GAME.stake-1))  
            end            
        end
    
        -- also need to check for goal completions!
    end
    
    return check_for_unlock
end

function sendLocationCleared(id)
    if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
        sendDebugMessage("sendLocationCleared: " .. tostring(id))
        sendDebugMessage("Queuing LocationCheck was successful: ".. tostring(G.APClient:LocationChecks({id})))
    end
end

-- Unlock Decks from received items

G.FUNCS.set_up_APProfile = function()
    
    sendDebugMessage("set_up_APProfile called")

    G.AP.unlocked_backs = {}


end


-- I couldnt for the life of me figure out how else to easily lock decks, 
-- so i feel like this is a hacky but intuitive solution.

local back_generate_UIRef = Back.generate_UI
function Back.generate_UI(args, other, ui_scale, min_dims, challenge)

    if isAPProfileLoaded() then        
        local back_name = args["name"]
        args.effect.center.unlocked = G.AP.unlocked_backs[back_name] == true
        -- sendDebugMessage(args["name"] .. " is unlocked: " .. tostring(args.effect.center.unlocked))

    end

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
