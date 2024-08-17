-- Config Tab
SMODS.current_mod.config_tab = function(_from_profile)
	local innards = {
				n = G.UIT.C,
				nodes = {
					create_option_cycle({ -- connection status info cycle
						label = localize('k_ap_connection_status'),
						current_option = G.AP.this_mod.config.connection_status,
						options = localize('k_ap_connection_status_options'),
						ref_table = G.AP.this_mod.config, 
						ref_value = 'connection_status',
						colour = G.AP.this_mod.badge_colour,
						text_scale = 0.4,
						scale = 0.8,
						w = 4,
						opt_callback = 'update_ap_config'
					}),
					create_option_cycle({ -- deathlink cycle
						label = localize('k_ap_deathlink'),
						current_option = G.AP.this_mod.config.deathlink,
						options = localize('k_ap_deathlink_options'),
						ref_table = G.AP.this_mod.config, 
						ref_value = 'deathlink',
						colour = G.AP.this_mod.badge_colour,
						text_scale = 0.4,
						scale = 0.8,
						w = 4,
						opt_callback = 'update_ap_config'
					}),
					-- Notice for unchangable options when connected
					isAPProfileLoaded() and { 
						n = G.UIT.R,
						config = {
							colour = G.C.CLEAR,
							align = 'tm',
							padding = 0.2
						},
						nodes = {{
							n = G.UIT.T,
							config = {
								align = 'tm',
								scale = 0.3,
								text = localize('k_ap_cant_change')
							}
						}}
					} or nil,
					-- when connected, create a list of currently chosen options
					isAPProfileLoaded() and list_ap_option({
						label = 'k_ap_locked_jokers',
						options = 'k_ap_locked_options',
						current_option = G.AP.this_mod.config.jokers
					}) or nil,
					isAPProfileLoaded() and list_ap_option({
						label = 'k_ap_locked_consums',
						options = 'k_ap_locked_options',
						current_option = G.AP.this_mod.config.consumables
					}) or nil,
					-- when not connected, create cycles
					not isAPProfileLoaded() and {
						n = G.UIT.R,
						config = {
							colour = G.C.CLEAR,
						},
						nodes = {
							{
								n = G.UIT.C,
								config = {
									colour = G.C.CLEAR,
								},
								nodes = {
									create_option_cycle({
										label = localize('k_ap_locked_jokers'),
										current_option = G.AP.this_mod.config.jokers,
										options = localize('k_ap_locked_options'),
										ref_table = G.AP.this_mod.config, 
										ref_value = 'jokers',
										colour = G.C.DARK_EDITION,
										text_scale = 0.4,
										scale = 0.8,
										w = 3,
										opt_callback = 'update_ap_config'
									})
								}
							},
							{
								n = G.UIT.C,
								config = {
									colour = G.C.CLEAR,
								},
								nodes = {
									create_option_cycle({
										label = localize('k_ap_locked_consums'),
										current_option = G.AP.this_mod.config.consumables,
										options = localize('k_ap_locked_options'),
										ref_table = G.AP.this_mod.config, 
										ref_value = 'consumables',
										colour = G.C.DARK_EDITION,
										text_scale = 0.4,
										scale = 0.8,
										w = 3,
										opt_callback = 'update_ap_config'
									})
								}
							},
							
						}
					} or nil, --Modded item notice and cycle
					isAPProfileLoaded() and list_ap_option({
						label = 'k_ap_modded_items',
						options = 'k_ap_modded_items_options',
						current_option = G.AP.this_mod.config.modded
					}) or
					create_option_cycle({
						label = localize('k_ap_modded_items'),
						current_option = G.AP.this_mod.config.modded,
						options = localize('k_ap_modded_items_options'),
						ref_table = G.AP.this_mod.config, 
						ref_value = 'modded',
						colour = G.AP.this_mod.badge_colour,
						text_scale = 0.4,
						scale = 0.8,
						w = 4,
						opt_callback = 'update_ap_config'
					}),
				}
			}
	
	local root = not _from_profile and {
		n = G.UIT.ROOT, 
		config = {
			r = 0.1, 
			minw = 8, 
			minh = 6, 
			align = "tm", 
			padding = 0.2, 
			colour = G.C.BLACK
		},
		nodes = {innards}
	-- non-smods version of the window
	-- for the profile selector
	} or create_UIBox_generic_options({
		back_func = 'go_to_ap_tab',
		contents = {{
			n = G.UIT.R, 
			config = {
				r = 0.1, 
				minw = 8, 
				minh = 6, 
				align = "tm", 
				padding = 0.2, 
				colour = G.C.BLACK
			},
			nodes = {innards}
		}}
	})
	
	return root
end

-- new goal ui
function create_AP_text()
	
	local t = {
		n = G.UIT.ROOT,
		config = {
			minw = 10,
			colour = G.C.CLEAR,
			align = 'tm'
		},
		nodes = {
			{
				n = G.UIT.C,
				config = {
					colour = G.C.BLACK,
					r = 0.1,
					padding = 0.3
				},
				nodes = {
					G.AP.this_mod.config.connection_status ~= 4 and {
						n = G.UIT.R,
						config = {
							align = 'cm'
						},
						nodes = {
							{
								n = G.UIT.T,
								config = {
									text = 'status',
									scale = 0.3,
									id = "status_text",
									colour = G.C.JOKER_GREY
								}
							}
						}
					} or nil, isAPProfileLoaded() and {
						n = G.UIT.R,
						config = {
							align = 'cm'
						},
						nodes = {
							{
								n = G.UIT.T,
								config = {
									text = 'goal',
									scale = 0.45,
									id = "goal_text"
								}
							}
						}
					} or nil,
				}
			}
		}
	}
	
	return t
