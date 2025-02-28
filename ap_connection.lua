NFS.load(G.AP.this_mod.path .. "utils.lua")()

G.APItems = {
    -- Backs (=decks but referred to as backs)
    [G.AP.id_offset + 1] = "b_red",        [G.AP.id_offset + 2] = "b_blue",
    [G.AP.id_offset + 3] = "b_yellow",     [G.AP.id_offset + 4] = "b_green",
    [G.AP.id_offset + 5] = "b_black",      [G.AP.id_offset + 6] = "b_magic",
    [G.AP.id_offset + 7] = "b_nebula",     [G.AP.id_offset + 8] = "b_ghost",
    [G.AP.id_offset + 9] = "b_abandoned",  [G.AP.id_offset + 10] = "b_checkered",
    [G.AP.id_offset + 11] = "b_zodiac",    [G.AP.id_offset + 12] = "b_painted",
    [G.AP.id_offset + 13] = "b_anaglyph",  [G.AP.id_offset + 14] = "b_plasma",
    [G.AP.id_offset + 15] = "b_erratic",

    -- Jokers
    [G.AP.id_offset + 16] = "j_joker",
    [G.AP.id_offset + 17] = "j_greedy_joker",
    [G.AP.id_offset + 18] = "j_lusty_joker",
    [G.AP.id_offset + 19] = "j_wrathful_joker",
    [G.AP.id_offset + 20] = "j_gluttenous_joker",
    [G.AP.id_offset + 21] = "j_jolly",
    [G.AP.id_offset + 22] = "j_zany",
    [G.AP.id_offset + 23] = "j_mad",
    [G.AP.id_offset + 24] = "j_crazy",
    [G.AP.id_offset + 25] = "j_droll",
    [G.AP.id_offset + 26] = "j_sly",
    [G.AP.id_offset + 27] = "j_wily",
    [G.AP.id_offset + 28] = "j_clever",
    [G.AP.id_offset + 29] = "j_devious",
    [G.AP.id_offset + 30] = "j_crafty",
    [G.AP.id_offset + 31] = "j_half",
    [G.AP.id_offset + 32] = "j_stencil",
    [G.AP.id_offset + 33] = "j_four_fingers",
    [G.AP.id_offset + 34] = "j_mime",
    [G.AP.id_offset + 35] = "j_credit_card",
    [G.AP.id_offset + 36] = "j_ceremonial",
    [G.AP.id_offset + 37] = "j_banner",
    [G.AP.id_offset + 38] = "j_mystic_summit",
    [G.AP.id_offset + 39] = "j_marble",
    [G.AP.id_offset + 40] = "j_loyalty_card",
    [G.AP.id_offset + 41] = "j_8_ball",
    [G.AP.id_offset + 42] = "j_misprint",
    [G.AP.id_offset + 43] = "j_dusk",
    [G.AP.id_offset + 44] = "j_raised_fist",
    [G.AP.id_offset + 45] = "j_chaos",
    [G.AP.id_offset + 46] = "j_fibonacci",
    [G.AP.id_offset + 47] = "j_steel_joker",
    [G.AP.id_offset + 48] = "j_scary_face",
    [G.AP.id_offset + 49] = "j_abstract",
    [G.AP.id_offset + 50] = "j_delayed_grat",
    [G.AP.id_offset + 51] = "j_hack",
    [G.AP.id_offset + 52] = "j_pareidolia",
    [G.AP.id_offset + 53] = "j_gros_michel",
    [G.AP.id_offset + 54] = "j_even_steven",
    [G.AP.id_offset + 55] = "j_odd_todd",
    [G.AP.id_offset + 56] = "j_scholar",
    [G.AP.id_offset + 57] = "j_business",
    [G.AP.id_offset + 58] = "j_supernova",
    [G.AP.id_offset + 59] = "j_ride_the_bus",
    [G.AP.id_offset + 60] = "j_space",
    [G.AP.id_offset + 61] = 'j_egg',
    [G.AP.id_offset + 62] = 'j_burglar',
    [G.AP.id_offset + 63] = 'j_blackboard',
    [G.AP.id_offset + 64] = 'j_runner',
    [G.AP.id_offset + 65] = 'j_ice_cream',
    [G.AP.id_offset + 66] = 'j_dna',
    [G.AP.id_offset + 67] = 'j_splash',
    [G.AP.id_offset + 68] = 'j_blue_joker',
    [G.AP.id_offset + 69] = 'j_sixth_sense',
    [G.AP.id_offset + 70] = 'j_constellation',
    [G.AP.id_offset + 71] = 'j_hiker',
    [G.AP.id_offset + 72] = 'j_faceless',
    [G.AP.id_offset + 73] = 'j_green_joker',
    [G.AP.id_offset + 74] = 'j_superposition',
    [G.AP.id_offset + 75] = 'j_todo_list',
    [G.AP.id_offset + 76] = "j_cavendish",
    [G.AP.id_offset + 77] = "j_card_sharp",
    [G.AP.id_offset + 78] = "j_red_card",
    [G.AP.id_offset + 79] = "j_madness",
    [G.AP.id_offset + 80] = "j_square",
    [G.AP.id_offset + 81] = "j_seance",
    [G.AP.id_offset + 82] = "j_riff_raff",
    [G.AP.id_offset + 83] = "j_vampire",
    [G.AP.id_offset + 84] = "j_shortcut",
    [G.AP.id_offset + 85] = "j_hologram",
    [G.AP.id_offset + 86] = "j_vagabond",
    [G.AP.id_offset + 87] = "j_baron",
    [G.AP.id_offset + 88] = "j_cloud_9",
    [G.AP.id_offset + 89] = "j_rocket",
    [G.AP.id_offset + 90] = "j_obelisk",
    [G.AP.id_offset + 91] = "j_midas_mask",
    [G.AP.id_offset + 92] = "j_luchador",
    [G.AP.id_offset + 93] = "j_photograph",
    [G.AP.id_offset + 94] = "j_gift",
    [G.AP.id_offset + 95] = "j_turtle_bean",
    [G.AP.id_offset + 96] = "j_erosion",
    [G.AP.id_offset + 97] = "j_reserved_parking",
    [G.AP.id_offset + 98] = "j_mail",
    [G.AP.id_offset + 99] = "j_to_the_moon",
    [G.AP.id_offset + 100] = "j_hallucination",
    [G.AP.id_offset + 101] = "j_fortune_teller",
    [G.AP.id_offset + 102] = "j_juggler",
    [G.AP.id_offset + 103] = "j_drunkard",
    [G.AP.id_offset + 104] = "j_stone",
    [G.AP.id_offset + 105] = "j_golden",
    [G.AP.id_offset + 106] = "j_lucky_cat",
    [G.AP.id_offset + 107] = "j_baseball",
    [G.AP.id_offset + 108] = "j_bull",
    [G.AP.id_offset + 109] = "j_diet_cola",
    [G.AP.id_offset + 110] = "j_trading",
    [G.AP.id_offset + 111] = "j_flash",
    [G.AP.id_offset + 112] = "j_popcorn",
    [G.AP.id_offset + 113] = "j_trousers",
    [G.AP.id_offset + 114] = "j_ancient",
    [G.AP.id_offset + 115] = "j_ramen",
    [G.AP.id_offset + 116] = "j_walkie_talkie",
    [G.AP.id_offset + 117] = "j_selzer",
    [G.AP.id_offset + 118] = "j_castle",
    [G.AP.id_offset + 119] = "j_smiley",
    [G.AP.id_offset + 120] = "j_campfire",
    [G.AP.id_offset + 121] = "j_ticket",
    [G.AP.id_offset + 122] = "j_mr_bones",
    [G.AP.id_offset + 123] = "j_acrobat",
    [G.AP.id_offset + 124] = "j_sock_and_buskin",
    [G.AP.id_offset + 125] = "j_swashbuckler",
    [G.AP.id_offset + 126] = "j_troubadour",
    [G.AP.id_offset + 127] = "j_certificate",
    [G.AP.id_offset + 128] = "j_smeared",
    [G.AP.id_offset + 129] = "j_throwback",
    [G.AP.id_offset + 130] = "j_hanging_chad",
    [G.AP.id_offset + 131] = "j_rough_gem",
    [G.AP.id_offset + 132] = "j_bloodstone",
    [G.AP.id_offset + 133] = "j_arrowhead",
    [G.AP.id_offset + 134] = "j_onyx_agate",
    [G.AP.id_offset + 135] = "j_glass",
    [G.AP.id_offset + 136] = "j_ring_master",
    [G.AP.id_offset + 137] = "j_flower_pot",
    [G.AP.id_offset + 138] = "j_blueprint",
    [G.AP.id_offset + 139] = "j_wee",
    [G.AP.id_offset + 140] = "j_merry_andy",
    [G.AP.id_offset + 141] = "j_oops",
    [G.AP.id_offset + 142] = "j_idol",
    [G.AP.id_offset + 143] = "j_seeing_double",
    [G.AP.id_offset + 144] = "j_matador",
    [G.AP.id_offset + 145] = "j_hit_the_road",
    [G.AP.id_offset + 146] = "j_duo",
    [G.AP.id_offset + 147] = "j_trio",
    [G.AP.id_offset + 148] = "j_family",
    [G.AP.id_offset + 149] = "j_order",
    [G.AP.id_offset + 150] = "j_tribe",
    [G.AP.id_offset + 151] = "j_stuntman",
    [G.AP.id_offset + 152] = "j_invisible",
    [G.AP.id_offset + 153] = "j_brainstorm",
    [G.AP.id_offset + 154] = "j_satellite",
    [G.AP.id_offset + 155] = "j_shoot_the_moon",
    [G.AP.id_offset + 156] = "j_drivers_license",
    [G.AP.id_offset + 157] = "j_cartomancer",
    [G.AP.id_offset + 158] = "j_astronomer",
    [G.AP.id_offset + 159] = "j_burnt",
    [G.AP.id_offset + 160] = "j_bootstraps",
    [G.AP.id_offset + 161] = "j_caino",
    [G.AP.id_offset + 162] = "j_triboulet",
    [G.AP.id_offset + 163] = "j_yorick",
    [G.AP.id_offset + 164] = "j_chicot",
    [G.AP.id_offset + 165] = "j_perkeo",

    -- Vouchers
    [G.AP.id_offset + 166] = "v_overstock_norm",
    [G.AP.id_offset + 167] = "v_clearance_sale",
    [G.AP.id_offset + 168] = "v_hone",
    [G.AP.id_offset + 169] = "v_reroll_surplus",
    [G.AP.id_offset + 170] = "v_crystal_ball",
    [G.AP.id_offset + 171] = "v_telescope",
    [G.AP.id_offset + 172] = "v_grabber",
    [G.AP.id_offset + 173] = "v_wasteful",
    [G.AP.id_offset + 174] = "v_tarot_merchant",
    [G.AP.id_offset + 175] = "v_planet_merchant",
    [G.AP.id_offset + 176] = "v_seed_money",
    [G.AP.id_offset + 177] = "v_blank",
    [G.AP.id_offset + 178] = "v_magic_trick",
    [G.AP.id_offset + 179] = "v_hieroglyph",
    [G.AP.id_offset + 180] = "v_directors_cut",
    [G.AP.id_offset + 181] = "v_paint_brush",
    [G.AP.id_offset + 182] = "v_overstock_plus",
    [G.AP.id_offset + 183] = "v_liquidation",
    [G.AP.id_offset + 184] = "v_glow_up",
    [G.AP.id_offset + 185] = "v_reroll_glut",
    [G.AP.id_offset + 186] = "v_omen_globe",
    [G.AP.id_offset + 187] = "v_observatory",
    [G.AP.id_offset + 188] = "v_nacho_tong",
    [G.AP.id_offset + 189] = "v_recyclomancy",
    [G.AP.id_offset + 190] = "v_tarot_tycoon",
    [G.AP.id_offset + 191] = "v_planet_tycoon",
    [G.AP.id_offset + 192] = "v_money_tree",
    [G.AP.id_offset + 193] = "v_antimatter",
    [G.AP.id_offset + 194] = "v_illusion",
    [G.AP.id_offset + 195] = "v_petroglyph",
    [G.AP.id_offset + 196] = "v_retcon",
    [G.AP.id_offset + 197] = "v_palette",

    -- Packs 

    [G.AP.id_offset + 198] = "p_arcana_normal",
    [G.AP.id_offset + 199] = "p_arcana_jumbo",
    [G.AP.id_offset + 200] = "p_arcana_mega",
    [G.AP.id_offset + 201] = "p_celestial_normal",
    [G.AP.id_offset + 202] = "p_celestial_jumbo",
    [G.AP.id_offset + 203] = "p_celestial_mega",
    [G.AP.id_offset + 204] = "p_spectral_normal",
    [G.AP.id_offset + 205] = "p_spectral_jumbo",
    [G.AP.id_offset + 206] = "p_spectral_mega",
    [G.AP.id_offset + 207] = "p_standard_normal",
    [G.AP.id_offset + 208] = "p_standard_jumbo",
    [G.AP.id_offset + 209] = "p_standard_mega",
    [G.AP.id_offset + 210] = "p_buffoon_normal",
    [G.AP.id_offset + 211] = "p_buffoon_jumbo",
    [G.AP.id_offset + 212] = "p_buffoon_mega",

    -- Tarot Cards 

    [G.AP.id_offset + 213] = "c_fool",
    [G.AP.id_offset + 214] = "c_magician",
    [G.AP.id_offset + 215] = "c_high_priestess",
    [G.AP.id_offset + 216] = "c_empress",
    [G.AP.id_offset + 217] = "c_emperor",
    [G.AP.id_offset + 218] = "c_heirophant",
    [G.AP.id_offset + 219] = "c_lovers",
    [G.AP.id_offset + 220] = "c_chariot",
    [G.AP.id_offset + 221] = "c_justice",
    [G.AP.id_offset + 222] = "c_hermit",
    [G.AP.id_offset + 223] = "c_wheel_of_fortune",
    [G.AP.id_offset + 224] = "c_strength",
    [G.AP.id_offset + 225] = "c_hanged_man",
    [G.AP.id_offset + 226] = "c_death",
    [G.AP.id_offset + 227] = "c_temperance",
    [G.AP.id_offset + 228] = "c_devil",
    [G.AP.id_offset + 229] = "c_tower",
    [G.AP.id_offset + 230] = "c_star",
    [G.AP.id_offset + 231] = "c_moon",
    [G.AP.id_offset + 232] = "c_sun",
    [G.AP.id_offset + 233] = "c_judgement",
    [G.AP.id_offset + 234] = "c_world",
    [G.AP.id_offset + 235] = "c_rand_ap_tarot",

    -- Planet Cards

    [G.AP.id_offset + 236] = "c_mercury",
    [G.AP.id_offset + 237] = "c_venus",
    [G.AP.id_offset + 238] = "c_earth",
    [G.AP.id_offset + 239] = "c_mars",
    [G.AP.id_offset + 240] = "c_jupiter",
    [G.AP.id_offset + 241] = "c_saturn",
    [G.AP.id_offset + 242] = "c_uranus",
    [G.AP.id_offset + 243] = "c_neptune",
    [G.AP.id_offset + 244] = "c_pluto",
    [G.AP.id_offset + 245] = "c_planet_x",
    [G.AP.id_offset + 246] = "c_ceres",
    [G.AP.id_offset + 247] = "c_eris",
    [G.AP.id_offset + 248] = "c_rand_ap_planet",

    -- Spectral Cards

    [G.AP.id_offset + 249] = "c_familiar",
    [G.AP.id_offset + 250] = "c_grim",
    [G.AP.id_offset + 251] = "c_incantation",
    [G.AP.id_offset + 252] = "c_talisman",
    [G.AP.id_offset + 253] = "c_aura",
    [G.AP.id_offset + 254] = "c_wraith",
    [G.AP.id_offset + 255] = "c_sigil",
    [G.AP.id_offset + 256] = "c_ouija",
    [G.AP.id_offset + 257] = "c_ectoplasm",
    [G.AP.id_offset + 258] = "c_immolate",
    [G.AP.id_offset + 259] = "c_ankh",
    [G.AP.id_offset + 260] = "c_deja_vu",
    [G.AP.id_offset + 261] = "c_hex",
    [G.AP.id_offset + 262] = "c_trance",
    [G.AP.id_offset + 263] = "c_medium",
    [G.AP.id_offset + 264] = "c_cryptid",
    [G.AP.id_offset + 265] = "c_soul",
    [G.AP.id_offset + 266] = "c_black_hole",
    [G.AP.id_offset + 267] = "c_rand_ap_spectral",

    -- OP Bonus Items
    [G.AP.id_offset + 301] = "op_discard",
    [G.AP.id_offset + 302] = "op_money",
    [G.AP.id_offset + 303] = "op_hand",
    [G.AP.id_offset + 304] = "op_hand_size",
    [G.AP.id_offset + 305] = "op_interest",
	[G.AP.id_offset + 306] = "op_joker_slot",
	[G.AP.id_offset + 307] = "op_consum_slot",
	
	-- Filler Bonus Items
	[G.AP.id_offset + 310] = "fill_money",
	[G.AP.id_offset + 311] = "fill_buffoon",
	[G.AP.id_offset + 312] = "fill_tag_charm", -- technically has 3 keys, but they all have the same name so its irrelevant here
	[G.AP.id_offset + 313] = "fill_juggle",
	[G.AP.id_offset + 314] = "fill_d_six",
	[G.AP.id_offset + 315] = "fill_uncommon",
	[G.AP.id_offset + 316] = "fill_rare",
	[G.AP.id_offset + 317] = "fill_negative",
	[G.AP.id_offset + 318] = "fill_foil",
	[G.AP.id_offset + 319] = "fill_holo",
	[G.AP.id_offset + 320] = "fill_poly",
	[G.AP.id_offset + 321] = "fill_double",
	
    -- Trap Items
    [G.AP.id_offset + 330] = "t_money",
    [G.AP.id_offset + 331] = "t_discard",
    [G.AP.id_offset + 332] = "t_hand",
	[G.AP.id_offset + 333] = "t_perishable",
    [G.AP.id_offset + 334] = "t_eternal",
    [G.AP.id_offset + 335] = "t_rental",
	
	-- Stakes
	[G.AP.id_offset + 390] = "stake_white",
	[G.AP.id_offset + 391] = "stake_red",
	[G.AP.id_offset + 392] = "stake_green",
	[G.AP.id_offset + 393] = "stake_black",
	[G.AP.id_offset + 394] = "stake_blue",
	[G.AP.id_offset + 395] = "stake_purple",
	[G.AP.id_offset + 396] = "stake_orange",
	[G.AP.id_offset + 397] = "stake_gold",
	
	-- bundles
	[G.AP.id_offset + 371] = "bundle_tarot",
	[G.AP.id_offset + 372] = "bundle_planet",
	[G.AP.id_offset + 373] = "bundle_spectral",
	
	[G.AP.id_offset + 374] = "bundle_tarot",
	[G.AP.id_offset + 375] = "bundle_tarot",
	[G.AP.id_offset + 376] = "bundle_tarot",
	[G.AP.id_offset + 377] = "bundle_tarot",
	[G.AP.id_offset + 378] = "bundle_tarot",
	
	[G.AP.id_offset + 379] = "bundle_planet",
	[G.AP.id_offset + 380] = "bundle_planet",
	[G.AP.id_offset + 381] = "bundle_planet",
	[G.AP.id_offset + 382] = "bundle_planet",
	[G.AP.id_offset + 383] = "bundle_planet",
	
	[G.AP.id_offset + 384] = "bundle_spectral",
	[G.AP.id_offset + 385] = "bundle_spectral",
	[G.AP.id_offset + 386] = "bundle_spectral",
	[G.AP.id_offset + 387] = "bundle_spectral",
	[G.AP.id_offset + 388] = "bundle_spectral",
}

