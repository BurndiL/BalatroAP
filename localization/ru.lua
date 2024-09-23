return {
	descriptions = {
		Voucher = {
			v_rand_ap_item = {
				name = "Айтем Archipelago",
				text = {
					'Открывает {C:dark_edition}Айтем AP{}', 
					'при выкупке'
					}
			},
			v_rand_ap_item_location = {
				name = "Айтем Archipelago", 
				text = {--item name is handled through code
					'для {C:dark_edition}#1#{}'
					}
			},
			v_rand_ap_item_invalid = {
				name = "Айтем Archipelago",
				text = {
					"{C:inactive}Эта локация",
					"{C:inactive}уже чекнута."
				}
			}
		},
		Tarot = {
			c_rand_ap_tarot = {
				name = "Таро Archipelago",
				text = {
					'Открывает {C:dark_edition}Айтем AP{}',
					'при использовании'
				}
			},
			c_rand_ap_tarot_location = {
				name = "Таро Archipelago",
				text = {--item name is handled through code
					'для {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_tarot_invalid = {
				name = "Таро Archipelago",
				text = {
					"{C:inactive}Эта локация",
					"{C:inactive}уже чекнута."
				}
			},
		},
		Planet = {
			c_rand_ap_planet = {
				name = "Пояс Archipelago",
				text = {
					'Открывает {C:dark_edition}Айтем AP{}',
					'при использовании'
				}
			},
			c_rand_ap_planet_location = {
				name = "Пояс Archipelago",
				text = {--item name is handled through code
					'для {C:dark_edition}#1#{}'
					}
			},
			c_rand_ap_planet_invalid = {
				name = "Пояс Archipelago",
				text = {
					"{C:inactive}Эта локация",
					"{C:inactive}уже чекнута."
				}
			}
		},
		Spectral = {
			c_rand_ap_spectral = {
				name = "Спектральный Archipelago",
				text = {
					'Открывает {C:dark_edition}Айтем AP{},',
					'создваёт его копию,',
					"если он Ваш",
					"{C:inactive}(должно быть место)"
				}
			},
			c_rand_ap_spectral_invalid = {
				name = "Спектральный Archipelago",
				text = {
					"{C:inactive}Эта локация",
					"{C:inactive}уже чекнута."
				}
			},
		},
		Back = {
			b_challenge = {
				text = {
					"Использует {C:attention}Особые правила{}",
					"и ограничения"
				}
			}
		},
		Trap = { 
			t_eternal = {
				name = "Вечная Ловушка",
				text = {
					"{s:0.7}Случайный Джокер", 
					"{s:1}стал {C:attention}Вечным{}!"
					}
			},
			t_perishable = {
				name = "Портящая Ловушка",
				text = {
					"{s:0.7}Случайный Джокер", 
					"{s:1}стал {C:attention}Портящимся{}!"
				}
			},
			t_rental = {
				name = "Прокатная Ловушка",
				text = {
					"{s:0.7}Случайный Джокер", 
					"{s:1}стал {C:attention}Прокатным{}!"
					}
			},
			t_money = {
				name = "Банкротство",
				text = {"{s:0.7}Потеряйте все деньги"}
			},
			t_hand = {
				name = "Ручная Ловушка",
				text = {
					"{C:blue}-1{} рука", 
					"{s:0.7}в этом раунде"
				}
			},
			t_discard = {
				name = "Сбросная Ловушка",
				text = {
					"{C:red}-1{} сброс",
					"{s:0.7}в этом раунде"
				}
			}
		},
		Bonus = {
			op_discard = {
				name = "Бонусный Сброс",
				text = {
					"{C:red}+1{} сброс", 
					"{s:0.7}в каждом раунде"
				}
			},
			op_money = {
				name = "Бонусный начальный капитал",
				text = {
					"{s:0.7}Начинайте с", 
					"{s:1}дополнительным {C:money}$1{}"
				}
			},
			op_hand = {
				name = "Бонусная Рука",
				text = {
					"{C:blue}+1{} рука", 
					"{s:0.7}в каждом раунде"
					}
			},
			op_hand_size = { 
				name = "Бонусный размер руки",
				text = {"{C:attention}+1{} размер руки"}
			},
			op_interest = {
				name = "Бонусные Проценты",
				text = {
					"{s:0.7}Поднимите лимит", 
					"{s:1}процентов на {C:money}$1{}"
					}
			},
			op_joker_slot = {
				name = "Бонусный слот Джокера",
				text = {"{C:dark_edition}+1{} слот Джокера"}
			},
			op_consum_slot = {
				name = "Бонусный слот расходуемого",
				text = {"{s:0.6,C:dark_edition}+1{} слот расходуемого"}
			},
			
			fill_money = {
				name = "Бонусные Деньги",
				text = {
					"{s:0.7}Получите", 
					"{s:1}до {C:money}$8{}"
				}
			},
			fill_buffoon = {
				name = "Бесплатный набор шута",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:attention}Меганабор шута{}"
				}
			},
			fill_tag_charm = {
				name = "Бесплатный набор расходуемого",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:tarot}Набор мегааркана{}"
				}
			},
			fill_tag_meteor = {
				name = "Бесплатный набор расходуемого",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:planet}Меганебесный набор{}"
				}
			},
			fill_tag_ethereal = {
				name = "Бесплатный набор расходуемого",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:spectral}Мегаспектральный набор{}"
				}
			},
			fill_juggle = {
				name = "Бонусный Жонглерский Тег",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:attention}Жонглерский тег{}"
				}
			},
			fill_d_six = {
				name = "Бонусный Тег D6",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:attention}Тег D6{}"
				}
			},
			fill_uncommon = {
				name = "Бонусный Необычный Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:green}Необычный тег{}"
				}
			},
			fill_rare = {
				name = "Бонусный Редкий Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:red}Редкий тег{}"
				}
			},
			fill_negative = {
				name = "Бонусный Негативный Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:dark_edition}Негативный тег{}"
				}
			},
			fill_foil = {
				name = "Бонусный Фольговый Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:dark_edition}Фольговый тег{}"
				}
			},
			fill_holo = {
				name = "Бонусный Голографический Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:dark_edition}Голографический тег{}"
				}
			},
			fill_poly = {
				name = "Бонусный Полихромный Тег",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:dark_edition}Полихромный тег{}"
				}
			},
			fill_double = {
				name = "Бонусный Двойной Тег",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:attention}Двойной тег{}"
				}
			}
		},
		location = {     --this is the notification for 
			location = { --when the client has the data about the location.
				text = { --the placeholder "Location reached" is misc/dictionary/k_ap_location
					"{s:0.6}для {C:dark_edition,s:0.6}#1#"
				} -- (the lines for the item name are done through code)
			}
		},
		Other = {
			ap_debuffed = {
                name = "Ослаблено",
                text = {
                    "Все способности отключены",
                    "пока эта карта не найдена",
					"в виде {C:dark_edition}Айтема AP"
                }
            },
			ap_hint_ante = {
				name = "Заблокировано",
				text = {
					"Одолейте Анте {C:attention}#1#{}",
					"на сложности {C:ap_stake}#3#{}",
					"({C:attention}#2#{})"
				}
			},
			ap_locked_Joker = {
				name = "Заблокировано",
				text = {
					"Найдите этого Джокера",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Этот Джокер находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите этого Джокера в виде",
					"{C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите этого Джокера",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Tarot = {
				name = "Заблокировано",
				text = {
					"Найдите эту карту {C:tarot}Таро{}",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Эта карта Таро находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите эту карту {C:tarot}Таро{}",
					"в виде {C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите эту карту {C:tarot}Таро{}",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Planet = {
				name = "Заблокировано",
				text = {
					"Найдите эту карту {C:planet}планеты{}",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Эта карта планеты находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите эту карту {C:planet}планеты{}",
					"в виде {C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите эту карту {C:planet}планеты{}",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Spectral = {
				name = "Заблокировано",
				text = {
					"Найдите {C:spectral}спектральную{} карту",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Эта спектральная карта находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите эту {C:spectral}спектральную{} карту",
					"в виде {C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите эту {C:spectral}спектральную{} карту",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Back = {
				name = "Заблокировано",
				text = {
					"Найдите эту колоду",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Эта колода находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите эту колоду в виде",
					"{C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите эту колоду",
					"на {C:tarot,T:c_rand_ap_tarot}Таро Archipelago{},",
					"{C:planet,T:c_rand_ap_planet}Поясе Archipelago{} или",
					"{C:spectral,T:c_rand_ap_spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Voucher = {
				name = "Заблокировано",
				text = {
					"Найдите этот ваучер",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Этот ваучер находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите этот ваучер в виде",
					"{C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите этот ваучер",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Booster = {
				name = "Заблокировано",
				text = {
					"Найдите этот набор",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Этот набор находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите этот набор в виде",
					"{C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите этот набор",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{} или",
					"{C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_Modded = {
				name = "Заблокировано",
				text = {
					"Предметы из модов",
					"не открываются"
				}
			},
			ap_challenge_locked_vanilla = {
                name = "Заблокировано",
                text = {
                    "Выиграйте партию с минимум",
                    "#1# разными колодами, чтобы открыть",
                    "режим испытания",
                    "{C:attention,s:2}#2#/#1#"
                }
            },
			ap_challenge_locked_deck = {
                name = "Заблокировано",
                text = {
                    "Найдите Колоду испытаний",
                    "в виде {C:dark_edition}Айтема AP{}, чтобы открыть",
                    "режим испытания"
                }
            },
			ap_challenge_locked_item = {
                name = "Заблокировано",
                text = {
                    "Найдите любое Испытание",
                    "в виде {C:dark_edition}Айтема AP{}, чтобы открыть",
                    "режим испытания"
                }
            },
			ap_challenge_locked_none = {
                name = "Заблокировано",
                text = {
                   --"{C:inactive,s:2}Испытания отключены."
				   "Недоступно",
                   "в этой версии",
				   "{C:attention,s:2}Скоро!"
                }
            },
			ap_locked_Deck_c = { --temporary
				name = "Недоступно",
				text = {
					"Недоступно",
                    "в этой версии"
				}
			},
			ap_locked_StakeItem = {
				name = "Недоступно",
				text = {
					"Найдите эту Ставку",
					"в виде {C:dark_edition}Айтема AP"
				},
				nonlocal = {
					"{C:inactive}Эта Ставка находится",
					"в игре, в которую",
					"играет {C:dark_edition}#1#{C:inactive}..."
				},
				shop_check = {
					"Найдите эту Ставку в виде",
					"{C:dark_edition}Айтема AP{} в Лавке на",
					"сложности {C:ap_stake}#1#{}"
				},
				card_check = {
					"Найдите эту Ставку",
					"на {C:tarot}Таро Archipelago{},",
					"{C:planet}Поясе Archipelago{}",
					"или {C:spectral}Спектральном Archipelago"
				}
			},
			ap_locked_StakeLine = {
				name = "Недоступно",
				text = {
					"Выйграйте партию с этой колодой",
                    "на сложности {V:1}#1#{} и выше",
				}
			},
		}
	},
	misc = {
		dictionary = {
			k_ap_unlocked = "Разблокировано",
			k_ap_location = "Локация достигнута",
			k_ap_permanent = "Постоянное",
			k_ap_check = "Чек",
			k_ap_goal = "Цель",
			k_ap_IP = "Адрес сервера",
			k_ap_port = "Порт",
			k_ap_slot = "Название слота",
			k_ap_pass = "Пароль",
			b_ap_connect = "Подключиться",
			k_ap_connected = "Подключено к Archipelago по адресу #1#:#2# как #3#",
			k_ap_connected_no_ip = "Подключено к Archipelago как #3#",
			k_ap_connecting = "Идёт подключение с Archipelago по адресу #1#:#2#...",
			k_ap_not_connected = "Не подключено к Archipelago.",
			k_ap_locked_jokers = 'Закрытые Джокеры',
			k_ap_locked_consums = 'Закрытое расходуемое',
			k_ap_locked_options = {
				'Ослабить',
				'Следовать YAML',
				'Убрать'
			},
			k_ap_modded_items = 'Предметы из модов',
			k_ap_modded_items_options = {
				'Убрать',
				'Закрыть',
				'Разблокировать'
			},
			k_ap_deathlink = 'Deathlink',
			k_ap_deathlink_options = {
				'Выключить',
				'Следовать YAML',
				'Включить'
			},
			k_ap_connection_status = 'Информация о подключении',
			k_ap_connection_status_options = {
				'Полная',
				'Когда подключено',
				'Спрятать IP',
				'Никакой'
			},
			k_ap_cant_change = "Эти настройки нельзя менять, пока Вы подключены к Archipelago",
			ap_goal_text = {
				"Выйграйте с #1# колодами (#2#/#1#)",
				"Разблокируйте #1# Джокеров (#2#/#1#)",
				"Одолейте Анте #1#",
				"Выйграйте с #1# колодами на сложности #3# и выше (#2#/#1#)",
				"Выйграйте с #1# Джокерами на сложности #3# и выше (#2#/#1#)",
				"Выйграте на #1# уникальных комбинациях колод и ставок (#2#/#1#)"
			},
			k_ap_item_names = 'Названия Айтемов AP',
			k_ap_item_names_options = {
				'Показывать все',
				'Только на ваучере',
				'Только на расходуемом',
				'Спрятать все'
			},
			k_ap_yeah = 'Да!',
			k_asteroid_belt = 'Пояс астероидов',
			k_ap_you = 'Вас', -- "for you"; this replaces the player's name if they're looking at their own item
			k_ap_or = 'или', -- used when constructing non-local voucher names (ex: "Hone or Glow Up for Player1")
			-- the entries below are for
			-- upcoming features
			-- (currently unused)
			ap_ante_left = 'Осталось чеков Анте:', -- remaining checks for beating antes
			ap_next_ante = 'Следующий чек: Анте ###', -- next ante with an unchecked location
			ap_shops_left = 'Осталось чеков в Лавке:', -- remaining shop checks
			
			b_ap_buffs = 'Бонусы',
			ap_buff_text = "Постоянные бонусы Archipelago",
			ap_buff_bonushands = "Руки: ",
			ap_buff_bonusdiscards = "Сбросы: ",
			ap_buff_bonushandsize = "Размер руки: ",
			ap_buff_bonusstartingmoney = "Начальный капитал: ",
			ap_buff_maxinterest = "Лимит процентов: ",
			ap_buff_bonusjoker = "Слоты Джокера: ",
			ap_buff_bonusconsumable = "Слоты расходуемого: ",
		}
	}
}