end

local set_main_menu_UIRef = set_main_menu_UI
function set_main_menu_UI()
	set_main_menu_UIRef()
	set_ap_text_UI()
	if (G.AP.this_mod.config.connection_status > 1 and not isAPProfileLoaded()) then
			G.AP.status_text.states.visible = false
	end
end

function set_ap_text_UI(_from_config)
	if G.AP.status_text then G.AP.status_text:remove(); G.AP.status_text = nil end
	G.AP.status_text = UIBox{
        definition = create_AP_text(), 
        config = {align="tmi", offset = {x=0,y=_from_config and 0 or -10}, major = G.ROOM_ATTACH, bond = 'Weak'}
    }
	G.AP.status_text.alignment.offset.y = 0
    G.AP.status_text:align_to_major()
end

-- remove the status text when needed
local delete_runRef = Game.delete_run
function Game:delete_run()
	if self.ROOM then
		if G.AP.status_text then G.AP.status_text:remove(); G.AP.status_text = nil end
	end
	delete_runRef(self)
end

-- 'Connect' tab in config to go directly to AP profile
SMODS.current_mod.extra_tabs = function()
	if isAPProfileLoaded() then
		return {}
	end
	return {
		label = localize('b_ap_connect'),
		tab_definition_function = function()
			G.FUNCS.go_to_ap_tab()
			return {
				n = G.UIT.ROOT, 
				config = {
					r = 0.1, 
					minw = 8, 
					minh = 6, 
					align = "tm", 
					padding = 0.2, 
					colour = G.C.BLACK
				},
				nodes = {}
			}
		end
	}
end

function G.FUNCS.go_to_ap_tab()
	-- create AP profile if it doesnt exist
	if G.AP.profile_Id == -1 then
        G.AP.profile_Id = #G.PROFILES + 1
        G.PROFILES[G.AP.profile_Id] = {}
        sendDebugMessage("Created AP Profile in Slot " .. tostring(G.AP.profile_Id))
		
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
	
	-- save config
	SMODS.save_mod_config(G.AP.this_mod)
	-- go to ap tab in profile selector
	G.focused_profile = (G.AP.profile_Id) or G.SETTINGS.profile or 1
	G.FUNCS.overlay_menu{
		definition = G.UIDEF.profile_select(),
	}
end

-- handle config button in ap profile
G.FUNCS.can_config_AP_profile = function(e)
    if (G.APClient and G.APClient:get_state() == AP.State.SOCKET_CONNECTING) then
        G.AP.CHECK_PROFILE_DATA = false
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RED
        e.config.button = 'ap_config'
    end
end

-- create text listing currently chosen unchangable
-- options for looking at config while connected
function list_ap_option(args)
	return {
		n = G.UIT.R,
		config = {
			colour = G.C.CLEAR,
			align = 'bm',
			padding = 0.1
		},
		nodes = {{
			n = G.UIT.T,
			config = {
				align = 'bm',
				colour = G.C.JOKER_GREY,
				scale = 0.4,
				text = "["..localize(args.label).."] - "..localize(args.options)[args.current_option]
			}}
		}
	}
end

