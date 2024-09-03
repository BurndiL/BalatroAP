return {
	descriptions = {
		Voucher = {
			v_rand_ap_item = {
				name = "Archipelago Item",
				text = {
					'Schaltet ein {C:dark_edition}AP Item{} frei'
					}
			},
			v_rand_ap_item_location = {
				name = "Archipelago Item", 
				text = {--item name is handled through code
					'für {C:dark_edition}#1#{}'
					}
			},
			v_rand_ap_item_invalid = {
				name = "Archipelago Item",
				text = {
					"{C:inactive}Dieser Ort",
					"{C:inactive}wurde bereits erkundet."
				}
			}
		},
		Tarot = {
			c_rand_ap_tarot = {
				name = "Archipelago Tarot",
				text = {
					'Schaltet ein {C:dark_edition}AP Item{} frei'
					}
			},
			c_rand_ap_tarot_location = {
				name = "Archipelago Tarot",
				text = {--item name is handled through code
					'für {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_tarot_invalid = {
				name = "Archipelago Tarot",
				text = {
					"{C:inactive}Dieser Ort",
					"{C:inactive}wurde bereits erkundet."
				}
			},
		},
		Planet = {
			c_rand_ap_planet = {
				name = "Archipelago Gürtel",
				text = {
					'Schaltet ein {C:dark_edition}AP Item{} frei'
				}
			},
			c_rand_ap_planet_location = {
				name = "Archipelago Gürtel",
				text = {--item name is handled through code
					'für {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_planet_invalid = {
				name = "Archipelago Gürtel",
				text = {
					"{C:inactive}Dieser Ort",
					"{C:inactive}wurde bereits erkundet."
				}
			}
		},
		Spectral = {
			c_rand_ap_spectral = {
				name = "Archipelago Geist",
				text = {
					'Schaltet ein {C:dark_edition}AP Item{} frei,',
					'kopiert es, falls',
					"es deines ist",
					"{C:inactive}(Muss Platz haben)"
				}
			},
			c_rand_ap_spectral_invalid = {
				name = "Archipelago Geist",
				text = {
					"{C:inactive}Dieser Ort",
					"{C:inactive}wurde bereits erkundet."
				}
			},
		},
		Back = {
			b_challenge = {
				text = {
					"Hat {C:attention}individuelle Regeln{}",
					"und Einschränkungen"
				}
			}
		},
		Trap = { -- Trap names are NOT used
			t_eternal = {
				name = "Ewig-Falle",
				text = {
					"{s:0.7}Zufälliger Joker", 
					"{s:1}ist jetzt {C:attention}Ewig{}!"
					}
			},
			t_perishable = {
				name = "Verderblich-Falle",
				text = {
					"{s:0.7}Zufälliger Joker", 
					"{s:1}ist jetzt {C:attention}Verderblich{}!"
				}
			},
			t_rental = {
				name = "Gemietet-Falle",
				text = {
					"{s:0.7}Zufälliger Joker", 
					"{s:1}ist jetzt {C:attention}Gemietet{}!"
					}
			},
			t_money = {
				name = "Bankrott-Falle",
				text = {"{s:0.7}Verlier all dein Geld"}
			},
			t_hand = {
				name = "Hand-Falle",
				text = {
					"{C:blue}-1{} Hand", 
					"{s:0.7}diese Runde"
				}
			},
			t_discard = {
				name = "Abwurf-Falle",
				text = {
					"{C:red}-1{} Abwurf",
					"{s:0.7}diese Runde"
				}
			}
		},
		Bonus = { -- Bonus names are NOT used
			op_discard = {
				name = "Bonus Abwurf",
				text = {
					"{C:red}+1{} Abwurf", 
					"{s:0.7}jede Runde"
				}
			},
			op_money = {
				name = "Bonus Start-Geld",
				text = {
					"{s:0.7}Beginne mit", 
					"{s:1}extra {C:money}$1{}"
				}
			},
			op_hand = {
				name = "Bonus Hand",
				text = {
					"{C:blue}+1{} Hand", 
					"{s:0.7}jede Runde"
					}
			},
			op_hand_size = { 
				name = "Bonus Handgröße",
				text = {"{C:attention}+1{} Handgröße"}
			},
			op_interest = {
				name = "Bonus Zinsenlimit",
				text = {
					"{s:0.7}Erhöhe das Zinsenlimit", 
					"{s:1}um {C:money}$1{}"
					}
			},
			op_joker_slot = {
				name = "Bonus Joker-Slot",
				text = {"{C:dark_edition}+1{} Joker-slot"}
			},
			op_consum_slot = {
				name = "Bonus Verbrauchsgegenstand-Slot",
				text = {"{s:0.6,C:dark_edition}+1{} Slot für Verbrauchsgegenstände"}
			},
			
			fill_money = {
				name = "Bonus Geld",
				text = {
					"{s:0.7}Erhalte", 
					"{s:1}bis zu {C:money}$8{}"
				}
			},
			fill_buffoon = {
				name = "Erhalte Mega-Clownspaket",
				text = {
					"{s:0.7}Erhalte ",
					"{s:1,C:attention}Mega-Clownspaket{}"
				}
			},
			fill_tag_charm = {
				name = "Erhalte ein Verbrauchsgegenstand-Paket",
				text = {
					"{s:0.7}Erhalte ein",
					"{s:1,C:tarot}Mega Arkana-Paket{}"
				}
			},
			fill_tag_meteor = {
				name = "Erhalte ein Verbrauchsgegenstand-Paket",
				text = {
					"{s:0.7}Erhalte ein", 
					"{s:1,C:planet}Mega Himmelspaket{}"
				}
			},
			fill_tag_ethereal = {
				name = "Erhalte ein Verbrauchsgegenstand-Paket",
				text = {
					"{s:0.7}Erhalte ein", 
					"{s:1,C:spectral}Mega Geisterpaket{}"
				}
			},
			fill_juggle = {
				name = "Bonus Jongleur-Tag",
				text = {
					"{s:0.7}Erhalte einen", 
					"{s:1,C:attention}Jongleur-Tag{}"
				}
			},
			fill_d_six = {
				name = "Bonus D6-Tag",
				text = {
					"{s:0.7}Erhalte einen", 
					"{s:1,C:attention}D6-Tag{}"
				}
			},
			fill_uncommon = {
				name = "Bonus ungewöhnlicher Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:green}ungewöhnlichen Tag{}"
				}
			},
			fill_rare = {
				name = "Bonus seltener Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:red}seltenen Tag{}"
				}
			},
			fill_negative = {
				name = "Bonus Negativer Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:dark_edition}negativen Tag{}"
				}
			},
			fill_foil = {
				name = "Bonus Foil-Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:dark_edition}Foil-Tag{}"
				}
			},
			fill_holo = {
				name = "Bonus Holografischer Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:dark_edition}holografischen Tag{}"
				}
			},
			fill_poly = {
				name = "Bonus Polychrom-Tag",
				text = {
					"{s:0.7}Erhalte einen",
					"{s:1,C:dark_edition}Polychrom-Tag{}"
				}
			},
			fill_double = {
				name = "Bonus Doppel-Tag",
				text = {
					"{s:0.7}Erhalte einen", 
					"{s:1,C:attention}Doppel-Tag{}"
				}
			}
		},
		location = {     --this is the notification for 
			location = { --when the client has the data about the location.
				text = { --the placeholder "Location reached" is misc/dictionary/k_ap_location
					"{s:0.6}für {C:dark_edition,s:0.6}#1#"
				} -- (the lines for the item name are done through code)
			}
		},
		Other = {
			ap_debuffed = {
                name = "Geschwächt",
                text = {
                    "Alle Fähigkeiten sind",
                    "deaktiviert, bis diese Karte als ",
					"{C:dark_edition}AP item{} gefunden wurde"
                }
            },
			ap_hint_ante = {
				name = "Locked",
				text = {
					"Schlage Ante {C:attention}#1#{} mit",
					"{C:attention}#2#{} auf",
					"{C:ap_stake}#3#{} Schwierigkeit"
				}
			},
			ap_locked_Joker = {
				name = "Gesperrt",
				text = {
					"Finde diesen Joker",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Dieser Joker ist in",
					"{C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diesen Joker als",
					"{C:dark_edition}AP item{} im Shop auf",
					"{C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde diesen Joker als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Tarot = {
				name = "Gesperrt",
				text = {
					"Finde diese {C:tarot}Tarot{} Karte",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Diese Tarot Karte ist",
					"in {C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diese {C:tarot}Tarot{} Karte als",
					"ein {C:dark_edition}AP Item{} im Shop",
					"auf {C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde diese {C:tarot}Tarot{} Karte als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Planet = {
				name = "Gesperrt",
				text = {
					"Finde diese {C:planet}Planeten{} Karte",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Diese Planeten Karte ist",
					"in {C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diese {C:planet}Planeten{} Karte als",
					"ein {C:dark_edition}AP item{} im Shop",
					"auf {C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde diese {C:planet}Planeten{} Karte als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Spectral = {
				name = "Gesperrt",
				text = {
					"Finde diese {C:spectral}Geister{} Karte",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Diese Geister Karte ist",
					"in {C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diese {C:spectral}Geister{} Karte als",
					"ein {C:dark_edition}AP item{} im Shop",
					"auf {C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde diese {C:spectral}Geister{} Karte als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Back = {
				name = "Gesperrt",
				text = {
					"Finde dieses Deck",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Dieses Deck ist in",
					"{C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde dieses Deck als",
					"{C:dark_edition}AP item{} im Shop",
					"auf {C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde dieses Deck als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Voucher = {
				name = "Gesperrt",
				text = {
					"Finde diesen Gutschein",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Dieser Gutschein ist in",
					"{C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diesen Gutschein als ein",
					"{C:dark_edition}AP item{} im Shop auf",
					"{C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Find this Voucher as",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Booster = {
				name = "Gesperrt",
				text = {
					"Finde dieses Booster-Paket",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Dieses Booster-Paket ist",
					"in {C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde dieses Booster-Paket als",
					"{C:dark_edition}AP Item{} im Shop auf",
					"{C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Find this Booster Pack as",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_Modded = {
				name = "Gesperrt",
				text = {
					"Gemoddete Items können",
					"nicht freigeschaltet werden"
				}
			},
			ap_challenge_locked_vanilla = {
                name = "Gesperrt",
                text = {
                    "Gewinne mindestens einen Durchlauf",
                    "mit #1# unterschiedlichen Decks,",
                    "um den Herausforderungsmodus freizuschalten",
                    "{C:attention,s:2}#2#/#1#"
                }
            },
			ap_challenge_locked_deck = {
                name = "Gesperrt",
                text = {
                    "Finde das Herausforderungsdeck",
                    "als {C:dark_edition}AP Item{},",
                    "um den Herausforderungsmodus freizuschalten"
                }
            },
			ap_challenge_locked_item = {
                name = "Gesperrt",
                text = {
                    "Finde jede Herausforderung",
                    "als {C:dark_edition}AP Item{},",
                    "um den Herausforderungsmodus freizuschalten"
                }
            },
			ap_challenge_locked_none = {
                name = "Gesperrt",
                text = {
                   --"{C:inactive,s:2}Herausforderungen sind deaktiviert"
				   "Nicht verfügbar",
                    "in dieser Version",
				   "{C:attention,s:2}Kommt bald!"
                }
            },
			ap_locked_Deck_c = { --temporary
				name = "Gesperrt",
				text = {
					"Nicht verfügbar",
                    "in dieser Version"
				}
			},
			ap_locked_StakeItem = {
				name = "Gesperrt",
				text = {
					"Finde diesen Einsatz",
					"als {C:dark_edition}AP item"
				},
				nonlocal = {
					"{C:inactive}Dieser Einsatz ist in",
					"{C:dark_edition}#1#{C:inactive}'s Spiel..."
				},
				shop_check = {
					"Finde diesen Einsatz als",
					"{C:dark_edition}AP Item{} im Shop auf",
					"{C:ap_stake}#1#{} Schwierigkeit"
				},
				card_check = {
					"Finde diesen Einsatz als",
					"eine {C:tarot}Archipelago Tarot{},",
					"einen {C:planet}Archipelago Gürtel{}",
					"oder einen {C:spectral}Archipelago Geist"
				}
			},
			ap_locked_StakeLine = {
				name = "Gesperrt",
				text = {
					"Gewinne einen Durchlauf mit diesem Deck",
                    "auf mindestens Schwierigkeitsstufe {V:1}#1#{}",
				}
			},
		}
	},
	misc = {
		dictionary = {
			k_ap_unlocked = "Freigeschaltet",
			k_ap_location = "Ort erkundet",
			k_ap_permanent = "Permanent",
			k_ap_check = "Check",
			k_ap_goal = "Ziel",
			k_ap_IP = "Server Adresse",
			k_ap_port = "Port",
			k_ap_slot = "Slot Name",
			k_ap_pass = "Passwort",
			b_ap_connect = "Verbinden",
			k_ap_connected = "Verbunden zu Archipelago bei #1#:#2# as #3#",
			k_ap_connected_no_ip = "Verbunden zu Archipelago as #3#",
			k_ap_connecting = "Verbindet zu Archipelago bei #1#:#2#...",
			k_ap_not_connected = "Nicht verbunden zu Archipelago.",
			k_ap_locked_jokers = 'Gesperrte Joker',
			k_ap_locked_consums = 'Gesperrte Verbrauchsgegenstände',
			k_ap_locked_options = {
				'Schwächen',
				'Wie in YAML',
				'Entfernen'
			},
			k_ap_modded_items = 'Gemoddete Items',
			k_ap_modded_items_options = {
				'Entfernen',
				'Sperren',
				'Freischalten'
			},
			k_ap_deathlink = 'Deathlink',
			k_ap_deathlink_options = {
				'Aus',
				'Wie in YAML',
				'An'
			},
			k_ap_connection_status = 'Verbindungsinformationen',
			k_ap_connection_status_options = {
				'Immer',
				'Nur wenn Verbunden',
				'Verstecke IP',
				'Nie'
			},
			k_ap_cant_change = "Diese Einstellungen können nicht während einer aktiven Verbindung geändert werden",
			ap_goal_text = {
				"Gewinne mit #1# Decks (#2#/#1#)",
				"Schalte #1# Joker frei (#2#/#1#)",
				"Schlage Ante #1#",
				"Gewinne mit #1# Decks auf zumindest #3# Schwierigkeit (#2#/#1#)",
				"Gewinne mit #1# Joker auf zumindest #3# Schwierigkeit (#2#/#1#)",
				"Gewinne mit #1# unterschiedlichen Kombinationen von Decks und Schwierigkeiten (#2#/#1#)"
			},
			k_ap_item_names = 'AP Item Namen',
			k_ap_item_names_options = {
				'Alle Zeigen',
				'Nur Coupons',
				'Nur Verbrauchsgegenstände',
				'Alle Verstecken'
			},
			k_ap_yeah = 'Jawohl!',
			k_asteroid_belt = 'Asteroidengürtel',
			k_ap_you = 'Dich', -- "for you"; this replaces the player's name if they're looking at their own item
		}
	}
}
