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
		Back = {
			b_challenge = {
				text = {
					"Применяет {C:attention}Особые правила{}",
					"и ограничения"
				}
			}
		},
		Trap = { -- Trap names are NOT used
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
		Bonus = { -- Bonus names are NOT used
			op_discard = {
				name = "Бонусный Сброс",
				text = {
					"{C:red}+1{} сброс", 
					"{s:0.7}в каждом раунде"
				}
			},
			op_money = {
				name = "Бонусные подъемные",
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
				name = "Получите набор шута",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:attention}Меганабор шута{}"
				}
			},
			fill_tag_charm = {
				name = "Получите набор расходуемого",
				text = {
					"{s:0.7}Получите",
					"{s:1,C:tarot}Набор мегааркана{}"
				}
			},
			fill_tag_meteor = {
				name = "Получите набор расходуемого",
				text = {
					"{s:0.7}Получите", 
					"{s:1,C:planet}Меганебесный набор{}"
				}
			},
			fill_tag_ethereal = {
				name = "Получите набор расходуемого",
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
			ap_locked_Joker = {
				name = "Заблокировано",
				text = {
					"Найдите этого Джокера",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Tarot = {
				name = "Заблокировано",
				text = {
					"Найдите эту карту {C:tarot}Таро{}",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Planet = {
				name = "Заблокировано",
				text = {
					"Найдите эту карту {C:planet}планеты{}",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Spectral = {
				name = "Заблокировано",
				text = {
					"Найдите {C:spectral}спектральную{} карту",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Back = {
				name = "Заблокировано",
				text = {
					"Найдите эту колоду",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Voucher = {
				name = "Заблокировано",
				text = {
					"Найдите этот ваучер",
					"в виде {C:dark_edition}Айтема AP"
				}
			},
			ap_locked_Booster = {
				name = "Заблокировано",
				text = {
					"Найдите этот набор",
					"в виде {C:dark_edition}Айтема AP"
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
				"Победите Босс-блайнд на анте #1#",
				"Выйграйте с #1# колодами на сложности #3# и выше (#2#/#1#)",
				"Выйграйте с #1# Джокерами на сложности #3# и выше (#2#/#1#)",
				"Выйграте на #1# уникальных комбинациях колод и ставок (#2#/#1#)"
			},
		}
	}
}
