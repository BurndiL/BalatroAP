--- STEAMODDED HEADER
--- MOD_NAME: Randomizer
--- MOD_ID: Rando
--- MOD_AUTHOR: [Burndi, Silvris]
--- MOD_DESCRIPTION: Archipelago

----------------------------------------------
------------MOD CODE -------------------------

this_mod = SMODS.current_mod

require(this_mod.path .. "ap_connection")
require(this_mod.path .. "utils")
json = require(this_mod.path .. "json")
AP = require('lua-apclientpp')

G.FUNCS.APConnect = function()
    APConnect()
end

-- Profile interface
local isInProfileTabCreation = false
local isInProfileOptionCreation = false

local profileAP_Id = -1

local create_tabsRef = create_tabs
function create_tabs(args)
    -- when profile interface is created, add archipelago tab 
    if isInProfileTabCreation then 
        if profileAP_Id == -1 then
            profileAP_Id = #args.tabs+1
        end

        args.tabs[profileAP_Id] = {
                        label = "ARCHIPELAGO",
                        chosen = G.focused_profile == profileAP_Id,
                        tab_definition_function = G.UIDEF.profile_option,
                        tab_definition_function_args = profileAP_Id
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
        --sendDebugMessage("Is not null: " .. tostring(#ui_letters))

        if #ui_letters > 0 then  
            ui_letters[#ui_letters]['config']['id'] = 'position_'..args.prompt_text
        end
    end

    return create_text_input
end

local profile_optionRef = G.UIDEF.profile_option
function G.UIDEF.profile_option(_profile)
    G.focused_profile = _profile 
    if _profile == profileAP_Id then -- AP profile tab code
        
        isInProfileOptionCreation = true
        local t = {n=G.UIT.ROOT, config={align = 'cm', colour = G.C.CLEAR}, nodes={
        {n=G.UIT.R, config={align = 'cm',padding = 0.1, minh = 0.8}, nodes={
            ((_profile == G.SETTINGS.profile) or not profile_data) and {n=G.UIT.R, config={align = "cm"}, nodes={
                create_text_input({
                    w = 4, max_length = 16, prompt_text = 'Server Address',
                    -- normally saved values would go into ref table, maybe make json to save?
                    ref_table = G.AP, ref_value = 'APAddress',extended_corpus = true, keyboard_offset = 1,
                    callback = function() 
                      -- code for when enter is hit (?)
                    end
                  }),
                  create_text_input({
                    w = 4, max_length = 16, prompt_text = 'PORT',
                    -- normally saved values would go into ref table, maybe make json to save?
                    ref_table = G.AP, ref_value = 'APPort',extended_corpus = false, keyboard_offset = 1,
                    callback = function() 
                      -- code for when enter is hit (?)
                    end
                  }),
                        
          }}
        }},
        {n=G.UIT.R, config={align = 'cm',padding = 0.1, minh = 0.8}, nodes={
            ((_profile == G.SETTINGS.profile) or not profile_data) and {n=G.UIT.R, config={align = "cm"}, nodes={
                create_text_input({
                    w = 4, max_length = 16, prompt_text = 'Slot name',
                    -- normally saved values would go into ref table, maybe make json to save?
                    ref_table = G.AP, ref_value = 'APSlot',extended_corpus = true, keyboard_offset = 1,
                    callback = function() 
                      -- code for when enter is hit (?)
                    end
                  }),
                  create_text_input({
                    w = 4, max_length = 16, prompt_text = 'Password',
                    -- normally saved values would go into ref table, maybe make json to save?
                    ref_table = G.AP, ref_value = 'APPassword',extended_corpus = true, keyboard_offset = 1,
                    callback = function() 
                      -- code for when enter is hit (?)
                    end
                  }),
                        
          }}
        }},
        UIBox_button({button = "APConnect", label = {"Connect"}, minw = 3, Func = G.FUNCS.APConnect})
      }} 
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
        love.graphics.print("Connected to Archipelago at ".. G.AP.APAddress .. G.AP.APPort.." as ".. G.AP.APSlot, 10, 30)
        --print("connected")
    else
        love.graphics.print("Not connected to Archipelago.", 10, 30)
    end

    return game_draw
end


-- load APSettings on startup

local game_load_profileRef = Game.load_profile
function Game.load_profile(args, _profile)
    local game_load_profile = game_load_profileRef(args, _profile)

    local APSettings = load_file('APSettings.json')

    APSettings = json.decode(APSettings)

    if APSettings ~= nil  then
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

    if args.type == 'ante_up' then
        -- when an ante is beaten
        if args.ante >= 8 then
            -- specify the deck
            if G.deck.name == 'red_deck' then -- (not sure if its actually called 'red_deck' lol)
                -- specify which stake
                if G.stake == 1 then
                    G.APClient:LocationChecks() -- put in corresponding ID
                end
                -- else......... (put in rest of checks)
            end
        end
    end

    -- also need to check for goal completions!

    
    -- if args.type == 'win' then
        
    --     --unlock_achievement('heads_up')
    --     if G.APClient ~= nil and G.APClient:get_state() == AP.State.SLOT_CONNECTED then
    --         G.APClient:StatusUpdate(AP.ClientStatus.GOAL)
    --     end
    -- end
    return check_for_unlock
end


-- fix turning '0' into 'o'
local zeroWasInput = false

local text_input_keyRef = G.FUNCS.text_input_key
function G.FUNCS.text_input_key(args)
    if args.key == '0' then zeroWasInput = true end

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
