return {
	descriptions = {
		Voucher = {
			v_rand_ap_item = {
				name = "Item d'Archipelago",
				text = {
					'Débloque un {C:dark_edition}Item AP {}', 
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
	
		},
		Tarot = {
			c_rand_ap_tarot = {
				name = "Archipelago Tarot",
				text = {
					'Débloque un {C:dark_edition}Item AP {}', 
					"lors de l'utilisation"
				}
			},
			c_rand_ap_tarot_location = {
				name = "Archipelago Tarot",
				text = {--item name is handled through code
					'pour {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_tarot_invalid = {
				name = "Archipelago Tarot",
				text = {
					"{C:inactive}Cet emplacement a",
					"{C:inactive}déjà été recupéré."
				}
			},
		},
		Planet = {
			c_rand_ap_planet = {
				name = "La ceinture d'Archipelago",
				text = {
					'Déverrouille un {C:dark_edition}Item AP {}', 
					"lors de l'utilisation"
				}
			},
			c_rand_ap_planet_location = {
				name = "La ceinture d'Archipelago",
				text = {--item name is handled through code
					'pour {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_planet_invalid = {
				name = "La ceinture d'Archipelago",
				text = {
					"{C:inactive}Cet emplacement a",
					"{C:inactive}déjà été recupéré."
				}
			}
		},
		Spectral = {
			c_rand_ap_spectral = {
				name = "Archipelago Spectral",
				text = {
					'Débloque un {C:dark_edition}Item AP {},', 
					"Crée une copie de l'objet",
					"si c'est le votre",
					"{C:inactive}(Selon la place disponible)"
				}
			},
			c_rand_ap_spectral_invalid = {
				name = "Archipelago Spectral",
				text = {
					"{C:inactive}Cet emplacement a",
					"{C:inactive}déjà été recupéré."
				}
			},
		},
		Back = {
			b_challenge = {
				text = {
					"Applique des {C:attention}Régles Custom{}",
					"et des restrictions"
				}
			}
		},
		Trap = { -- Trap names are NOT used
			t_eternal = {
				name = "Trap Eternel",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Éternel{}!"
					}
			},
			t_perishable = {
				name = "Perishable Trap",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Périssable{}!"
				}
			},
			t_rental = {
				name = "Rental Trap",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Location{}!"
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
					"{s:0.7}Augmente les intérêts", 
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
					"{s:1,C:attention}Paquet Méga-Bouffon{}"
				}
			},
			fill_tag_charm = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:tarot}Paquet Méga-Arcana{}"
				}
			},
			fill_tag_meteor = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:planet}Paquet Méga-Céleste{}"
				}
			},
			fill_tag_ethereal = {
				name = "Receive Consumable Pack",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:spectral}Paquet Méga-Spectral{}"
				}
			},
			fill_juggle = {
				name = "Bonus Badge jongleur",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Badge jongleur{}"
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
				name = "Bonus Badge négatif",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge négatif{}"
				}
			},
			fill_foil = {
				name = "Bonus Badge brillant",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge brillant{}"
				}
			},
			fill_holo = {
				name = "Bonus Badge holographique",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge holographique{}"
				}
			},
			fill_poly = {
				name = "Bonus Badge polychrome",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:dark_edition}Badge polychrome{}"
				}
			},
			fill_double = {
				name = "Bonus Badge double",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Badge double{}"
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
				name = "Bloqué",
				text = {
					"Trouvez ce Joker",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Tarot = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:tarot}Tarot{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Planet = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:planet}Planet{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Spectral = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:spectral}Spectral{}",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Back = {
				name = "Bloqué",
				text = {
					"Trouver ce Deck",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Voucher = {
				name = "Bloqué",
				text = {
					"Trouver ce coupon",
					"en tant qu'{C:dark_edition}Item AP"
				}
			},
			ap_locked_Booster = {
				name = "Bloqué",
				text = {
					"Trouver ce Booster Pack",
					"en tant qu'{C:dark_edition}Item AP"
				}
	 
			ap_locked_Modded = {
				name = "Bloqué",
				text = {
					"Les items moddés",
					"ne peuvent pas être déBloqué"
				}
			},
			ap_challenge_locked_vanilla = {
                name = "Bloqué",
                text = {
                    "Gagner une manche avec au moins",
                    "#1# decks différents à débloquer",
                    "le mode défi",
                    "{C:attention,s:2}#2#/#1#"
                }
            },
			ap_challenge_locked_deck = {
                name = "Bloqué",
                text = {
                    "Trouver le Défi Deck",
                    "en tant qu'{C:dark_edition}Item AP{} à débloquer",
                    "le mode défi"
                }
            },
			ap_challenge_locked_item = {
                name = "Bloqué",
                text = {
                    "Trouver n'importe quel Défi",
                    "en tant qu'{C:dark_edition}Item AP{} à débloquer",
                    "le mode défi"
                }
            },
			ap_challenge_locked_none = {
                name = "Bloqué",
                text = {
                   --"{C:inactive,s:2}Challenges are disabled"
				   "Non disponible",
                   "dans cette version",
				   "{C:attention,s:2}Bientôt disponible !"
                }
            },
			ap_locked_Deck_c = { --temporary
				name = "Bloqué",
				text = {
				   "Non disponible",
                   "dans cette version",
				}
			},
			ap_locked_StakeItem = {
				name = "Bloqué",
				text = {
					"Trouver cette mise",
                    "en tant qu'{C:dark_edition}item AP",
				}
			},
			ap_locked_StakeLine = {
				name = "Bloqué",
				text = {
					"Gagnez une manche avec ce deck",
                    "en difficulté {V:1}#1#{} au moins",
				}
			}
		}
	},
	misc = {
		dictionary = {
			k_ap_unlocked = "Débloqué",
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
			k_ap_connected_no_ip = "Connecté à Archipelago dans le monde #3#",
			k_ap_connecting = "Connexion à Archipelago à #1#:#2#...",
			k_ap_not_connected = "Non connecté à Archipelago",
			k_ap_locked_jokers = 'Jokers Bloqués',
			k_ap_locked_consums = 'Consommable Bloqué',
			k_ap_locked_options = {
				'Débuff',
				'Suivre le YAML',
				'Supprimer'
			},
			k_ap_modded_items = 'Items Moddés',
			k_ap_modded_items_options = {
				'Supprimer',
				'Bloqué',
				'Débloqué'
			},
			k_ap_deathlink = 'Deathlink',
			k_ap_deathlink_options = {
				"Forcer à l'arret",
				'Suivre le YAML',
				"Forcer en marche"
			},
			k_ap_connection_status = "Informations sur l'état de la connexion",
			k_ap_connection_status_options = {
				'Complet',
				'Uniquement vonnecté',
				'IP Caché',
				'Aucune'
			},
			k_ap_cant_change = "Ces options ne peuvent pas être modifiées lorsque l'on est connecté à Archipelago",
			ap_goal_text = {
				"Battre #1# Decks (#2#/#1#)",
				"Débloquer #1# Jokers (#2#/#1#)",
				"Battre #1# mises",
				"Battre #1# Decks avec au moins la difficulté #3# (#2#/#1#)",
				"Gagne avec #1# Jokers avec au moins la difficulté #3# (#2#/#1#)",
				"Gagne avec #1# des combinaisons uniques de jeux et de mises (#2#/#1#)"
			},
			k_ap_item_names = "Nom d'Item AP",
			k_ap_item_names_options = {
				'Afficher tout',
				'Uniquement Coupon',
				'Uniquement Consommables',
				'Masquer tout'
			},
			k_ap_yeah = 'Yeah!',
			k_asteroid_belt = "La ceinture d'astéroïdes"
		}
	}
}