--update config function
G.FUNCS.update_ap_config = function(args)
	args = args or {}
    if args.cycle_config and args.cycle_config.ref_table and args.cycle_config.ref_value then
        args.cycle_config.ref_table[args.cycle_config.ref_value] = args.to_key
		
		-- update deathlink when connected
		if args.cycle_config.ref_value == 'deathlink' and isAPProfileLoaded() then
			local tags = {"Lua-APClientPP"}
			if (IsDeathlinkOn()) then
				tags[#tags + 1] = "DeathLink"
			end

			G.APClient:ConnectUpdate(nil, tags)
		end
		
		-- update the status text
		if args.cycle_config.ref_value == 'connection_status' and G.AP.status_text then
			if (G.AP.this_mod.config.connection_status > 1 and not isAPProfileLoaded()) then
				G.AP.status_text.states.visible = false
			else
				G.AP.status_text.states.visible = true
			end
			
			if isAPProfileLoaded() then
				local status = G.AP.status_text:get_UIE_by_ID('status_text')
				if (status and G.AP.this_mod.config.connection_status == 4) or 
					(not status and G.AP.this_mod.config.connection_status ~= 4) then
						set_ap_text_UI(true)
				end
			end
			
		end
    end
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
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = 'cm',
						padding = 0.4,
					},
					nodes = {
						{
							n = G.UIT.C,
							config = {
								align = 'cm',
							},
							nodes = {
								{n=G.UIT.R, config = {align = "cm", padding = 0.05}, nodes={
									{n=G.UIT.T, config={text = localize('k_ap_IP'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
								}}, {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes={create_text_input({
									w = 4,
									max_length = 35,
									prompt_text = localize('k_ap_IP'),
									ref_table = G.AP,
									ref_value = 'APAddress',
									extended_corpus = true,
									keyboard_offset = 1,
									callback = function()
										-- code for when enter is hit (?)
									end
								})}}, {n=G.UIT.R, config = {align = "cm", padding = 0.05}, nodes={
									{n=G.UIT.T, config={text = localize('k_ap_slot'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
								}}, {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes={create_text_input({
									w = 4,
									max_length = 35,
									prompt_text = localize('k_ap_slot'),
									ref_table = G.AP,
									ref_value = 'APSlot',
									extended_corpus = true,
									keyboard_offset = 1,
									callback = function()
									end
								})}}
							}
						}, {
							n = G.UIT.C,
							config = {
								align = 'cm',
							},
							nodes = {
								{n=G.UIT.R, config = {align = "cm", padding = 0.05}, nodes={
									{n=G.UIT.T, config={text = localize('k_ap_port'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
								}}, {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes={ create_text_input({
									w = 4,
									max_length = 35,
									prompt_text = localize('k_ap_port'),
									ref_table = G.AP,
									ref_value = 'APPort',
									extended_corpus = false,
									keyboard_offset = 1,
									callback = function()
									end
								})}}, {n=G.UIT.R, config = {align = "cm", padding = 0.05}, nodes={
									{n=G.UIT.T, config={text = localize('k_ap_pass'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
								}}, {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes={ create_text_input({
									w = 4,
									max_length = 35,
									prompt_text = localize('k_ap_pass'),
									ref_table = G.AP,
									ref_value = 'APPassword',
									extended_corpus = true,
									keyboard_offset = 1,
									callback = function()
									end
								})}}
							}
						},
					}
				}, UIBox_button({
					button = "APConnect",
					label = {localize("b_ap_connect")},
					minw = 5,
					func = "can_APConnect"
				}),{
					n = G.UIT.R,
					config = {
						align = 'cm',
						padding = 0,
					},
					nodes = {
						{
							n = G.UIT.C,
							config = {
								align = 'cm',
							},
							nodes = {
								{n=G.UIT.R, config = {align = "cm", padding = 0}, nodes={
									{
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
												minw = 2.5,
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
									}
								}}
							}
						}, {
							n = G.UIT.C,
							config = {
								align = 'cm',
							},
							nodes = {
								{n=G.UIT.R, config = {align = "cm", padding = 0}, nodes={
									{
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
												minw = 2.5,
												maxw = 4,
												minh = 0.6,
												padding = 0.2,
												r = 0.1,
												hover = true,
												colour = G.C.RED,
												button = "ap_config",
												shadow = true,
												func = "can_config_AP_profile",
												focus_args = {
													nav = 'wide'
												}
											},
											nodes = {{
												n = G.UIT.T,
												config = {
													text = localize('b_config'),
													scale = 0.3,
													colour = G.C.UI.TEXT_LIGHT
												}
											}}
										}}
									}
								}}
							}
						},
					}
				},{
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
				}
			}
        }
        isInProfileOptionCreation = false
        return t

    else -- if not AP profile behave normally
        if not isAPProfileLoaded() then
            G.APClient = nil
            collectgarbage("collect")
        end
        local profile_option = profile_optionRef(_profile)
        return profile_option
    end

end

-- config tab in profile select
G.FUNCS.ap_config = function()
	G.FUNCS.overlay_menu({
		definition = G.AP.this_mod.config_tab(true)
	})
end

-- AP debuff and locked messages
local Cardgenerate_UIBox_ability_tableRef = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    if isAPProfileLoaded() then
        if self.debuff then -- debuff
            if self.config.center.ap_unlocked == false then
                G.localization.descriptions.Other.debuffed_default.text_parsed =
                    G.localization.descriptions.Other.ap_debuffed.text_parsed
            else
                if G.localization.descriptions.Other.debuffed_default.text_parsed ==
                    G.localization.descriptions.Other.ap_debuffed.text_parsed then
                    G.localization.descriptions.Other.debuffed_default.text_parsed = {}
                    for k, v in pairs(G.localization.descriptions.Other.debuffed_default.text) do
                        G.localization.descriptions.Other.debuffed_default.text_parsed[k] = loc_parse_string(v)
                    end
                end
            end
        end

        if self.config.center.unlocked == false then -- locked message
            if G.localization.descriptions.Other["ap_locked_" .. self.config.center.set] then
                G.localization.descriptions.Other.demo_locked.text_parsed = {}
                for k, v in pairs(G.localization.descriptions.Other["ap_locked_" .. self.config.center.set].text_parsed) do
                    G.localization.descriptions.Other.demo_locked.text_parsed[k] = v
                end
            end
            
            -- modded item locked message
            if G.AP.this_mod.config.modded == 2 and self.config.center.modded then
                G.localization.descriptions.Other.demo_locked.text_parsed = {}
                for k, v in pairs(G.localization.descriptions.Other["ap_locked_Modded"].text_parsed) do
                    G.localization.descriptions.Other.demo_locked.text_parsed[k] = v
                end
            end

            if self.config.center.set ~= "Booster" then
                G.localization.descriptions.Other.demo_locked.text_parsed[#G.localization.descriptions.Other
                    .demo_locked.text_parsed + 1] = loc_parse_string("{C:inactive,s:0.8}(" ..
                                                                         G.localization.descriptions[self.config
                                                                             .center.set][self.config.center.key]
                                                                             .name .. ")")
            else
                local _loc_target = nil
                for k, v in pairs(G.localization.descriptions.Other) do
                    if string.find(self.config.center.key, k) then
                        _loc_target = v
                        break
                    end
                end

                if _loc_target then
                    G.localization.descriptions.Other.demo_locked.text_parsed[#G.localization.descriptions.Other
                        .demo_locked.text_parsed + 1] = loc_parse_string(
                        "{C:inactive,s:0.8}(" .. _loc_target.name .. ")")
                end
            end
        end
    end
    return Cardgenerate_UIBox_ability_tableRef(self)
end

local create_unlock_overlayRef = create_unlock_overlay
function create_unlock_overlay(key)
    if isAPProfileLoaded() then
        return
    end
    return create_unlock_overlayRef(key)
end

local create_UIBox_notify_alertRef = create_UIBox_notify_alert
function create_UIBox_notify_alert(_achievement, _type)
    if isAPProfileLoaded() then

        local _c, _atlas = G.P_CENTERS[_achievement],
            _type == 'Stake' and G.ASSET_ATLAS["chips"] or tableContains({"Joker", "Voucher", "Booster"}, _type) and
                G.ASSET_ATLAS[_type] or tableContains({"Tarot", "Planet", "Spectral"}, _type) and G.ASSET_ATLAS["Tarot"] or
                tableContains({"Back", "BackStake"}, _type) and G.ASSET_ATLAS["centers"] or _type == "location" and
                G.ASSET_ATLAS["rand_ap_logo"] or G.ASSET_ATLAS["icons"]

        -- stake-specific _c
        if _type == 'Stake' then
            _c = {
                pos = {
                    x = 0,
                    y = 0
                }
            }
            for i = 1, 8, 1 do
                if G.P_CENTER_POOLS.Stake[i].key == _achievement then
                    _c.pos = G.P_CENTER_POOLS.Stake[i].pos
                    break
                end
            end
        end

        if _type == 'BackStake' then
            _c = {
                pos = {
                    x = 0,
                    y = 0
                },
                soul_pos = {
                    x = 0,
                    y = 0
                },
                name = "",
                name_2 = ""
            }
            for i = 1, 8, 1 do
                if string.find(_achievement, G.P_CENTER_POOLS.Stake[i].key) then
                    _c.soul_pos = G.P_CENTER_POOLS.Stake[i].sticker_pos
                    _c.name = localize {
                        type = "name_text",
                        key = G.P_CENTER_POOLS.Stake[i].key,
                        set = "Stake"
                    }
                    break
                end
            end

            for k, v in pairs(G.P_CENTER_POOLS.Back) do
                if string.find(_achievement, G.P_CENTER_POOLS.Back[k].key) then
                    _c.pos = G.P_CENTER_POOLS.Back[k].pos
                    _c.name_2 = "(" .. localize {
                        type = "name_text",
                        key = G.P_CENTER_POOLS.Back[k].key,
                        set = "Back"
                    } .. ")"
                    break
                end
            end
        end

        if _type == "Trap" then
            _c = {}
            if tableContains({"t_eternal", "t_perishable", "t_rental"}, _achievement) then
                _atlas = G.ASSET_ATLAS["Joker"]
                _trap_soul = {
                    t_eternal = {
                        x = 0,
                        y = 0
                    },
                    t_perishable = {
                        x = 0,
                        y = 2
                    },
                    t_rental = {
                        x = 1,
                        y = 2
                    }
                }

                _c.soul_pos = _trap_soul[_achievement]
            else
                _atlas = G.ASSET_ATLAS["rand_ap_logo"]
            end

            local _trap_pos = {
                t_eternal = {
                    x = 0,
                    y = 0
                },
                t_perishable = {
                    x = 0,
                    y = 0
                },
                t_rental = {
                    x = 0,
                    y = 0
                },
                t_hand = {
                    x = 2,
                    y = 1
                },
                t_discard = {
                    x = 1,
                    y = 1
                },
                t_money = {
                    x = 0,
                    y = 1
                }
            }
            _c.pos = _trap_pos[_achievement]
        end

        if _type == 'Bonus' then
            _c = {
                pos = {
                    x = 0,
                    y = 0
                }
            }

            _atlas = tableContains({"fill_buffoon", "fill_tag_charm", "fill_tag_meteor", "fill_tag_ethereal"},
                _achievement) and G.ASSET_ATLAS["Booster"] or
                         tableContains(
                    {"fill_rare", "fill_uncommon", "fill_foil", "fill_holo", "fill_poly", "fill_negative"}, _achievement) 
                        and G.ASSET_ATLAS["Joker"] or G.ASSET_ATLAS["rand_ap_logo"]

            local _bonus_pos = {
                fill_buffoon = {
                    x = 3,
                    y = 8
                },
                fill_tag_charm = {
                    x = 1 + math.random(2),
                    y = 2
                },
                fill_tag_meteor = {
                    x = 1 + math.random(2),
                    y = 3
                },
                fill_tag_ethereal = {
                    x = 3,
                    y = 4
                },
                op_money = {
                    x = 0,
                    y = 1
                },
                op_interest = {
                    x = 0,
                    y = 1
                },
                fill_money = {
                    x = 0,
                    y = 1
                },
                op_discard = {
                    x = 1,
                    y = 1
                },
                op_hand = {
                    x = 2,
                    y = 1
                },
                op_hand_size = {
                    x = 2,
                    y = 2
                },
                op_joker_slot = {
                    x = 2,
                    y = 0
                },
                op_consum_slot = {
                    x = 0,
                    y = 2
                },
                fill_juggle = {
                    x = 2,
                    y = 2
                },
                fill_double = {
                    x = 0,
                    y = 3
                },
                fill_d_six = {
                    x = 1,
                    y = 2
                }
            }

            _c.pos = _bonus_pos[_achievement] and _bonus_pos[_achievement] or _c.pos
        end

        if not _c then
            if _type == "location" then
                _c = {
                    pos = {
                        x = 0,
                        y = 0
                    }
                }
            else -- moved to handle the trophy here because we need to set the x.y manually here for other icons anyway
                _c = {
                    pos = {
                        x = 3,
                        y = 0
                    }
                }
            end -- there's probably a better way, but idk
        end

        local t_s = Sprite(0, 0, 1.5 * (_atlas.px / _atlas.py), 1.5, _atlas, _c.pos)
        t_s.states.drag.can = false
        t_s.states.hover.can = false
        t_s.states.collide.can = false

        -- gold stake shader
        if _type == 'Stake' then
            if _achievement == "stake_gold" then
                t_s.draw = function(_sprite)
                    _sprite.ARGS.send_to_shader = _sprite.ARGS.send_to_shader or {}
                    _sprite.ARGS.send_to_shader[1] = math.min(_sprite.VT.r * 3, 1) + G.TIMERS.REAL / (18) +
                                                         (_sprite.juice and _sprite.juice.r * 20 or 0) + 1
                    _sprite.ARGS.send_to_shader[2] = G.TIMERS.REAL

                    Sprite.draw_shader(_sprite, 'dissolve')
                    Sprite.draw_shader(_sprite, 'voucher', nil, _sprite.ARGS.send_to_shader)
                end
            end
        end

        -- second layer for the soul, the hologramm and the legendaries
        if (_c and _c.soul_pos) or _achievement == 'c_soul' then
            local _soul_atlas = _achievement == 'c_soul' and G.ASSET_ATLAS["centers"] or _type == 'Joker' and
                                    G.ASSET_ATLAS["Joker"] or G.ASSET_ATLAS["stickers"]
            local _soul_pos = _achievement == 'c_soul' and {
                x = 0,
                y = 1
            } or _c.soul_pos
            local _soul_t_s = Sprite(t_s.T.x, t_s.T.y, 1.5 * (_soul_atlas.px / _soul_atlas.py), 1.5, _soul_atlas,
                _soul_pos)
            _soul_t_s.states.drag.can = false
            _soul_t_s.states.hover.can = false
            _soul_t_s.states.collide.can = false

            -- animation
            if _achievement == 'j_hologram' then -- hologram (needs special treatment bcos custom shader)
                _soul_t_s.draw = function(_sprite)
                    local scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) + 0.00 *
                                          math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                                          (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                    local rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) + 0.00 *
                                           math.sin((G.TIMERS.REAL) * math.pi * 5) *
                                           (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                    Sprite.draw_shader(_sprite, 'hologram', nil, _sprite.ARGS.send_to_shader, nil, _sprite,
                        2 * scale_mod, 2 * rotate_mod)
                end
            elseif _type == 'Joker' then -- legendary jokers
                _soul_t_s.draw = function(_sprite)
                    local scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) + 0.00 *
                                          math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                                          (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                    local rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) + 0.00 *
                                           math.sin((G.TIMERS.REAL) * math.pi * 5) *
                                           (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                    Sprite.draw_shader(_sprite, 'dissolve', 0, nil, nil, _sprite, scale_mod, rotate_mod, nil,
                        0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
                    Sprite.draw_shader(_sprite, 'dissolve', nil, nil, nil, _sprite, scale_mod, rotate_mod)
                end
            elseif _achievement == 'c_soul' then -- soul
                _soul_t_s.draw = function(_sprite)
                    local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) + 0.07 *
                                          math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                                          (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                    local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) + 0.07 *
                                           math.sin((G.TIMERS.REAL) * math.pi * 5) *
                                           (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                    Sprite.draw_shader(_sprite, 'dissolve', 0, nil, nil, _sprite, scale_mod, rotate_mod, nil,
                        0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
                    Sprite.draw_shader(_sprite, 'dissolve', nil, nil, nil, _sprite, scale_mod, rotate_mod)
                end
            else -- stickers dont animate but use the shiny shader
                _soul_t_s.draw = function(_sprite)
                    Sprite.draw_shader(_sprite, 'dissolve')
                    Sprite.draw_shader(_sprite, 'voucher')
                end
            end

            t_s.children.floating_sprite = _soul_t_s
            t_s.children.floating_sprite.role.draw_major = t_s
            _soul_t_s.T = t_s.T
            _soul_t_s.VT = t_s.VT
        end

        -- negative shader for traps
        if _type == 'Trap' then
            if tableContains({"t_eternal", "t_rental", "t_perishable"}, _achievement) then
                UIDEF_alert_extra_ui(t_s, false, _achievement)
            end

            t_s.draw = function(_sprite)
                _sprite.ARGS.send_to_shader = _sprite.ARGS.send_to_shader or {}
                _sprite.ARGS.send_to_shader[1] = math.min(_sprite.VT.r * 3, 1) + G.TIMERS.REAL / (28) +
                                                     (_sprite.juice and _sprite.juice.r * 20 or 0)
                _sprite.ARGS.send_to_shader[2] = G.TIMERS.REAL

                Sprite.draw_shader(_sprite, 'negative', nil, _sprite.ARGS.send_to_shader)
                Sprite.draw_shader(_sprite, 'negative_shine', nil, _sprite.ARGS.send_to_shader)

                if _sprite.children.floating_sprite then
                    _sprite.children.floating_sprite.draw(_sprite.children.floating_sprite)
                end

                if _sprite.children.badge then
                    UIBox.draw(_sprite.children.badge)
                end
            end
        end

        if _type == 'Bonus' then
            t_s._type = _achievement == "fill_negative" and 4 or
            _achievement == "fill_poly" and 3 or 
            _achievement == "fill_holo" and 2 or 
            _achievement == "fill_foil" and 1 or 0

            if tableContains({"fill_holo", "fill_poly", "fill_foil", "fill_negative", "fill_uncommon", "fill_rare"},
                _achievement) then
                UIDEF_alert_extra_ui(t_s, true, _achievement)
            elseif tableContains({"fill_buffoon", "fill_tag_charm", "fill_tag_meteor", "fill_tag_ethereal"},
                _achievement) then
                UIDEF_alert_extra_ui(t_s, true)
            elseif tableContains({"op_discard", "op_money", "op_hand", "op_hand_size", "op_interest", "op_joker_slot",
                                  "op_consum_slot"}, _achievement) then
                UIDEF_alert_extra_ui(t_s, false, "op_item")
            end

            t_s.draw = function(_sprite)
                _sprite.ARGS.send_to_shader = _sprite.ARGS.send_to_shader or {}
                _sprite.ARGS.send_to_shader[1] = math.min(_sprite.VT.r * 3, 1) + G.TIMERS.REAL / (28) +
                                                     (_sprite.juice and _sprite.juice.r * 20 or 0)
                _sprite.ARGS.send_to_shader[2] = G.TIMERS.REAL

                if _sprite.children.price then
                    UIBox.draw(_sprite.children.price)
                end

                if _sprite._type == 0 then
                    Sprite.draw_shader(_sprite, 'dissolve')
                elseif _sprite._type == 1 then
                    Sprite.draw_shader(_sprite, 'dissolve')
                    Sprite.draw_shader(_sprite, 'foil', nil, _sprite.ARGS.send_to_shader)
                elseif _sprite._type == 2 then
                    Sprite.draw_shader(_sprite, 'holo', nil, _sprite.ARGS.send_to_shader)
                elseif _sprite._type == 3 then
                    Sprite.draw_shader(_sprite, 'polychrome', nil, _sprite.ARGS.send_to_shader)
                elseif _sprite._type == 4 then
                    Sprite.draw_shader(_sprite, 'negative', nil, _sprite.ARGS.send_to_shader)
                    Sprite.draw_shader(_sprite, 'negative_shine', nil, _sprite.ARGS.send_to_shader)
                end

                if _sprite.children.badge then
                    UIBox.draw(_sprite.children.badge)
                end
            end
        end

        -- TEXT
        local subtext = _type == 'location' and localize("k_ap_location") or -- bottom text
        _type == 'BackStake' and _c.name or localize {
            type = "name_text",
            key = _achievement,
            set = _type
        }
        local name = _type == 'location' and "Archipelago" or localize("k_ap_unlocked") -- top text

        -- booster localization
        if _type == "Booster" then
            local _loc_target = nil
            for k, v in pairs(G.localization.descriptions.Other) do
                if string.find(_achievement, k) then
                    _loc_target = v
                    break
                end
            end

            if _loc_target then
                subtext = _loc_target.name
            else
                subtext = localize("k_booster")
            end
        end

        local _text_nodes = {{ -- prepare the default ui
            n = G.UIT.R,
            config = {
                align = "cm",
                maxw = 3.4,
                padding = 0.1
            },
            nodes = {{
                n = G.UIT.T,
                config = {
                    text = name,
                    scale = 0.4,
                    colour = G.C.UI.TEXT_LIGHT,
                    shadow = true
                }
            }}
        }, {
            n = G.UIT.R,
            config = {
                align = "cm",
                maxw = 3.4
            },
            nodes = {{
                n = G.UIT.T,
                config = {
                    text = subtext,
                    scale = 0.7,
                    colour = G.C.FILTER,
                    shadow = true
                }
            }}
        }}

        -- back stake third line
        if _type == 'BackStake' then
            _text_nodes[3] = {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    maxw = 3.4
                },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        text = _c.name_2,
                        scale = 0.35,
                        colour = G.C.FILTER,
                        shadow = true
                    }
                }}
            }
        end

        -- generate special text UI for traps, bonuses and locations with data
        -- if AP doesn't receive the data about the location,
        -- it'll use the default ui to say "Archipelago | Location reached" instead
        if _type == 'Trap' or _type == 'Bonus' or (_type == "location" and G.AP.location_id_to_item_name[_achievement]) then
            local ret_nodes = {}
            _text_nodes = {}

            -- retrieve proper localization
            localize {
                type = 'descriptions',
                key = _type == 'location' and 'location' or _achievement,
                set = _type,
                nodes = ret_nodes,
                vars = _type == 'location' and {G.AP.location_id_to_item_name[_achievement].player_name} or nil
            }

            -- generate multi-line for location item name so the long names look right
            if _type == 'location' then
                local _item_name = split_text_to_lines(G.AP.location_id_to_item_name[_achievement].item_name)
                for i = 1, #_item_name, 1 do
                    _text_nodes[#_text_nodes + 1] = {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            maxw = 3.5,
                            padding = 0.1
                        },
                        nodes = {{
                            n = G.UIT.T,
                            config = {
                                text = _item_name[i],
                                scale = 0.6,
                                colour = G.C.FILTER,
                                shadow = true
                            }
                        }}
                    }
                end
            end

            -- change the ui generated by the localize function to fit better
            for i = 1, #ret_nodes, 1 do
                for k, v in pairs(ret_nodes[i]) do

                    local _found = false
                    for cn, cv in pairs(G.C) do
                        if cv == v.config.colour then
                            _found = true
                        end
                    end

                    for cn, cv in pairs(G.C.SECONDARY_SET) do
                        if cv == v.config.colour then
                            _found = true
                        end
                    end

                    if _found == false then
                        ret_nodes[i][k].config.colour = G.C.UI.TEXT_LIGHT
                    end

                    ret_nodes[i][k].config.scale = 0.6 * (ret_nodes[i][k].config.scale / 0.32)
                end
            end

            -- generate the UI
            for k, v in ipairs(ret_nodes) do
                _text_nodes[#_text_nodes + 1] = {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        maxw = 3.2
                    },
                    nodes = v
                }
            end
        end

        return {
            n = G.UIT.ROOT,
            config = {
                align = 'cl',
                r = 0.1,
                padding = 0.06,
                colour = G.C.UI.TRANSPARENT_DARK
            },
            nodes = {{
                n = G.UIT.R,
                config = {
                    align = "cl",
                    padding = 0.2,
                    minw = 20,
                    r = 0.1,
                    colour = G.C.BLACK,
                    outline = 1.5,
                    outline_colour = G.C.GREY
                },
                nodes = {{
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        r = 0.1
                    },
                    nodes = {{
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            r = 0.1
                        },
                        nodes = {{
                            n = G.UIT.O,
                            config = {
                                object = t_s
                            }
                        }}
                    }, {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.04
                        },
                        nodes = _text_nodes
                    }}
                }}
            }}
        }

    end

    return create_UIBox_notify_alertRef(_achievement, _type)