-- joker bundle
for bundle = 521, 550 do
	G.APItems[G.AP.id_offset + bundle] = 'bundle_joker'
end

G.APSave = {
    ShopLocations = 0
}

-- vanilla item whitelist
function IsVanillaItem(key)
    if key == nil then
        return nil
    end
    -- Jokers
    if string.find(key, '^j_') then
        local j_whitelist = { -- organized in collection order
        -- page 1
        'j_joker', 'j_greedy_joker', 'j_lusty_joker', 'j_wrathful_joker', 'j_gluttenous_joker', 'j_jolly', 'j_zany',
        'j_mad', 'j_crazy', 'j_droll', 'j_sly', 'j_wily', 'j_clever', 'j_devious', 'j_crafty', -- page 2
        'j_half', 'j_stencil', 'j_four_fingers', 'j_mime', 'j_credit_card', 'j_ceremonial', 'j_banner',
        'j_mystic_summit', 'j_marble', 'j_loyalty_card', 'j_8_ball', 'j_misprint', 'j_dusk', 'j_raised_fist', 'j_chaos',

        -- page 3
        'j_fibonacci', 'j_steel_joker', 'j_scary_face', 'j_abstract', 'j_delayed_grat', 'j_hack', 'j_pareidolia',
        'j_gros_michel', 'j_even_steven', 'j_odd_todd', 'j_scholar', 'j_business', 'j_supernova', 'j_ride_the_bus',
        'j_space', -- page 4
        'j_egg', 'j_burglar', 'j_blackboard', 'j_runner', 'j_ice_cream', 'j_dna', 'j_splash', 'j_blue_joker',
        'j_sixth_sense', 'j_constellation', 'j_hiker', 'j_faceless', 'j_green_joker', 'j_superposition', 'j_todo_list',

        -- page 5
        'j_cavendish', 'j_card_sharp', 'j_red_card', 'j_madness', 'j_square', 'j_seance', 'j_riff_raff', 'j_vampire',
        'j_shortcut', 'j_hologram', 'j_vagabond', 'j_baron', 'j_cloud_9', 'j_rocket', 'j_obelisk', -- page 6
        'j_midas_mask', 'j_luchador', 'j_photograph', 'j_gift', 'j_turtle_bean', 'j_erosion', 'j_reserved_parking',
        'j_mail', 'j_to_the_moon', 'j_hallucination', 'j_fortune_teller', 'j_juggler', 'j_drunkard', 'j_stone',
        'j_golden', -- page 7
        'j_lucky_cat', 'j_baseball', 'j_bull', 'j_diet_cola', 'j_trading', 'j_flash', 'j_popcorn', 'j_trousers',
        'j_ancient', 'j_ramen', 'j_walkie_talkie', 'j_selzer', 'j_castle', 'j_smiley', 'j_campfire', -- page 8
        'j_ticket', 'j_mr_bones', 'j_acrobat', 'j_sock_and_buskin', 'j_swashbuckler', 'j_troubadour', 'j_certificate',
        'j_smeared', 'j_throwback', 'j_hanging_chad', 'j_rough_gem', 'j_bloodstone', 'j_arrowhead', 'j_onyx_agate',
        'j_glass', -- page 9
        'j_ring_master', 'j_flower_pot', 'j_blueprint', 'j_wee', 'j_merry_andy', 'j_oops', 'j_idol', 'j_seeing_double',
        'j_matador', 'j_hit_the_road', 'j_duo', 'j_trio', 'j_family', 'j_order', 'j_tribe', -- page 10
        'j_stuntman', 'j_invisible', 'j_brainstorm', 'j_satellite', 'j_shoot_the_moon', 'j_drivers_license',
        'j_cartomancer', 'j_astronomer', 'j_burnt', 'j_bootstraps', 'j_caino', 'j_triboulet', 'j_yorick', 'j_chicot',
        'j_perkeo', 'j_rand_fallback'}

        if tableContains(j_whitelist, key) then
            return true
        else
            return nil
        end
    end

    -- Consumables
    if string.find(key, '^c_') then
        local c_whitelist = { -- Tarots
        'c_fool', 'c_magician', 'c_high_priestess', 'c_empress', 'c_emperor', 'c_heirophant', 'c_lovers', 'c_chariot',
        'c_justice', 'c_hermit', 'c_wheel_of_fortune', 'c_strength', 'c_hanged_man', 'c_death', 'c_temperance',
        'c_devil', 'c_tower', 'c_star', 'c_moon', 'c_sun', 'c_judgement', 'c_world', -- Planets
        'c_mercury', 'c_venus', 'c_earth', 'c_mars', 'c_jupiter', 'c_saturn', 'c_uranus', 'c_neptune', 'c_pluto',
        'c_planet_x', 'c_ceres', 'c_eris', -- Spectrals
        'c_familiar', 'c_grim', 'c_incantation', 'c_talisman', 'c_aura', 'c_wraith', 'c_sigil', 'c_ouija',
        'c_ectoplasm', 'c_immolate', 'c_ankh', 'c_deja_vu', 'c_hex', 'c_trance', 'c_medium', 'c_cryptid', 'c_soul',
        'c_black_hole', 'c_base', -- not vanilla but we need these to pass the vanilla check
        'c_rand_ap_tarot', 'c_rand_ap_planet', 'c_rand_ap_spectral'}

        if tableContains(c_whitelist, key) then
            return true
        else
            return nil
        end
    end

    -- Vouchers
    if string.find(key, '^v_') then
        local v_whitelist = {'v_overstock_norm', 'v_clearance_sale', 'v_hone', 'v_reroll_surplus', 'v_crystal_ball',
                             'v_telescope', 'v_grabber', 'v_wasteful', 'v_tarot_merchant', 'v_planet_merchant',
                             'v_seed_money', 'v_blank', 'v_magic_trick', 'v_hieroglyph', 'v_directors_cut',
                             'v_paint_brush', 'v_overstock_plus', 'v_liquidation', 'v_glow_up', 'v_reroll_glut',
                             'v_omen_globe', 'v_observatory', 'v_nacho_tong', 'v_recyclomancy', 'v_tarot_tycoon',
                             'v_planet_tycoon', 'v_money_tree', 'v_antimatter', 'v_illusion', 'v_petroglyph',
                             'v_retcon', 'v_palette', 'v_rand_ap_item'}

        if tableContains(v_whitelist, key) then
            return true
        else
            return nil
        end
    end

    -- Backs/Decks
    if string.find(key, '^b_') then
        local b_whitelist = {'b_red', 'b_blue', 'b_yellow', 'b_green', 'b_black', 'b_magic', 'b_nebula', 'b_ghost',
                             'b_abandoned', 'b_checkered', 'b_zodiac', 'b_painted', 'b_anaglyph', 'b_plasma',
                             'b_erratic', 'b_challenge'}

        if tableContains(b_whitelist, key) then
            return true
        else
            return nil
        end
    end

    -- Booster Packs
    if string.find(key, '^p_') then
        local p_whitelist = { -- Arcana
        'p_arcana_normal_1', 'p_arcana_normal_2', 'p_arcana_normal_3', 'p_arcana_normal_4', 'p_arcana_jumbo_1',
        'p_arcana_jumbo_2', 'p_arcana_mega_1', 'p_arcana_mega_2', -- Celestial
        'p_celestial_normal_1', 'p_celestial_normal_2', 'p_celestial_normal_3', 'p_celestial_normal_4',
        'p_celestial_jumbo_1', 'p_celestial_jumbo_2', 'p_celestial_mega_1', 'p_celestial_mega_2', -- Spectral
        'p_spectral_normal_1', 'p_spectral_normal_2', 'p_spectral_jumbo_1', 'p_spectral_mega_1', -- Standard
        'p_standard_normal_1', 'p_standard_normal_2', 'p_standard_normal_3', 'p_standard_normal_4',
        'p_standard_jumbo_1', 'p_standard_jumbo_2', 'p_standard_mega_1', 'p_standard_mega_2', -- Buffoon
        'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1'}

        if tableContains(p_whitelist, key) then
            return true
        else
            return nil
        end
    end

    -- Challenges
    local chal_whitelist = {'omelette_1', 'city_1', 'rich_1', 'knife_1', 'xray_1', 'mad_world_1', 'luxury_1',
                            'non_perishable_1', 'medusa_1', 'double_nothing_1', 'typecast_1', 'inflation_1',
                            'bram_poker_1', 'fragile_1', 'monolith_1', 'blast_off_1', 'five_card_1', 'golden_needle_1',
                            'cruelty_1', 'jokerless_1'}

    if tableContains(chal_whitelist, key) then
        return true
    end

    local misc_whitelist = {'m_steel', 'm_wild', 'm_glass', 'm_stone', 'm_mult', 'm_bonus', 'm_gold', 'm_lucky',

                            'e_base', 'e_foil', 'e_polychrome', 'e_holo', 'e_negative', 'undiscovered_joker',
                            'undiscovered_tarot', 'soul'}

    if tableContains(misc_whitelist, key) then
        return true
    end

    -- Stakes are hardcoded to always chain into the vanilla 8
    -- so they dont need this check

    return nil
