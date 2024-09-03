return {
	descriptions = {
		Voucher = {
			v_rand_ap_item = {
				name = "Archipelago Item",
				text = {
					'Unlocks an {C:dark_edition}AP Item{}', 
					'when redeemed'
					}
			},
			v_rand_ap_item_location = {
				name = "Archipelago Item", 
				text = {--item name is handled through code
					'for {C:dark_edition}#1#{}'
					}
			},
			v_rand_ap_item_invalid = {
				name = "Archipelago Item",
				text = {
					"{C:inactive}This location has",
					"{C:inactive}already been checked."
				}
			}
		},
		Tarot = {
			c_rand_ap_tarot = {
				name = "Archipelago Tarot",
				text = {
					'Unlocks an {C:dark_edition}AP Item{}',
					'upon use'
				}
			},
			c_rand_ap_tarot_location = {
				name = "Archipelago Tarot",
				text = {--item name is handled through code
					'for {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_tarot_invalid = {
				name = "Archipelago Tarot",
				text = {
					"{C:inactive}This location has",
					"{C:inactive}already been checked."
				}
			},
		},
		Planet = {
			c_rand_ap_planet = {
				name = "Archipelago Belt",
				text = {
					'Unlocks an {C:dark_edition}AP Item{}',
					'upon use'
				}
			},
			c_rand_ap_planet_location = {
				name = "Archipelago Belt",
				text = {--item name is handled through code
					'for {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_planet_invalid = {
				name = "Archipelago Belt",
				text = {
					"{C:inactive}This location has",
					"{C:inactive}already been checked."
				}
			}
		},
		Spectral = {
			c_rand_ap_spectral = {
				name = "Archipelago Spectral",
				text = {
					'Unlocks an {C:dark_edition}AP Item{},',
					'creates a copy of it',
					"if it's yours",
					"{C:inactive}(Must have room)"
				}
			},
			c_rand_ap_spectral_invalid = {
				name = "Archipelago Spectral",
				text = {
					"{C:inactive}This location has",
					"{C:inactive}already been checked."
				}
			},
		},
		Back = {
			b_challenge = {
				text = {
					"Applies {C:attention}Custom Rules{}",
					"and restrictions"
				}
			}
		},
		Trap = { -- Trap names are NOT used
			t_eternal = {
				name = "Eternal Trap",
				text = {
					"{s:0.7}A random Joker", 
					"{s:1}is {C:attention}Eternal{}!"
					}
			},
			t_perishable = {
				name = "Perishable Trap",
				text = {
					"{s:0.7}A random Joker", 
					"{s:1}is {C:attention}Perishable{}!"
				}
			},
			t_rental = {
				name = "Rental Trap",
				text = {
					"{s:0.7}A random Joker", 
					"{s:1}is {C:attention}Rental{}!"
					}
			},
			t_money = {
				name = "Bankruptcy Trap",
				text = {"{s:0.7}Lose all money"}
			},
			t_hand = {
				name = "Hand Trap",
				text = {
					"{C:blue}-1{} hand", 
					"{s:0.7}this round"
				}
			},
			t_discard = {
				name = "Discard Trap",
				text = {
					"{C:red}-1{} discard",
					"{s:0.7}this round"
				}
			}
		},
		Bonus = { -- Bonus names are NOT used
			op_discard = {
				name = "Bonus Discard",
				text = {
					"{C:red}+1{} discard", 
					"{s:0.7}every round"
				}
			},
			op_money = {
				name = "Bonus Starting Money",
				text = {
					"{s:0.7}Start with", 
					"{s:1}extra {C:money}$1{}"
				}
			},
			op_hand = {
				name = "Bonus Hand",
				text = {
					"{C:blue}+1{} hand", 
					"{s:0.7}every round"
					}
			},
			op_hand_size = { 
				name = "Bonus Hand Size",
				text = {"{C:attention}+1{} hand size"}
			},
			op_interest = {
				name = "Bonus Max Interest",
				text = {
					"{s:0.7}Raise the interest cap", 
					"{s:1}by {C:money}$5{}"
					}
			},
			op_joker_slot = {
				name = "Bonus Joker Slot",
				text = {"{C:dark_edition}+1{} Joker slot"}
			},
			op_consum_slot = {
				name = "Bonus Consumable Slot",
				text = {"{s:0.6,C:dark_edition}+1{s:0.6} consumable slot"}
			},
			
			fill_money = {
				name = "Bonus Money",
				text = {
					"{s:0.7}Receive", 
					"{s:1}up to {C:money}$8{}"
				}
			},
			fill_buffoon = {
				name = "Receive Buffoon Pack",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:attention}Mega Buffoon Pack{}"
				}
			},
			fill_tag_charm = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:tarot}Mega Arcana Pack{}"
				}
			},
			fill_tag_meteor = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Receive a", 
					"{s:1,C:planet}Mega Celestial Pack{}"
				}
			},
			fill_tag_ethereal = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Receive a", 
					"{s:1,C:spectral}Mega Spectral Pack{}"
				}
			},
			fill_juggle = {
				name = "Bonus Juggle Tag",
				text = {
					"{s:0.7}Receive a", 
					"{s:1,C:attention}Juggle Tag{}"
				}
			},
			fill_d_six = {
				name = "Bonus D6 Tag",
				text = {
					"{s:0.7}Receive a", 
					"{s:1,C:attention}D6 Tag{}"
				}
			},
			fill_uncommon = {
				name = "Bonus Uncommon Tag",
				text = {
					"{s:0.7}Receive an",
					"{s:1,C:green}Uncommon Tag{}"
				}
			},
			fill_rare = {
				name = "Bonus Rare Tag",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:red}Rare Tag{}"
				}
			},
			fill_negative = {
				name = "Bonus Negative Tag",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:dark_edition}Negative Tag{}"
				}
			},
			fill_foil = {
				name = "Bonus Foil Tag",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:dark_edition}Foil Tag{}"
				}
			},
			fill_holo = {
				name = "Bonus Holographic Tag",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:dark_edition}Holographic Tag{}"
				}
			},
			fill_poly = {
				name = "Bonus Polychrome Tag",
				text = {
					"{s:0.7}Receive a",
					"{s:1,C:dark_edition}Polychrome Tag{}"
				}
			},
			fill_double = {
				name = "Bonus Double Tag",
				text = {
					"{s:0.7}Receive a", 
					"{s:1,C:attention}Double Tag{}"
				}
			}
		},
		location = {     --this is the notification for 
			location = { --when the client has the data about the location.
				text = { --the placeholder "Location reached" is misc/dictionary/k_ap_location
					"{s:0.6}for {C:dark_edition,s:0.6}#1#"
				} -- (the lines for the item name are done through code)
			}
		},
		Other = {
			ap_debuffed = {
                name = "Debuffed",
                text = {
                    "All abilities are disabled",
                    "until this card is found",
					"as an {C:dark_edition}AP item"
                }
            },
			ap_hint_ante = {
				name = "Locked",
				text = {
					"Beat Ante {C:attention}#1#{} with",
					"{C:attention}#2#{} on",
					"{C:ap_stake}#3#{} difficulty"
				}
			},
			ap_locked_Joker = {
				name = "Locked",
				text = {
					"Find this Joker",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Joker is in",
					"{C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this Joker as an",
					"{C:dark_edition}AP item{} in the Shop on",
					"{C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this Joker as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Tarot = {
				name = "Locked",
				text = {
					"Find this {C:tarot}Tarot{} card",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Tarot card is",
					"in {C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this {C:tarot}Tarot{} card as",
					"an {C:dark_edition}AP item{} in the Shop",
					"on {C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this {C:tarot}Tarot{} card as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Planet = {
				name = "Locked",
				text = {
					"Find this {C:planet}Planet{} card",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Planet card is",
					"in {C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this {C:planet}Planet{} card as",
					"an {C:dark_edition}AP item{} in the Shop",
					"on {C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this {C:planet}Planet{} card as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Spectral = {
				name = "Locked",
				text = {
					"Find this {C:spectral}Spectral{} card",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Spectral card is",
					"in {C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this {C:spectral}Spectral{} card as",
					"an {C:dark_edition}AP item{} in the Shop",
					"on {C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this {C:spectral}Spectral{} card as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Back = {
				name = "Locked",
				text = {
					"Find this Deck",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Deck is in",
					"{C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this Deck as an",
					"{C:dark_edition}AP item{} in the Shop on",
					"{C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this Deck as",
					"an {C:tarot,T:c_rand_ap_tarot}Archipelago Tarot{},",
					"an {C:planet,T:c_rand_ap_planet}Archipelago Belt{}",
					"or an {C:spectral,T:c_rand_ap_spectral}Archipelago Spectral"
				}
			},
			ap_locked_Voucher = {
				name = "Locked",
				text = {
					"Find this Voucher",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Voucher is in",
					"{C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this Voucher as an",
					"{C:dark_edition}AP item{} in the Shop on",
					"{C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this Voucher as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Booster = {
				name = "Locked",
				text = {
					"Find this Booster Pack",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Booster Pack is",
					"in {C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this Booster Pack as",
					"{C:dark_edition}AP item{} in the Shop on",
					"{C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this Booster Pack as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_Modded = {
				name = "Locked",
				text = {
					"Modded items",
					"cannot be unlocked"
				}
			},
			ap_challenge_locked_vanilla = {
                name = "Locked",
                text = {
                    "Win a run with at least",
                    "#1# different decks to unlock",
                    "Challenge mode",
                    "{C:attention,s:2}#2#/#1#"
                }
            },
			ap_challenge_locked_deck = {
                name = "Locked",
                text = {
                    "Find the Challenge Deck",
                    "as an {C:dark_edition}AP Item{} to unlock",
                    "Challenge mode"
                }
            },
			ap_challenge_locked_item = {
                name = "Locked",
                text = {
                    "Find any Challenge",
                    "as an {C:dark_edition}AP Item{} to unlock",
                    "Challenge mode"
                }
            },
			ap_challenge_locked_none = {
                name = "Locked",
                text = {
                   --"{C:inactive,s:2}Challenges are disabled"
				   "Not available",
                   "in this version",
				   "{C:attention,s:2}Coming Soon!"
                }
            },
			ap_locked_Deck_c = { --temporary
				name = "Locked",
				text = {
					"Not available",
                    "in this version"
				}
			},
			ap_locked_StakeItem = {
				name = "Locked",
				text = {
					"Find this Stake",
					"as an {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}This Stake is in",
					"{C:dark_edition}#1#{C:inactive}'s game..."
				},
				shop_check = {
					"Find this Stake as an",
					"{C:dark_edition}AP item{} in the Shop on",
					"{C:ap_stake}#1#{} difficulty"
				},
				card_check = {
					"Find this Stake as",
					"an {C:tarot}Archipelago Tarot{},",
					"an {C:planet}Archipelago Belt{}",
					"or an {C:spectral}Archipelago Spectral"
				}
			},
			ap_locked_StakeLine = {
				name = "Locked",
				text = {
					"Win a run with this deck",
                    "on at least {V:1}#1#{} difficulty",
				}
			},
		}
	},
	misc = {
		dictionary = {
			k_ap_unlocked = "Unlocked",
			k_ap_location = "Location reached",
			k_ap_permanent = "Permanent",
			k_ap_check = "Check",
			k_ap_goal = "Goal",
			k_ap_IP = "Server Address",
			k_ap_port = "Port",
			k_ap_slot = "Slot Name",
			k_ap_pass = "Password",
			b_ap_connect = "Connect",
			k_ap_connected = "Connected to Archipelago at #1#:#2# as #3#",
			k_ap_connected_no_ip = "Connected to Archipelago as #3#",
			k_ap_connecting = "Connecting to Archipelago at #1#:#2#...",
			k_ap_not_connected = "Not connected to Archipelago.",
			k_ap_locked_jokers = 'Locked Jokers',
			k_ap_locked_consums = 'Locked Consumables',
			k_ap_locked_options = {
				'Debuff',
				'Follow YAML',
				'Remove'
			},
			k_ap_modded_items = 'Modded Items',
			k_ap_modded_items_options = {
				'Remove',
				'Lock',
				'Unlock'
			},
			k_ap_deathlink = 'Deathlink',
			k_ap_deathlink_options = {
				'Force off',
				'Follow YAML',
				'Force on'
			},
			k_ap_connection_status = 'Connection Status Info',
			k_ap_connection_status_options = {
				'Full',
				'Connected Only',
				'Hide IP',
				'None'
			},
			k_ap_cant_change = "These options cannot be changed while connected to Archipelago",
			ap_goal_text = {
				"Beat #1# Decks (#2#/#1#)",
				"Unlock #1# Jokers (#2#/#1#)",
				"Beat ante #1#",
				"Beat #1# Decks on at least #3# difficulty (#2#/#1#)",
				"Win with #1# Jokers on at least #3# difficulty (#2#/#1#)",
				"Win with #1# unique combinations of Decks and Stakes (#2#/#1#)"
			},
			k_ap_item_names = 'AP Item Names',
			k_ap_item_names_options = {
				'Show All',
				'Voucher Only',
				'Consumables Only',
				'Hide All'
			},
			k_ap_yeah = 'Yeah!',
			k_asteroid_belt = 'Asteroid Belt',
			k_ap_you = 'you', -- "for you"; this replaces the player's name if they're looking at their own item
			b_ap_buffs = 'Bonuses',
			ap_buff_bonushands = "Hands: ",
			ap_buff_bonusdiscards = "Discards: ",
			ap_buff_bonushandsize = "Hand Size: ",
			ap_buff_bonusstartingmoney = "Starting Money: ",
			ap_buff_maxinterest = "Max Interest: ",
			ap_buff_bonusjoker = "Joker slots: ",
			ap_buff_bonusconsumable = "Consumable slots: ",
		}
	}
}