end


-- fake version of random UI for bonus and trap pop ups
function UIDEF_alert_extra_ui(card, price, badge)

    price = price or false

    -- price tag
    if price == true then
        local _price = {
            n = G.UIT.ROOT,
            config = {
                minw = 0.6,
                align = 'tm',
                colour = darken(G.C.BLACK, 0.2),
                shadow = false,
                r = 0.05,
                padding = 0.05,
                minh = 1
            },
            nodes = {{
                n = G.UIT.R,
                config = {
                    align = "cm",
                    colour = lighten(G.C.BLACK, 0.1),
                    r = 0.1,
                    minw = 1,
                    minh = 0.55,
                    emboss = 0.05,
                    padding = 0.03
                },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        text = "$0",
                        scale = 0.4,
                        colour = G.C.MONEY,
                        shadow = true
                    }
                }}
            }}
        }

        card.children.price = UIBox {
            definition = _price,
            config = {
                align = "tm",
                offset = {
                    x = 0,
                    y = 0.3
                },
                major = card,
                bond = 'Strong',
                parent = card
            }
        }
    end

    if badge then
        local _badge_table = {
            fill_poly = {localize("polychrome", "labels"), get_badge_colour("polychrome")},
            fill_holo = {localize("holographic", "labels"), get_badge_colour("holographic")},
            fill_foil = {localize("foil", "labels"), get_badge_colour("foil")},
            fill_negative = {localize("negative", "labels"), get_badge_colour("negative")},
            fill_uncommon = {localize('k_uncommon'), G.C.GREEN},
            fill_rare = {localize('k_rare'), G.C.RED},
            t_eternal = {localize("eternal", "labels"), get_badge_colour("eternal")},
            t_perishable = {localize("perishable", "labels"), get_badge_colour("perishable")},
            t_rental = {localize("rental", "labels"), get_badge_colour("rental")},
            op_item = {localize("k_ap_permanent"), get_badge_colour("eternal")}
        }
        -- beware, a lot of ugly patches to make sure the permanent badge doesn't cover the cool art
        local _badge_def = create_badge(_badge_table[badge][1] or "ERROR", _badge_table[badge][2] or G.C.RED, G.C.WHITE,
            badge == "op_item" and 0.6 or 0.9)

        _badge_def.nodes[1].config.minw = badge == "op_item" and 1.3 or 1.65
        _badge_def.nodes[1].config.minh = badge == "op_item" and (_badge_def.nodes[1].config.minh * 0.8) or
                                              _badge_def.nodes[1].config.minh

        card.children.badge = UIBox {
            definition = _badge_def,
            config = {
                align = "bm",
                offset = {
                    x = 0,
                    y = badge == "op_item" and -0.1 or -0.3
                },
                major = card,
                bond = 'Strong',
                parent = card
            }
        }
    end
