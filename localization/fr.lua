return {
	descriptions = {
		Voucher = {
			v_rand_ap_item = {
				name = "Item d'Archipelago",
				text = {
					'Déverrouille un {C:dark_edition}Item AP {}', 
					"quand on l'achete"
					}
			},
			v_rand_ap_item_location = {
				name = "Item d'Archipelago",
				text = {--item name is handled through code
					'pour {C:dark_edition}#1#{}'
					}
			},
			v_rand_ap_item_invalid = {
				name = "Item d'Archipelago",
				text = {
					"{C:inactive}Cet emplacement a",
					"{C:inactive}déjà été recupéré."
				}
			}
		},
		Back = {
			b_challenge = {
				text = {
					"S'applique {C:attention}Custom Rules{}",
					"et des restrictions"
				}
			}
		},
		Trap = { -- Trap names are NOT used
			t_eternal = {
				name = "Trap Eternel",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est {C:attention}Eternal{}!"
					}
			},
			t_perishable = {
				name = "Perishable Trap",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est {C:attention}Perishable{}!"
				}
			},
			t_rental = {
				name = "Rental Trap",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est {C:attention}Rental{}!"
					}
			},
			t_money = {
				name = "Bankruptcy Trap",
				text = {"{s:0.7}Perdre tout l'argent"}
			},
			t_hand = {
				name = "Hand Trap",
				text = {
					"{C:blue}-1{} Main", 
					"{s:0.7}cette manche"
				}
			},
			t_discard = {
				name = "Discard Trap",
				text = {
					"{C:red}-1{} Défausse",
					"{s:0.7}cette manche"
				}
			}
		},
		Bonus = { -- Bonus names are NOT used
			op_discard = {
				name = "Bonus Discard",
				text = {
					"{C:red}+1{} Défausse", 
					"{s:0.7}à chaque manche"
				}
			},
			op_money = {
				name = "Bonus Starting Money",
				text = {
					"{s:0.7}Commencer avec", 
					"{s:1}{C:money}$1{} en plus"
				}
			},
			op_hand = {
				name = "Bonus Hand",
				text = {
					"{C:blue}+1{} main", 
					"{s:0.7}à chaque manche"
					}
			},
			op_hand_size = { 
				name = "Bonus Hand Size",
				text = {"{C:attention}+1{} à la taille de la main"}
			},
			op_interest = {
				name = "Bonus Max Interest",
				text = {
					"{s:0.7}Augmenter les intérêts", 
					"{s:1}de {C:money}$5{}"
					}
			},
			op_joker_slot = {
				name = "Bonus Joker Slot",
				text = {"{C:dark_edition}+1{} emplacement de Joker"}
			},
			op_consum_slot = {
				name = "Bonus Consumable Slot",
				text = {"{s:0.6,C:dark_edition}+1{} emplacement de Consommable"}
			},
			
			fill_money = {
				name = "Bonus Money",
				text = {
					"{s:0.7}Vous obtenez", 
					"{s:1}{C:money}$8{} en plus"
				}
			},
			fill_buffoon = {
				name = "Receive Buffoon Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Mega Buffoon Pack{}"
				}
			},
			fill_tag_charm = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:tarot}Mega Arcana Pack{}"
				}
			},
			fill_tag_meteor = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:planet}Mega Celestial Pack{}"
				}
			},
			fill_tag_ethereal = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:spectral}Mega Spectral Pack{}"
				}
			},
			fill_juggle = {
				name = "Bonus Juggle Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Juggle Tag{}"
				}
			},
			fill_d_six = {
				name = "Bonus Badge D6",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Badge D6{}"
				}
			},
			fill_uncommon = {
				name = "Bonus Badge peu commun",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:green} Badge peu commun{}"
				}
			},
			fill_rare = {
				name = "Bonus Badge rare",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:red}Badge rare{}"
				}
			},
			fill_negative = {
				name = "Bonus Negative Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge Negatif{}"
				}
			},
			fill_foil = {
				name = "Bonus Foil Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge Foil{}"
				}
			},
			fill_holo = {
				name = "Bonus Holographic Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge Holographic{}"
				}
			},
			fill_poly = {
				name = "Bonus Polychrome Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge Polychrome{}"
				}
			},
			fill_double = {
				name = "Bonus Double Tag",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Badge Double{}"
				}
			}
		},
		location = {     --this is the notification for 
			location = { --when the client has the data about the location.
				text = { --the placeholder "Location reached" is misc/dictionary/k_ap_location
					"{s:0.6}pour {C:dark_edition,s:0.6}#1#"
				} -- (the lines for the item name are done through code)
			}
		},
		Other = {
			ap_debuffed = {
                name = "Débuff",
                text = {
                    "Toutes les capacités sont désactivées",
                    "jusqu'à que cette carte soit trouvée",
					"en tant qu'{C:dark_edition}Item AP"
                }
            },
			ap_locked_Joker = {
				name = "Verrouillé",
				text = {
					"Trouvez ce Joker",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Tarot = {
				name = "Verrouillé",
				text = {
					"Trouver cette carte {C:tarot}Tarot{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Planet = {
				name = "Verrouillé",
				text = {
					"Trouver cette carte {C:planet}Planet{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Spectral = {
				name = "Verrouillé",
				text = {
					"Trouver cette carte {C:spectral}Spectral{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Back = {
				name = "Verrouillé",
				text = {
					"Trouver ce Deck",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Voucher = {
				name = "Verrouillé",
				text = {
					"Trouver ce coupon",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Booster = {
				name = "Verrouillé",
				text = {
					"Trouver ce Booster Pack",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_challenge_locked_vanilla = {
                name = "Verrouillé",
                text = {
                    "Gagner une manche avec au moins",
                    "#1# decks différents à débloquer",
                    "le mode défi",
                    "{C:attention,s:2}#2#/#1#"
                }
            },
			ap_challenge_locked_deck = {
                name = "Verrouillé",
                text = {
                    "Trouver le Défi Deck",
                    "en tant qu'{C:dark_edition}Item AP{} à débloquer",
                    "le mode défi"
                }
            },
			ap_challenge_locked_item = {
                name = "Verrouillé",
                text = {
                    "Trouver n'importe quel Défi",
                    "en tant qu'{C:dark_edition}Item AP{} à débloquer",
                    "le mode défi"
                }
            },
			ap_challenge_locked_none = {
                name = "Verrouillé",
                text = {
                   --"{C:inactive,s:2}Challenges are disabled"
				   "Non disponible",
                   "dans cette version",
				   "{C:attention,s:2}Bientôt disponible !"
                }
            },
			ap_locked_Deck_c = { --temporary
				name = "Verrouillé",
				text = {
				   "Non disponible",
                   "dans cette version",
				}
			},
			ap_locked_StakeItem = {
				name = "Verrouillé",
				text = {
					"Trouver cette mise",
                    "en tant qu'{C:dark_edition}item AP",
				}
			},
			ap_locked_StakeLine = {
				name = "Verrouillé",
				text = {
					"Gagnez une manche avec ce deck",
                    "en difficulté {V:1}#1#{} au moins",
				}
			},
			ap_goal_decks = {
				text = {"Gagnez avec #1# Decks (#2#/#1#)"}
			},
			ap_goal_jokers = {
				text = {"Gagnez en deverouillant #1# Jokers (#2#/#1#)"}
			},
			ap_goal_ante = {
				text = {"Gagnez avec #1# mises"}
			},
			ap_goal_deck_stickers = {
				text = {"Gagnez avec #1# Decks sur au moins la difficulté #3# (#2#/#1#)"}
			},
			ap_goal_joker_stickers = {
				text = {"Gagnez avec #1# Jokers en difficulté #3# minimum (#2#/#1#)"}
			},
			ap_goal_unique_wins = {
				text = {"Gagnez avec #1# combinaisons uniques de decks et de mises (#2#/#1#)"}
			}
		}
	},
	misc = {
		dictionary = {
			k_ap_unlocked = "Déverrouillé",
			k_ap_location = "Emplacement trouvé",
			k_ap_permanent = "Permanent",
			k_ap_check = "Check",
			k_ap_goal = "Objectif",
			k_ap_IP = "Adresse du serveur",
			k_ap_port = "Port",
			k_ap_slot = "Nom du monde",
			k_ap_pass = "Mot de passe",
			b_ap_connect = "Connexion",
			k_ap_connected = "Connecté à Archipelago à #1#:#2# dans le monde #3#",
			k_ap_connecting = "Connexion à Archipelago à #1#:#2#...",
			k_ap_not_connected = "Non connecté à Archipelago"
		}
	}
}
