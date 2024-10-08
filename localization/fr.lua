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
			}
		},
		Tarot = {
			c_rand_ap_tarot = {
				name = "Tarot d'Archipelago",
				text = {
					'Débloque un {C:dark_edition}Item AP {}', 
					"lors de l'utilisation"
				}
			},
			c_rand_ap_tarot_location = {
				name = "Tarot d'Archipelago",
				text = {--item name is handled through code
					'pour {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_tarot_invalid = {
				name = "Tarot d'Archipelago",
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
				name = "Spectral d'Archipelago",
				text = {
					'Débloque un {C:dark_edition}Item AP {},', 
					"Crée une copie de l'objet",
					"si c'est le votre",
					"{C:inactive}(Selon la place disponible)"
				}
			},
			c_rand_ap_spectral_invalid = {
				name = "Spectral d'Archipelago",
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
		Trap = {
			t_eternal = {
				name = "Trap Éternel",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Éternel{}!"
					}
			},
			t_perishable = {
				name = "Trap Périssable",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Périssable{}!"
				}
			},
			t_rental = {
				name = "Trap Location",
				text = {
					"{s:0.7}Un Joker aléatoire", 
					"{s:1}est devenu {C:attention}Location{}!"
					}
			},
			t_money = {
				name = "Trap Banqueroute ",
				text = {"{s:0.7}Perdre tout l'argent"}
			},
			t_hand = {
				name = "Trap Main",
				text = {
					"{C:blue}-1{} Main", 
					"{s:0.7}cette manche"
				}
			},
			t_discard = {
				name = "Trap Défausse",
				text = {
					"{C:red}-1{} Défausse",
					"{s:0.7}cette manche"
				}
			}
		},
		Bonus = {
			op_discard = {
				name = "Bonus Défausse",
				text = {
					"{C:red}+1{} Défausse", 
					"{s:0.7}à chaque manche"
				}
			},
			op_money = {
				name = "Bonus d'argent de départ",
				text = {
					"{s:0.7}Commencer avec", 
					"{s:1}{C:money}$1{} en plus"
				}
			},
			op_hand = {
				name = "Bonus Main",
				text = {
					"{C:blue}+1{} main", 
					"{s:0.7}à chaque manche"
					}
			},
			op_hand_size = { 
				name = "Bonus Taille de la Main",
				text = {"{C:attention}+1{} à la taille de la main"}
			},
			op_interest = {
				name = "Bonus Intérêts Max",
				text = {
					"{s:0.7}Augmente les intérêts", 
					"{s:1}de {C:money}$1{}"
					}
			},
			op_joker_slot = {
				name = "Bonus Emplacement Joker",
				text = {"{C:dark_edition}+1{} emplacement de Joker"}
			},
			op_consum_slot = {
				name = "Bonus Emplacement Consommable",
				text = {"{s:0.6,C:dark_edition}+1{} emplacement de Consommable"}
			},
			
			fill_money = {
				name = "Bonus d'argent",
				text = {
					"{s:0.7}Vous obtenez", 
					"{s:1}{C:money}$8{} en plus"
				}
			},
			fill_buffoon = {
				name = "Pack de Bouffon gratuit",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Paquet Méga-Bouffon{}"
				}
			},
			fill_tag_charm = {
				name = "Pack de consommables gratuit",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:tarot}Paquet Méga-Arcana{}"
				}
			},
			fill_tag_meteor = {
				name = "Pack de consommables gratuit",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:planet}Paquet Méga-Céleste{}"
				}
			},
			fill_tag_ethereal = {
				name = "Pack de consommables gratuit",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:spectral}Paquet Méga-Spectral{}"
				}
			},
			fill_juggle = {
				name = "Bonus Badge Jongleur",
				text = {
					"{s:0.7}Vous obtenez un",
					"{s:1,C:attention}Badge Jongleur{}"
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
			ap_hint_ante = {
				name = "Bloqué",
				text = {
					"Battre la Mise {C:attention}#1#{} avec",
					"{C:attention}#2#{} sur",
					"la difficutlé {C:ap_stake}#3#{}"
				}
			},
			ap_locked_Joker = {
				name = "Bloqué",
				text = {
					"Trouver ce Joker",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Ce Joker est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver ce Joker en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}..."
				},
				card_check = {
					"Trouver ce Joker sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Tarot = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:tarot}Tarot{}",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Cette carte de Tarot est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver cette carte {C:tarot}Tarot{} en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver cette carte {C:tarot}Tarot{} sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Planet = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:planet}Planète{}",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Cette carte {C:planet}Planète{} est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver cette carte {C:planet}Planète{} en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver cette carte {C:planet}Planète{} sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Spectral = {
				name = "Bloqué",
				text = {
					"Trouver cette carte {C:spectral}Spectral{}",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Cette carte Spectral est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver cette carte {C:spectral}Spectral{} en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver cette carte {C:spectral}Spectral{} sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Back = {
				name = "Bloqué",
				text = {
					"Trouver ce Deck",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Ce Deck est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver ce Deck en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver ce Deck sur",
					"le {C:tarot,T:c_rand_ap_tarot}Tarot d'Archipelago{},",
					"la {C:planet,T:c_rand_ap_planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral,T:c_rand_ap_spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Voucher = {
				name = "Bloqué",
				text = {
					"Trouver ce Coupon",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Ce Coupon est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver ce Coupon en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver ce Coupon sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
			ap_locked_Booster = {
				name = "Bloqué",
				text = {
					"Trouver ce Booster Pack",
					"en tant qu'{C:dark_edition}Item AP"
				},
				nonlocal = {
					"{C:inactive}Ce Booster Pack est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver ce Booster Pack en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver ce Booster Pack sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
				}
			},
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
					"Trouver cette Mise",
                    "en tant qu'{C:dark_edition}item AP",
				},
				nonlocal = {
					"{C:inactive}Cette Mise est dans",
					"le monde {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Trouver cette Mise en tant",
					"qu'{C:dark_edition}Item AP{} dans la boutique",
					"en difficulté {C:ap_stake}#1#{}"
				},
				card_check = {
					"Trouver cette Mise sur",
					"le {C:tarot}Tarot d'Archipelago{},",
					"la {C:planet}Ceinture d'Archipelago{}",
					"ou la carte {C:spectral}Spectral d'Archipelago"
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
			k_ap_locked_consums = 'Consommables Bloqués',
			k_ap_locked_options = {
				'Débuff',
				'Utiliser le YAML',
				'Bloqué'
			},
			k_ap_modded_items = 'Items Moddés',
			k_ap_modded_items_options = {
				'Supprimer',
				'Bloqué',
				'Débloqué'
			},
			k_ap_deathlink = 'Deathlink',
			k_ap_deathlink_options = {
				"Désactiver",
				'Utiliser le YAML',
				"Activer"
			},
			k_ap_connection_status = "Informations sur l'état de la connexion",
			k_ap_connection_status_options = {
				'Complète',
				'Uniquement connecté',
				'IP Caché',
				'Aucune'
			},
			k_ap_cant_change = "Ces options ne peuvent pas être modifiées lorsque l'on est connecté à Archipelago",
			ap_goal_text = {
				"Battre #1# Decks (#2#/#1#)",
				"Débloquer #1# Jokers (#2#/#1#)",
				"Battre #1# Mises",
				"Battre #1# Decks avec au moins la difficulté #3# (#2#/#1#)",
				"Gagner avec #1# Jokers avec au moins la difficulté #3# (#2#/#1#)",
				"Gagner avec #1# des combinaisons uniques de jeux et de mises (#2#/#1#)"
			},
			k_ap_item_names = "Nom d'Item AP",
			k_ap_item_names_options = {
				'Afficher tout',
				'Uniquement Coupons',
				'Uniqu. Consommables',
				'Masquer tout'
			},
			k_ap_yeah = 'Yeah!',
			k_asteroid_belt = "La ceinture d'astéroïdes",
			k_ap_you = 'toi',
			k_ap_or = 'ou', 
			-- upcoming features
			-- (currently unused)
			ap_ante_left = 'Chèques de Mise restante:',
			ap_next_ante = 'Chèques suivante: Mise ###',
			ap_shops_left = 'Chèques de la boutique restants:',
			
			b_ap_buffs = 'Bonus', -- Run info tab displaying OP bonuses (currently unused)
			ap_buff_text = "Bonus permanent d'Archipelago",
			ap_buff_bonushands = "Main: ",
			ap_buff_bonusdiscards = "Défausse: ",
			ap_buff_bonushandsize = "Taille de la Main: ",
			ap_buff_bonusstartingmoney = "L'argent de départ: ",
			ap_buff_maxinterest = "Intérêt maximum: ",
			ap_buff_bonusjoker = "Emplacement Joker: ",
			ap_buff_bonusconsumable = "Emplacement consommable: ",
		}
	}
}