end

--Add Challenge Deck into the pool when opening the deck collection
local create_UIBox_your_collection_decksRef = create_UIBox_your_collection_decks
function create_UIBox_your_collection_decks()
	local _result = nil
	if isAPProfileLoaded() and
        tableContains(G.P_CENTER_POOLS.Back, G.P_CENTERS['b_challenge']) == false then
		    G.P_CENTER_POOLS.Back[#G.P_CENTER_POOLS.Back+1] = G.P_CENTERS['b_challenge']
		    G.P_CENTERS['b_challenge'].name = "ChaIIenge Deck" --need this to avoid a crash
	end
	_result = create_UIBox_your_collection_decksRef()
	return _result
end

--Remove Challenge Deck from the pool when closing the deck collection
local create_UIBox_your_collectionRef = create_UIBox_your_collection
function create_UIBox_your_collection()
	local _result = nil
    if isAPProfileLoaded() then
    	for k, v in ipairs(G.P_CENTER_POOLS.Back) do
    		if v == G.P_CENTERS['b_challenge'] then
    			G.P_CENTERS['b_challenge'].name = "Challenge Deck"
    			table.remove(G.P_CENTER_POOLS.Back, k)
    			break
    		end
    	end
    end
	_result = create_UIBox_your_collectionRef()
	return _result
end

--fix stake cursor and/or challenge deck in the pool
local GUIDEFrun_setup_option = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(type)
	if isAPProfileLoaded() then
		
		if not G.SAVED_GAME then
			G.SAVED_GAME = get_compressed(G.SETTINGS.profile..'/'..'save.jkr')
			if G.SAVED_GAME ~= nil then G.SAVED_GAME = STR_UNPACK(G.SAVED_GAME) end
		end

		--remove challenge deck from main pool if its there somehow
		for k, v in ipairs(G.P_CENTER_POOLS.Back) do
    			if v == G.P_CENTERS['b_challenge'] then
    				G.P_CENTERS['b_challenge'].name = "Challenge Deck"
    				table.remove(G.P_CENTER_POOLS.Back, k)
    				break
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

--challenge ui
local GUIDEFchallengesRef = G.UIDEF.challenges
function G.UIDEF.challenges(from_game_over)
	if isAPProfileLoaded() then
		G.PROFILES[G.SETTINGS.profile].challenges_unlocked = #G.CHALLENGES
		local loc_nodes = {}
		local _locked = true

		--change this to enable challenges
		local challenge_mode = 1000000
		
		-- vanilla requirement (beat # of decks)
		if challenge_mode == 1 then
			local _deck_wins = 0
			local _deck_win_requirement = 10
			
			for k, v in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage) do
				if v.wins and #v.wins > 0 then
					_deck_wins = _deck_wins + 1
					if _deck_wins >= _deck_win_requirement then
						_locked = false
						break
					end
				end
			end
			localize{type = 'descriptions', key = 'ap_challenge_locked_vanilla', set = 'Other', nodes = loc_nodes, vars = {_deck_win_requirement, _deck_wins}, default_col = G.C.WHITE}
		
		-- find the challenge deck as an AP item
		elseif challenge_mode == 2 then
			localize{type = 'descriptions', key = 'ap_challenge_locked_deck', set = 'Other', nodes = loc_nodes, default_col = G.C.WHITE}
			_locked = not G.P_CENTERS['b_challenge'].unlocked
		
		-- find any challenge as an AP item
		elseif challenge_mode == 3 then
			localize{type = 'descriptions', key = 'ap_challenge_locked_item', set = 'Other', nodes = loc_nodes, default_col = G.C.WHITE}
			for k, v in pairs(G.CHALLENGES) do
				if v.unlocked == true then
					_locked = false
					break
				end
			end
			
		-- unlocked from the start (doesnt unlock the challenges themselves LOL)
		elseif challenge_mode == 4 then
			_locked = false
			
		-- default to disabling challenges
		else
			localize{type = 'descriptions', key = 'ap_challenge_locked_none', set = 'Other', nodes = loc_nodes, default_col = G.C.WHITE}
			
		end
		
		local _result = {
			n = G.UIT.ROOT, 
			config = {
				align = "cm",
				padding = 0.1,
				colour = G.C.CLEAR,
				minh = 8.02,
				minw = 7
			},
			nodes = {
				transparent_multiline_text(loc_nodes)
				}
		}
		
		--lock the player out if they fail to meet the requirement
		if _locked then
			return _result
		else -- count the amount of unlocked challenges
			G.PROFILES[G.SETTINGS.profile].challenges_unlocked = 0
			for k, v in pairs(G.CHALLENGES) do
				if v.unlocked == true then
					G.PROFILES[G.SETTINGS.profile].challenges_unlocked = G.PROFILES[G.SETTINGS.profile].challenges_unlocked + 1
				end
			end
		end
	end
	local challenges_ui = GUIDEFchallengesRef(from_game_over)
	
	if isAPProfileLoaded() then
		G.PROFILES[G.SETTINGS.profile].challenges_unlocked = #G.CHALLENGES
	end
	
	return challenges_ui
end

-- ===============
-- GALDUR (UI MOD) COMPAT
-- ===============

-- galdur stake message
local create_stake_unlock_messageRef = create_stake_unlock_message
function create_stake_unlock_message(stake)
	if isAPProfileLoaded() then
		-- vanilla
		if tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(G.AP.stake_unlock_modes.vanilla) or
		tonumber(G.AP.slot_data.stake_unlock_mode) == tonumber(G.AP.stake_unlock_modes.linear) then
			
			local other_name = localize{
				type = 'name_text',
				set = 'Stake',
				key = stake ~= 1 and G.P_CENTER_POOLS.Stake[stake - 1].key or G.P_CENTER_POOLS.Stake[stake].key
			}
			local loc_nodes = {}
			local _text_nodes = {}
			local loc_args = {other_name, colours = {get_stake_col(stake-1)}}
			localize{type = 'descriptions', key = 'ap_locked_StakeLine', set = "Other", nodes = loc_nodes, vars = loc_args}
			
			for k, v in ipairs(loc_nodes) do
                _text_nodes[#_text_nodes + 1] = {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        maxw = 3.2
                    },
                    nodes = v
                }
            end
			
			return _text_nodes
		-- item-based modes (might need to split in hint update)
		else
			local loc_nodes = {}
			local _text_nodes = {}
			localize{type = 'descriptions', key = 'ap_locked_StakeItem', set = "Other", nodes = loc_nodes}
			
			for k, v in ipairs(loc_nodes) do
                _text_nodes[#_text_nodes + 1] = {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        maxw = 3.2
                    },
                    nodes = v
                }
            end
			
			return _text_nodes
		end
	else
		return create_stake_unlock_messageRef(stake)
	end
end

-- =============
-- END OF GALDUR COMPAT
-- =============