end

function APConnect()
    server = G.AP.APAddress .. ":" .. G.AP.APPort
    slot = G.AP.APSlot
    password = G.AP.APPassword

    G.AP.JokerQueue = {}
    G.AP.BackQueue = {}
    G.AP.VoucherQueue = {}
    G.AP.BonusQueue = {}
    G.AP.PackQueue = {}
    G.AP.ConsumableQueue = {}
    G.AP.StakeQueue = {}

    function on_socket_connected()
        print("Socket connected")
    end

    local connection_attempts = 0
    function on_socket_error(msg)
        print("Socket error: " .. msg)
        connection_attempts = connection_attempts + 1
        if connection_attempts >= 3 then
			if not isAPProfileLoaded() then
				G.FUNCS.APDisconnect()
				unloadAPProfile = false
			else
				G.APClient = nil
			end
        end
    end

    function on_socket_disconnected()
        print("Socket disconnected")
    end

    function on_room_info()
        print("Room info")
        G.APClient:ConnectSlot(slot, password, 7, {"Lua-APClientPP"}, {0, 5, 0})
    end

    function on_slot_connected(slot_data)
        print("Slot connected")
        sendDebugMessage("slot_data: " .. tostring(slot_data))

        G.AP.slot_data = slot_data
        G.AP.goal = slot_data.goal
        G.AP.team_id = G.APClient:get_team_number()
        G.AP.player_id = G.APClient:get_player_number()

        -- G.APClient:Set("empty_array", nil, true, {{"replace", AP.EMPTY_ARRAY}})

        local tags = {"Lua-APClientPP"}
        if (IsDeathlinkOn()) then
            tags[#tags + 1] = "DeathLink"
        end

        G.APClient:ConnectUpdate(nil, tags)
		
		-- just to make sure it's actually loading the right profile
		G.SETTINGS.profile = G.AP.profile_Id
		
		-- wrong seed will wipe the AP profile (all needed data is serverside)
		G.FUNCS.load_profile(false)
		G.FUNCS.set_up_APProfile()
    end

    function on_slot_refused(reasons)
        print("Slot refused: " .. table.concat(reasons, ", "))
    end

    function on_items_received(items)
        print("Items received:")
        for _, item in ipairs(items) do
			local notify = #items == 1 
            local item_id = item.item - G.AP.id_offset
            local item_key = G.APItems[item.item]
			
            -- if item was already received, ignore it 
            if G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                item_id = 0
            end

            function unlock(item_key)
				
				local unlock_targets = {}
				
				if string.find(item_key, '^p_') then
					for __, v in pairs(G.P_CENTER_POOLS.Booster) do
						if string.find(v.key, item_key) then
							unlock_targets[#unlock_targets+1] = v
						end
					end
				elseif G.P_CENTERS[item_key] then
					unlock_targets[#unlock_targets+1] = G.P_CENTERS[item_key]
				end
				
				for i, item in pairs(unlock_targets) do
					
					-- progressive vouchers
					if item.requires then
						if (not G.P_CENTERS[item.requires[1]].unlocked) then
							G.P_CENTERS[item.requires[1]].nextVoucher = item
							item = G.P_CENTERS[item.requires[1]]
						end

					elseif item.nextVoucher then
						item = item.nextVoucher
					end
					
					item.unlocked = true
					item.discovered = true
					item.hidden = false
					item.wip = nil
					item.ap_unlocked = true
					
					G.E_MANAGER:add_event(Event({
					func = function()
						G.AP.check_cardarea_debuff(item.key)
						return true
					end}))
					
					-- spectral gimmick
					if G.AP.Spectral.active == true and not G.AP.Spectral.item then
						G.AP.Spectral.item = {
							type = 'center',
							center = item
						}
					end

					G.FUNCS.AP_unlock_item(item, notify)
				end
			end

            sendDebugMessage("received Item id " .. tostring(item_id))
            sendDebugMessage("received Item key " .. tostring(item_key))

            -- failsave, because if item_key is unknown or was already received, item_id will be 0
            if item_id ~= 0 then
                -- unlock decks by adding their name to the list of backs (this backs list is only there in AP to keep track of unlocks):
                -- same with jokers/vouchers
                if item_id <= 15 then
                    sendDebugMessage("received Deck")

                    -- different handling if item was received on startup (queue it)
                    -- or if it's during gameplay (display immediately)
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["backs"][item_key] = true
                        unlock(item_key)
                    else
                        G.AP.BackQueue[item_key] = item.index
                    end

                elseif item_id >= 16 and item_id <= 165 then
                    sendDebugMessage("received Joker")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["jokers"][item_key] = true
                        unlock(item_key)
                    else
                        G.AP.JokerQueue[item_key] = item.index
                    end
                    -- Vouchers
                elseif item_id >= 166 and item_id <= 197 then
                    sendDebugMessage("received Voucher")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["vouchers"][item_key] = true
                        unlock(item_key)
                    else
                        G.AP.VoucherQueue[item_key] = item.index
                    end
                    -- Packs
                elseif item_id >= 198 and item_id <= 212 then
                    sendDebugMessage("received Pack")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["packs"][item_key] = true
                        unlock(item_key)
                    else
                        G.AP.PackQueue[item_key] = item.index
                    end
                    -- Consumables
                elseif item_id >= 213 and item_id <= 267 then
                    sendDebugMessage("received Consumable")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["consumables"][item_key] = true
                        unlock(item_key)
                    else
                        G.AP.ConsumableQueue[item_key] = item.index
                    end

                    -- Bonus Items
                elseif item_id >= 300 and item_id < 330 then
                    if item_id == 301 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonusdiscards"] =
                                (G.PROFILES[G.AP.profile_Id]["bonusdiscards"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                                ease_discard(1)
                            end

                            if notify then notify_alert('op_discard', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonusdiscards",
                                idx = item.index
                            }
                        end
                    elseif item_id == 302 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] =
                                (G.PROFILES[G.AP.profile_Id]["bonusstartingmoney"] or 0) + 1

                            if G.STAGE == G.STAGES.RUN then
                                ease_dollars(1, true)
                            end

                            if notify then notify_alert('op_money', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonusstartingmoney",
                                idx = item.index
                            }
                        end
                    elseif item_id == 303 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonushands"] =
                                (G.PROFILES[G.AP.profile_Id]["bonushands"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                
                                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                                ease_hands_played(1)
                            end

                            if notify then notify_alert('op_hand', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonushands",
                                idx = item.index
                            }
                        end
                    elseif item_id == 304 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonushandsize"] =
                                (G.PROFILES[G.AP.profile_Id]["bonushandsize"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                G.hand:change_size(1)
                            end

                            if notify then notify_alert('op_hand_size', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonushandsize",
                                idx = item.index
                            }
                        end
                    elseif item_id == 305 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["maxinterest"] =
                                (G.PROFILES[G.AP.profile_Id]["maxinterest"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.interest_cap = G.GAME.interest_cap + 5
                                        return true
                                    end
                                }))
                            end

                            if notify then notify_alert('op_interest', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "maxinterest",
                                idx = item.index
                            }
                        end
                    elseif item_id == 306 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonusjoker"] =
                                (G.PROFILES[G.AP.profile_Id]["bonusjoker"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        if G.jokers then
                                            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                                        end
                                        return true
                                    end
                                }))
                            end

                            if notify then notify_alert('op_joker_slot', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonusjoker",
                                idx = item.index
                            }
                        end
                    elseif item_id == 307 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonusconsumable"] =
                                (G.PROFILES[G.AP.profile_Id]["bonusconsumable"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                                        return true
                                    end
                                }))
                            end

                            if notify then notify_alert('op_consum_slot', "Bonus") end
                        else
                            G.AP.BonusQueue[#G.AP.BonusQueue + 1] = {
                                type = "bonusconsumable",
                                idx = item.index
                            }
                        end
                    elseif item_id == 310 then
                        -- bonus money (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            local amount = math.random(3, 8)
                            ease_dollars(amount)

                            if notify then notify_alert('fill_money', "Bonus") end
                        end
                    elseif item_id == 311 then
                        -- receive random Joker (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_buffoon'))
                                    return true
                                end)
                            }))

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_buffoon')
                                }
                            end

                           if notify then notify_alert('fill_buffoon', "Bonus") end
                        end
                    elseif item_id == 312 then
                        -- receive random consumable (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true

                            local choices = {'tag_charm', 'tag_meteor', 'tag_ethereal'}

                            local choice = choices[math.random(#choices)]

                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag(choice))
                                    return true
                                end)
                            }))
                            notify_alert('fill_' .. choice, "Bonus")

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag(choice)
                                }
                            end
                        end
                    elseif item_id == 313 then
                        -- plus 3 hand size next round (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_juggle'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_juggle', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_juggle')
                                }
                            end
                        end
                    elseif item_id == 314 then
                        -- rerolls start at $0 next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_d_six'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_d_six', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_d_six')
                                }
                            end
                        end
                    elseif item_id == 315 then
                        -- Free uncommon joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_uncommon'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_uncommon', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_uncommon')
                                }
                            end
                        end
                    elseif item_id == 316 then
                        -- Free rare joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_rare'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_rare', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_rare')
                                }
                            end
                        end
                    elseif item_id == 317 then
                        -- Free negative joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_negative'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_negative', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_negative')
                                }
                            end
                        end
                    elseif item_id == 318 then
                        -- Free foil joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_foil'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_foil', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_foil')
                                }
                            end
                        end
                    elseif item_id == 319 then
                        -- Free holographic joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_holo'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_holo', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_holo')
                                }
                            end
                        end
                    elseif item_id == 320 then
                        -- Free polychrome joker next shop (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_polychrome'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_poly', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_polychrome')
                                }
                            end
                        end
                    elseif item_id == 321 then
                        -- Receive double tag (must be during a game)
                        if G.AP.GameObjectInit and G.STAGE == G.STAGES.RUN and
                            not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_double'))
                                    return true
                                end)
                            }))
                            if notify then notify_alert('fill_double', "Bonus") end

                            -- spectral gimmick
                            if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                                G.AP.Spectral.item = {
                                    type = 'tag',
                                    center = Tag('tag_double')
                                }
                            end
                        end
                    end

                    -- traps (only trigger while in run)
                elseif item_id >= 330 and item_id < 340 and G.STAGE and G.STAGE == G.STAGES.RUN then
                    if (item_id == 330) then
                        -- Lose All Money
                        ease_dollars(-G.GAME.dollars, true)
                        if notify then notify_alert("t_money", "Trap") end

                    elseif (item_id == 331) then
                        -- Lose 1 Discard
                        ease_discard(-1)
                        if notify then notify_alert("t_discard", "Trap") end
                    elseif item_id == 332 then
                        -- Lose 1 Hand
                        ease_hands_played(-1)
                        if notify then notify_alert("t_hand", "Trap") end
                    elseif item_id == 333 then
                        -- make joker perishable
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_perishable(true)
                            if notify then notify_alert("t_perishable", "Trap") end
                        end
                    elseif item_id == 334 then
                        -- make joker eternal
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_eternal(true)
                            if notify then notify_alert("t_eternal", "Trap") end
                        end
                    elseif item_id == 335 then
                        -- make joker rental
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_rental(true)
                            if notify then notify_alert("t_rental", "Trap") end
                        end
                    end

                    -- joker bundles
                elseif item_id >= 521 and item_id <= 540 then
                    sendDebugMessage("received Joker Bundle")
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        if G.AP.slot_data["jokerbundles"][item_id - 520] then
                            
                            local items_to_unlock = {}
                            for k, v in ipairs(G.AP.slot_data["jokerbundles"][item_id - 520]) do
                                items_to_unlock[#items_to_unlock + 1] = {
                                    index = "joker" .. tostring(item_id - 520) .. tostring(#items_to_unlock + 1),
                                    item = v
                                }
                            end
                            on_items_received(items_to_unlock)
                        end

                    end
                    -- tarot
                elseif item_id == 371 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        local items_to_unlock = {}
                        for i = 213, 235, 1 do
                            items_to_unlock[#items_to_unlock + 1] = {
                                index = "tarot" .. tostring(i),
                                item = i + G.AP.id_offset
                            }
                        end

                        on_items_received(items_to_unlock)

                    end
                    -- spectral
                elseif item_id == 373 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        local items_to_unlock = {}
                        for i = 249, 267, 1 do
                            items_to_unlock[#items_to_unlock + 1] = {
                                index = "spectral" .. tostring(i),
                                item = i + G.AP.id_offset
                            }
                        end

                        on_items_received(items_to_unlock)
                    end
                    -- planet
                elseif item_id == 372 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        local items_to_unlock = {}
                        for i = 236, 248, 1 do
                            items_to_unlock[#items_to_unlock + 1] = {
                                index = "planet" .. tostring(i),
                                item = i + G.AP.id_offset
                            }
                        end
                        on_items_received(items_to_unlock)
                    end
                    -- custom consumable packs:
                    -- tarot
                elseif item_id >= 374 and item_id <= 378 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        if G.AP.slot_data["tarot_bundles"][item_id - 373] then
                            local items_to_unlock = {}
                            
                            for k, v in ipairs(G.AP.slot_data["tarot_bundles"][item_id - 373]) do
                                items_to_unlock[#items_to_unlock + 1] = {
                                    index = "tarot" .. tostring(item_id - 373) .. tostring(#items_to_unlock + 1),
                                    item = v
                                }
                            end
                            on_items_received(items_to_unlock)
                        end

                    end
                    -- planet
                elseif item_id >= 379 and item_id <= 383 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        if (G.AP.slot_data["planet_bundles"][item_id - 378]) then
                            local items_to_unlock = {}
                            
                            for k, v in ipairs(G.AP.slot_data["planet_bundles"][item_id - 378]) do
                                items_to_unlock[#items_to_unlock + 1] = {
                                    index = "planet" .. tostring(item_id - 378) .. tostring(#items_to_unlock + 1),
                                    item = v
                                }
                            end
                            on_items_received(items_to_unlock)
                        end

                    end
                    -- spectral
                elseif item_id >= 384 and item_id <= 388 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        if G.AP.slot_data["spectral_bundles"][item_id - 383] then
                            local items_to_unlock = {}
                            for k, v in ipairs(G.AP.slot_data["spectral_bundles"][item_id - 383]) do
                                
                                items_to_unlock[#items_to_unlock + 1] = {
                                    index = "spectral" .. tostring(item_id - 383) .. tostring(#items_to_unlock + 1),
                                    item = v
                                }
                            end
                            on_items_received(items_to_unlock)
                        end

                    end

                elseif item_id >= 390 and item_id <= 397 then
                    if item_id == 390 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('White Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'White Stake'
                            end

                        end
                    end
                    if item_id == 391 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Red Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Red Stake'
                            end

                        end
                    end
                    if item_id == 392 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Green Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Green Stake'
                            end

                        end
                    end
                    if item_id == 393 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Black Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Black Stake'
                            end

                        end
                    end
                    if item_id == 394 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Blue Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Blue Stake'
                            end

                        end
                    end
                    if item_id == 395 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Purple Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Purple Stake'
                            end

                        end
                    end
                    if item_id == 396 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Orange Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Orange Stake'
                            end

                        end
                    end
                    if item_id == 397 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Gold Stake', notify)
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Gold Stake'
                            end

                        end
                    end

                elseif item_id >= 400 then
                    local deck_name = ""
                    local stake_name = ""
                    if item_id <= 407 then
                        deck_name = "b_red"
                        on_items_received({{
                            index = "reddeck",
                            item = 1 + G.AP.id_offset
                        }})
                    elseif item_id <= 415 then
                        deck_name = "b_blue"
                        on_items_received({{
                            index = "bluedeck",
                            item = 2 + G.AP.id_offset
                        }})
                    elseif item_id <= 423 then
                        deck_name = "b_yellow"
                        on_items_received({{
                            index = "yellowdeck",
                            item = 3 + G.AP.id_offset
                        }})
                    elseif item_id <= 431 then
                        deck_name = "b_green"
                        on_items_received({{
                            index = "greendeck",
                            item = 4 + G.AP.id_offset
                        }})
                    elseif item_id <= 439 then
                        deck_name = "b_black"
                        on_items_received({{
                            index = "blackdeck",
                            item = 5 + G.AP.id_offset
                        }})
                    elseif item_id <= 447 then
                        deck_name = "b_magic"
                        on_items_received({{
                            index = "magicdeck",
                            item = 6 + G.AP.id_offset
                        }})
                    elseif item_id <= 455 then
                        deck_name = "b_nebula"
                        on_items_received({{
                            index = "nebuladeck",
                            item = 7 + G.AP.id_offset
                        }})
                    elseif item_id <= 463 then
                        deck_name = "b_ghost"
                        on_items_received({{
                            index = "ghostdeck",
                            item = 8 + G.AP.id_offset
                        }})
                    elseif item_id <= 471 then
                        deck_name = "b_abandoned"
                        on_items_received({{
                            index = "abandoneddeck",
                            item = 9 + G.AP.id_offset
                        }})
                    elseif item_id <= 479 then
                        deck_name = "b_checkered"
                        on_items_received({{
                            index = "checkdeck",
                            item = 10 + G.AP.id_offset
                        }})
                    elseif item_id <= 487 then
                        deck_name = "b_zodiac"
                        on_items_received({{
                            index = "zodiacdeck",
                            item = 11 + G.AP.id_offset
                        }})
                    elseif item_id <= 495 then
                        deck_name = "b_painted"
                        on_items_received({{
                            index = "painteddeck",
                            item = 12 + G.AP.id_offset
                        }})
                    elseif item_id <= 503 then
                        deck_name = "b_anaglyph"
                        on_items_received({{
                            index = "anaglyphdeck",
                            item = 13 + G.AP.id_offset
                        }})
                    elseif item_id <= 511 then
                        deck_name = "b_plasma"
                        on_items_received({{
                            index = "plasmadeck",
                            item = 14 + G.AP.id_offset
                        }})
                    elseif item_id <= 519 then
                        deck_name = "b_erratic"
                        on_items_received({{
                            index = "erraticdeck",
                            item = 15 + G.AP.id_offset
                        }})
                    end

                    if item_id % 8 == 0 then
                        stake_name = "stake_white"
                    elseif (item_id - 1) % 8 == 0 then
                        stake_name = "stake_red"
                    elseif (item_id - 2) % 8 == 0 then
                        stake_name = "stake_green"
                    elseif (item_id - 3) % 8 == 0 then
                        stake_name = "stake_black"
                    elseif (item_id - 4) % 8 == 0 then
                        stake_name = "stake_blue"
                    elseif (item_id - 5) % 8 == 0 then
                        stake_name = "stake_purple"
                    elseif (item_id - 6) % 8 == 0 then
                        stake_name = "stake_orange"
                    elseif (item_id - 7) % 8 == 0 then
                        stake_name = "stake_gold"
                    end

                    if (G.AP.StakesInit) then
                        G.FUNCS.AP_unlock_stake_per_deck(stake_name, deck_name, notify)
                    else
                        G.AP.StakeQueue[#G.AP.StakeQueue + 1] = {
                            stake = stake_name,
                            deck = deck_name
                        }
                    end
                end

                -- spectral gimmick
                if G.AP.Spectral.active == true and not G.AP.Spectral.item then
                    G.AP.Spectral.item = {
                        type = 'fail'
                    }
                end

            end
        end
		
    end

    local player_to_game = {}
    local player_to_alias = {}

    function on_location_info(items)
        for _, item in ipairs(items) do
            if not G.AP.location_id_to_item_name[item.location] then

                local player = item.player

                if not player_to_alias[player] then
                    player_to_alias[player] = G.APClient:get_player_alias(item.player)
                end

                if not player_to_game[player] then
                    player_to_game[player] = G.APClient:get_player_game(item.player)
                end

                local player_alias = player_to_alias[player]
                local game = player_to_game[player]
                G.AP.location_id_to_item_name[item.location] = {
                    item_name = G.APClient:get_item_name(item.item, game),
                    player_name = player_alias,
					game = game,
					item_id = item.item,
                }

            end
        end

    end

    function on_location_checked(locations)
        -- print("Locations checked:" .. table.concat(locations, ", "))
    end

    function on_data_package_changed(data_package)
    end

    function on_print(msg)
        print(msg)
    end

    function on_print_json(msg, extra)
        -- print(G.APClient:render_json(msg, AP.RenderFormat.TEXT))
        -- for key, value in pairs(extra) do
        --     sendDebugMessage("  " .. tostring(key) .. ": " .. tostring(value))
        -- end
    end

    function on_bounced(bounce)
        -- print("Bounced:")
        -- print(tostring(bounce))
        if bounce ~= nil and bounce.tags and tableContains(bounce.tags, "DeathLink") and bounce.data then
            if G.AP.LAST_DEATH_LINK_TIME ~= nil and tostring(G.AP.LAST_DEATH_LINK_TIME) == tostring(bounce.data.time) then
                -- our own package -> Do nothing
                sendDebugMessage("skipping this deathlink")
            else
                G.AP.death_link_cause = bounce.data.cause or "unknown"
                G.AP.death_link_source = bounce.data.source or "unknown"

                G.AP.game_over_by_deathlink = true

                -- lol
                if G.STAGES and G.FUNCS and G.FUNCS.die and G.STAGE == G.STAGES.RUN then
                    G.FUNCS.die()
                end
            end
        end
    end

    function on_retrieved(map, keys, extra)
        sendDebugMessage("Retrieved:")
        -- since lua tables won't contain nil values, we can use keys array
        for _, key in ipairs(keys) do
			
			if key == "balatro_deck_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id) and type(map[key]) == 'table' then 
				G.E_MANAGER:add_event(
					Event { blocking = false, blockable = false, force_pause = true,
						func = function()
							if isAPProfileLoaded() then
								G.PROFILES[G.AP.profile_Id].deck_usage = map[key]
					
								if G.AP.goal ~= 4 then
									G.PROFILES[G.AP.profile_Id].ap_progress = G.AP.check_progress()
								end
							end
							return true
						end
					})
			end
			
			if key == "balatro_joker_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id) and type(map[key]) == 'table' then 
				G.E_MANAGER:add_event(
					Event { blocking = false, blockable = false, force_pause = true,
						func = function()
							if isAPProfileLoaded() then
								G.PROFILES[G.AP.profile_Id].joker_usage = map[key]
								if G.AP.goal == 4 then
									G.PROFILES[G.AP.profile_Id].ap_progress = G.AP.check_progress()
								end
							end
							return true
						end
					})
			end 
			
			if isAPProfileLoaded() then
				if key == "balatro_current_run"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id) and type(map[key]) == 'string' then 
					local decompressed_save = STR_UNPACK(map[key])
					G.SAVED_GAME = decompressed_save
				end
			end
			
            if key == "_read_hints_" .. tostring(G.AP.team_id) .. "_" .. tostring(G.AP.player_id) then
                G.AP.hints = map[key]
                G.AP.update_hints()
            end
            sendDebugMessage("  " .. key .. ": " .. tostring(map[key]))
            if type(map[key]) == "table" then
                --print(tprint(map[key]))
            end
        end
        -- extra will include extra fields from Get
        print("Extra:")
        for key, value in pairs(extra) do
            print("  " .. key .. ": " .. tostring(value))
        end
        -- both keys and extra are optional
    end

    function on_set_reply(message)
        print("Set Reply:"..message.key)
		if message.key == "balatro_joker_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id) then
			G.E_MANAGER:add_event(
			Event { blocking = false, blockable = false, force_pause = true,
				func = function()
					if isAPProfileLoaded() then
						G.PROFILES[G.AP.profile_Id].joker_usage = message.value
						if G.AP.goal == 4 then
							G.PROFILES[G.AP.profile_Id].ap_progress = G.AP.check_progress()
						end
					end
					return true
				end
			})
		end
		
		if message.key == "balatro_deck_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id) then
			G.E_MANAGER:add_event(
			Event { blocking = false, blockable = false, force_pause = true,
				func = function()
					if isAPProfileLoaded() then
						G.PROFILES[G.AP.profile_Id].deck_usage = message.value
						if G.AP.goal ~= 4 then
							G.PROFILES[G.AP.profile_Id].ap_progress = G.AP.check_progress()
						end
					end
					return true
				end
			})
		end
        -- for key, value in pairs(message) do
            -- print("  " .. key .. ": " .. tostring(value))
            -- if key == "value" and type(value) == "table" then
                -- for subkey, subvalue in pairs(value) do
                    -- print("    " .. subkey .. ": " .. tostring(subvalue))
                -- end
            -- end
        -- end
    end
    local uuid = ""
    G.APClient = AP(uuid, "Balatro", server);

    G.APClient:set_socket_connected_handler(on_socket_connected)
    G.APClient:set_socket_error_handler(on_socket_error)
    G.APClient:set_socket_disconnected_handler(on_socket_disconnected)
    G.APClient:set_room_info_handler(on_room_info)
    G.APClient:set_slot_connected_handler(on_slot_connected)
    G.APClient:set_slot_refused_handler(on_slot_refused)
    G.APClient:set_items_received_handler(on_items_received)
    G.APClient:set_location_info_handler(on_location_info)
    G.APClient:set_location_checked_handler(on_location_checked)
    G.APClient:set_data_package_changed_handler(on_data_package_changed)
    G.APClient:set_print_handler(on_print)
    G.APClient:set_print_json_handler(on_print_json)
    G.APClient:set_bounced_handler(on_bounced)
    G.APClient:set_retrieved_handler(on_retrieved)
    G.APClient:set_set_reply_handler(on_set_reply)
end

G.AP.update_hints = function()
	if not G.AP.hints then return nil end
    G.AP.hint_locations = G.AP.hint_locations or {}
    G.AP.player_names = G.AP.player_names or {}
	G.AP.hint_priotiy = G.AP.hint_priotiy or {}
	if not G.E_MANAGER.queues.ap_hints then G.E_MANAGER.queues.ap_hints = {} end
	if #G.E_MANAGER.queues.ap_hints ~= 0 then G.E_MANAGER.clear_queue('ap_hints') end
	G.AP.make_hint_step(1)
end

function G.AP.make_hint_step(i, hint)
	local temp_pause = G.SETTINGS.paused
	G.SETTINGS.paused = false
	
	if i then
		while i < #G.AP.hints do
			if not G.AP.hint_locations[G.AP.hints[i].location] and G.AP.hints[i].found == false then
				-- local items
				if G.AP.hints[i].finding_player == G.AP.player_id then
					G.AP.hint_locations[G.AP.hints[i].location] = 
						G.APClient:get_location_name(G.AP.hints[i].location, 'Balatro')
					
					G.E_MANAGER:add_event(
						Event {
							blocking = true,
							pause_force = true,
							func = function()
								sendDebugMessage("waiting on hint #"..tostring(i))
								return G.AP.hint_locations[G.AP.hints[i].location]
							end
						}, 'ap_hints')
					
					G.E_MANAGER:add_event(
						Event {
							blockable = true,
							pause_force = true,
							func = function()
								G.AP.make_hint_step(i+1)
								sendDebugMessage("queued hint #"..tostring(i+1))
								return true
							end
						}, 'ap_hints')
					break
				else --nonlocal items
					G.AP.hint_locations[G.AP.hints[i].location] = "nonlocal"
					local finder = G.AP.hints[i].finding_player
					if not G.AP.player_names[finder] then
						
						G.AP.player_names[finder] = G.APClient:get_player_alias(finder)
						
						G.E_MANAGER:add_event(
							Event {
								blocking = true,
								pause_force = true,
								func = function()
									sendDebugMessage("waiting on name for player "..tostring(finder))
									return G.AP.player_names[finder]
								end
							}, 'ap_hints')
						
						G.E_MANAGER:add_event(
							Event {
								blockable = true,
								pause_force = true,
								func = function()
									G.AP.make_hint_step(i+1)
									sendDebugMessage("queued hint #"..tostring(i+1))
									return true
								end
							}, 'ap_hints')
						break
					end
				end
			end
			i = i + 1
		end
	end
	
	if hint then
		if not hint.found and not G.AP.hint_locations[hint.location] then
			G.AP.hint_locations[hint.location] = G.APClient:get_location_name(hint.location, 'Balatro')
			
			G.E_MANAGER:add_event(
				Event {
					blocking = true,
					pause_force = true,
					func = function()
						sendDebugMessage("waiting on priority hint")
						return G.AP.hint_locations[hint.location]
					end
				}, 'ap_hints')
			
			G.E_MANAGER:add_event(
				Event {
					blockable = true,
					pause_force = true,
					func = function()
						sendDebugMessage("priority hint received")
						G.AP.hint_priotiy[hint.location] = nil
						return true
					end
				}, 'ap_hints')
		else
			G.AP.hint_priotiy[hint.location] = nil
		end
	end
	
	G.SETTINGS.paused = temp_pause
end

local LoadProfileHook = G.FUNCS.load_profile
G.FUNCS.load_profile = function(delete_prof_data)
	if isAPProfileSelected() and not isAPProfileLoaded() then
		G.SAVED_GAME = nil
		G.E_MANAGER:clear_queue()
		G.FUNCS.wipe_on()
		G.E_MANAGER:add_event(Event({
			no_delete = true,
			func = function()
				G:delete_run()
				G.DISCOVER_TALLIES = nil
				G.PROGRESS = nil
				G.AP.load_profile()
				G:init_item_prototypes()
				return true
			end
		}))
		
		G.E_MANAGER:add_event(Event({
			no_delete = true,
			blockable = true, 
			blocking = false,
			func = function()
				G:main_menu()
				G.FILE_HANDLER.force = true
				return true
			end
		}))
		
		G.FUNCS.wipe_off()
	else
		LoadProfileHook(delete_prof_data)
	end
end

G.AP.load_profile = function()
	local temp_APprofile = {
		MEMORY = {
			deck = 'Red Deck',
			stake = 1,
		},
		stake = 1,
		name = G.AP['APSlot'],
		Archipelago = true,
		high_scores = {
			hand = {label = 'Best Hand', amt = 0},
			furthest_round = {label = 'Highest Round', amt = 0},
			furthest_ante = {label = 'Highest Ante', amt = 0},
			most_money = {label = 'Most Money', amt = 0},
			boss_streak = {label = 'Most Bosses in a Row', amt = 0},
			collection = {label = 'Collection', amt = 0, tot = 1},
			win_streak = {label = 'Best Win Streak', amt = 0},
			current_streak = {label = '', amt = 0},
			poker_hand = {label = 'Most Played Hand', amt = 0}
		},

		career_stats = {
			c_round_interest_cap_streak = 0,
			c_dollars_earned = 0,
			c_shop_dollars_spent = 0,
			c_tarots_bought = 0,
			c_planets_bought = 0,
			c_playing_cards_bought = 0,
			c_vouchers_bought = 0,
			c_tarot_reading_used = 0,
			c_planetarium_used = 0,
			c_shop_rerolls = 0,
			c_cards_played = 0,
			c_cards_discarded = 0,
			c_losses = 0,
			c_wins = 0,
			c_rounds = 0,
			c_hands_played = 0,
			c_face_cards_played = 0,
			c_jokers_sold = 0,
			c_cards_sold = 0,
			c_single_hand_round_streak = 0,
		},
		progress = {

		},
		joker_usage = {},
		consumeable_usage = {},
		voucher_usage = {},
		hand_usage = {},
		deck_usage = {},
		deck_stakes = {},
		challenges_unlocked = nil,
		challenge_progress = {
		completed = {},
		unlocked = {}
		}
	}
	G.PROFILES[G.AP.profile_Id] = temp_APprofile
	G.PROFILES[G.AP.profile_Id].init = true
	G.FUNCS.set_up_APProfile()
end

local CanContinueRef = G.FUNCS.can_continue
G.FUNCS.can_continue = function(e)
	if isAPProfileLoaded() then
		if e.config.func then
			local _can_continue = nil
			
			if G.SAVED_GAME and G.SAVED_GAME.GAME then
				if G.SAVED_GAME.GAME.ap_seed == G.APClient:get_seed() and
				G.SAVED_GAME.GAME.ap_jokers_removed == AreJokersRemoved() and
				G.SAVED_GAME.GAME.ap_consums_removed == AreConsumablesRemoved() and
				G.SAVED_GAME.GAME.ap_modded_items == G.AP.this_mod.config.modded then
					_can_continue = true
				end
			end
			
			e.config.func = nil
			
			if not _can_continue then
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			end
			
			return _can_continue
		end
	else
		return CanContinueRef(e)
	end
end

local remove_saveRef = remove_save
function remove_save()
	if isAPProfileLoaded() then
		G.AP.server_save_run(nil)
	end
	return remove_saveRef()
end

G.AP.server_save_decks = function()
	if G.PROFILES[G.SETTINGS.profile].deck_usage then
		G.APClient:Set("balatro_deck_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id), {}, false, {{'replace', G.PROFILES[G.SETTINGS.profile].deck_usage}})
	end
end

G.AP.server_save_jokers = function()
	if G.PROFILES[G.SETTINGS.profile].joker_usage then
		G.APClient:Set("balatro_joker_wins"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id), {}, false, {{'replace', G.PROFILES[G.SETTINGS.profile].joker_usage}})
	end
end

G.AP.server_save_run = function(data)
	local compressed_save = data and STR_PACK(data) or nil
	G.APClient:Set("balatro_current_run"..tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id), {}, false, {{'replace', compressed_save}})
end

G.AP.server_load = function()
	local PID = tostring(G.AP.player_id)..'_'..tostring(G.AP.team_id)
	G.APClient:Get({"balatro_deck_wins"..PID, "balatro_joker_wins"..PID, "balatro_current_run"..PID})
	G.APClient:SetNotify({"balatro_deck_wins"..PID, "balatro_joker_wins"..PID})
end