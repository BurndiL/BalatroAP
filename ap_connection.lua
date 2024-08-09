NFS.load(G.AP.this_mod.path .. "utils.lua")()

G.APItems = {
    -- Backs (=decks but referred to as backs)
    [G.AP.id_offset + 1] = "Red Deck",
    [G.AP.id_offset + 2] = "Blue Deck",
    [G.AP.id_offset + 3] = "Yellow Deck",
    [G.AP.id_offset + 4] = "Green Deck",
    [G.AP.id_offset + 5] = "Black Deck",
    [G.AP.id_offset + 6] = "Magic Deck",
    [G.AP.id_offset + 7] = "Nebula Deck",
    [G.AP.id_offset + 8] = "Ghost Deck",
    [G.AP.id_offset + 9] = "Abandoned Deck",
    [G.AP.id_offset + 10] = "Checkered Deck",
    [G.AP.id_offset + 11] = "Zodiac Deck",
    [G.AP.id_offset + 12] = "Painted Deck",
    [G.AP.id_offset + 13] = "Anaglyph Deck",
    [G.AP.id_offset + 14] = "Plasma Deck",
    [G.AP.id_offset + 15] = "Erratic Deck",

    -- Jokers
    [G.AP.id_offset + 16] = "Joker",
    [G.AP.id_offset + 17] = "Greedy Joker",
    [G.AP.id_offset + 18] = "Lusty Joker",
    [G.AP.id_offset + 19] = "Wrathful Joker",
    [G.AP.id_offset + 20] = "Gluttonous Joker",
    [G.AP.id_offset + 21] = "Jolly Joker",
    [G.AP.id_offset + 22] = "Zany Joker",
    [G.AP.id_offset + 23] = "Mad Joker",
    [G.AP.id_offset + 24] = "Crazy Joker",
    [G.AP.id_offset + 25] = "Droll Joker",
    [G.AP.id_offset + 26] = "Sly Joker",
    [G.AP.id_offset + 27] = "Wily Joker",
    [G.AP.id_offset + 28] = "Clever Joker",
    [G.AP.id_offset + 29] = "Devious Joker",
    [G.AP.id_offset + 30] = "Crafty Joker",
    [G.AP.id_offset + 31] = "Half Joker",
    [G.AP.id_offset + 32] = "Joker Stencil",
    [G.AP.id_offset + 33] = "Four Fingers",
    [G.AP.id_offset + 34] = "Mime",
    [G.AP.id_offset + 35] = "Credit Card",
    [G.AP.id_offset + 36] = "Ceremonial Dagger",
    [G.AP.id_offset + 37] = "Banner",
    [G.AP.id_offset + 38] = "Mystic Summit",
    [G.AP.id_offset + 39] = "Marble Joker",
    [G.AP.id_offset + 40] = "Loyalty Card",
    [G.AP.id_offset + 41] = "8 Ball",
    [G.AP.id_offset + 42] = "Misprint",
    [G.AP.id_offset + 43] = "Dusk",
    [G.AP.id_offset + 44] = "Raised Fist",
    [G.AP.id_offset + 45] = "Chaos the Clown",
    [G.AP.id_offset + 46] = "Fibonacci",
    [G.AP.id_offset + 47] = "Steel Joker",
    [G.AP.id_offset + 48] = "Scary Face",
    [G.AP.id_offset + 49] = "Abstract Joker",
    [G.AP.id_offset + 50] = "Delayed Gratification",
    [G.AP.id_offset + 51] = "Hack",
    [G.AP.id_offset + 52] = "Pareidolia",
    [G.AP.id_offset + 53] = "Gros Michel",
    [G.AP.id_offset + 54] = "Even Steven",
    [G.AP.id_offset + 55] = "Odd Todd",
    [G.AP.id_offset + 56] = "Scholar",
    [G.AP.id_offset + 57] = "Business Card",
    [G.AP.id_offset + 58] = "Supernova",
    [G.AP.id_offset + 59] = "Ride the Bus",
    [G.AP.id_offset + 60] = "Space Joker",
    [G.AP.id_offset + 61] = 'Egg',
    [G.AP.id_offset + 62] = 'Burglar',
    [G.AP.id_offset + 63] = 'Blackboard',
    [G.AP.id_offset + 64] = 'Runner',
    [G.AP.id_offset + 65] = 'Ice Cream',
    [G.AP.id_offset + 66] = 'DNA',
    [G.AP.id_offset + 67] = 'Splash',
    [G.AP.id_offset + 68] = 'Blue Joker',
    [G.AP.id_offset + 69] = 'Sixth Sense',
    [G.AP.id_offset + 70] = 'Constellation',
    [G.AP.id_offset + 71] = 'Hiker',
    [G.AP.id_offset + 72] = 'Faceless Joker',
    [G.AP.id_offset + 73] = 'Green Joker',
    [G.AP.id_offset + 74] = 'Superposition',
    [G.AP.id_offset + 75] = 'To Do List',
    [G.AP.id_offset + 76] = "Cavendish",
    [G.AP.id_offset + 77] = "Card Sharp",
    [G.AP.id_offset + 78] = "Red Card",
    [G.AP.id_offset + 79] = "Madness",
    [G.AP.id_offset + 80] = "Square Joker",
    [G.AP.id_offset + 81] = "Seance",
    [G.AP.id_offset + 82] = "Riff-raff",
    [G.AP.id_offset + 83] = "Vampire",
    [G.AP.id_offset + 84] = "Shortcut",
    [G.AP.id_offset + 85] = "Hologram",
    [G.AP.id_offset + 86] = "Vagabond",
    [G.AP.id_offset + 87] = "Baron",
    [G.AP.id_offset + 88] = "Cloud 9",
    [G.AP.id_offset + 89] = "Rocket",
    [G.AP.id_offset + 90] = "Obelisk",
    [G.AP.id_offset + 91] = "Midas Mask",
    [G.AP.id_offset + 92] = "Luchador",
    [G.AP.id_offset + 93] = "Photograph",
    [G.AP.id_offset + 94] = "Gift Card",
    [G.AP.id_offset + 95] = "Turtle Bean",
    [G.AP.id_offset + 96] = "Erosion",
    [G.AP.id_offset + 97] = "Reserved Parking",
    [G.AP.id_offset + 98] = "Mail-In Rebate",
    [G.AP.id_offset + 99] = "To the Moon",
    [G.AP.id_offset + 100] = "Hallucination",
    [G.AP.id_offset + 101] = "Fortune Teller",
    [G.AP.id_offset + 102] = "Juggler",
    [G.AP.id_offset + 103] = "Drunkard",
    [G.AP.id_offset + 104] = "Stone Joker",
    [G.AP.id_offset + 105] = "Golden Joker",
    [G.AP.id_offset + 106] = "Lucky Cat",
    [G.AP.id_offset + 107] = "Baseball Card",
    [G.AP.id_offset + 108] = "Bull",
    [G.AP.id_offset + 109] = "Diet Cola",
    [G.AP.id_offset + 110] = "Trading Card",
    [G.AP.id_offset + 111] = "Flash Card",
    [G.AP.id_offset + 112] = "Popcorn",
    [G.AP.id_offset + 113] = "Spare Trousers",
    [G.AP.id_offset + 114] = "Ancient Joker",
    [G.AP.id_offset + 115] = "Ramen",
    [G.AP.id_offset + 116] = "Walkie Talkie",
    [G.AP.id_offset + 117] = "Seltzer",
    [G.AP.id_offset + 118] = "Castle",
    [G.AP.id_offset + 119] = "Smiley Face",
    [G.AP.id_offset + 120] = "Campfire",
    [G.AP.id_offset + 121] = "Golden Ticket",
    [G.AP.id_offset + 122] = "Mr. Bones",
    [G.AP.id_offset + 123] = "Acrobat",
    [G.AP.id_offset + 124] = "Sock and Buskin",
    [G.AP.id_offset + 125] = "Swashbuckler",
    [G.AP.id_offset + 126] = "Troubadour",
    [G.AP.id_offset + 127] = "Certificate",
    [G.AP.id_offset + 128] = "Smeared Joker",
    [G.AP.id_offset + 129] = "Throwback",
    [G.AP.id_offset + 130] = "Hanging Chad",
    [G.AP.id_offset + 131] = "Rough Gem",
    [G.AP.id_offset + 132] = "Bloodstone",
    [G.AP.id_offset + 133] = "Arrowhead",
    [G.AP.id_offset + 134] = "Onyx Agate",
    [G.AP.id_offset + 135] = "Glass Joker",
    [G.AP.id_offset + 136] = "Showman",
    [G.AP.id_offset + 137] = "Flower Pot",
    [G.AP.id_offset + 138] = "Blueprint",
    [G.AP.id_offset + 139] = "Wee Joker",
    [G.AP.id_offset + 140] = "Merry Andy",
    [G.AP.id_offset + 141] = "Oops! All 6s",
    [G.AP.id_offset + 142] = "The Idol",
    [G.AP.id_offset + 143] = "Seeing Double",
    [G.AP.id_offset + 144] = "Matador",
    [G.AP.id_offset + 145] = "Hit the Road",
    [G.AP.id_offset + 146] = "The Duo",
    [G.AP.id_offset + 147] = "The Trio",
    [G.AP.id_offset + 148] = "The Family",
    [G.AP.id_offset + 149] = "The Order",
    [G.AP.id_offset + 150] = "The Tribe",
    [G.AP.id_offset + 151] = "Stuntman",
    [G.AP.id_offset + 152] = "Invisible Joker",
    [G.AP.id_offset + 153] = "Brainstorm",
    [G.AP.id_offset + 154] = "Satellite",
    [G.AP.id_offset + 155] = "Shoot the Moon",
    [G.AP.id_offset + 156] = "Driver's License",
    [G.AP.id_offset + 157] = "Cartomancer",
    [G.AP.id_offset + 158] = "Astronomer",
    [G.AP.id_offset + 159] = "Burnt Joker",
    [G.AP.id_offset + 160] = "Bootstraps",
    [G.AP.id_offset + 161] = "Caino",
    [G.AP.id_offset + 162] = "Triboulet",
    [G.AP.id_offset + 163] = "Yorick",
    [G.AP.id_offset + 164] = "Chicot",
    [G.AP.id_offset + 165] = "Perkeo",

    -- Vouchers
    [G.AP.id_offset + 166] = "Overstock",
    [G.AP.id_offset + 167] = "Clearance Sale",
    [G.AP.id_offset + 168] = "Hone",
    [G.AP.id_offset + 169] = "Reroll Surplus",
    [G.AP.id_offset + 170] = "Crystal Ball",
    [G.AP.id_offset + 171] = "Telescope",
    [G.AP.id_offset + 172] = "Grabber",
    [G.AP.id_offset + 173] = "Wasteful",
    [G.AP.id_offset + 174] = "Tarot Merchant",
    [G.AP.id_offset + 175] = "Planet Merchant",
    [G.AP.id_offset + 176] = "Seed Money",
    [G.AP.id_offset + 177] = "Blank",
    [G.AP.id_offset + 178] = "Magic Trick",
    [G.AP.id_offset + 179] = "Hieroglyph",
    [G.AP.id_offset + 180] = "Director's Cut",
    [G.AP.id_offset + 181] = "Paint Brush",
    [G.AP.id_offset + 182] = "Overstock Plus",
    [G.AP.id_offset + 183] = "Liquidation",
    [G.AP.id_offset + 184] = "Glow Up",
    [G.AP.id_offset + 185] = "Reroll Glut",
    [G.AP.id_offset + 186] = "Omen Globe",
    [G.AP.id_offset + 187] = "Observatory",
    [G.AP.id_offset + 188] = "Nacho Tong",
    [G.AP.id_offset + 189] = "Recyclomancy",
    [G.AP.id_offset + 190] = "Tarot Tycoon",
    [G.AP.id_offset + 191] = "Planet Tycoon",
    [G.AP.id_offset + 192] = "Money Tree",
    [G.AP.id_offset + 193] = "Antimatter",
    [G.AP.id_offset + 194] = "Illusion",
    [G.AP.id_offset + 195] = "Petroglyph",
    [G.AP.id_offset + 196] = "Retcon",
    [G.AP.id_offset + 197] = "Palette",

    -- Packs 

    [G.AP.id_offset + 198] = "Arcana Pack",
    [G.AP.id_offset + 199] = "Jumbo Arcana Pack",
    [G.AP.id_offset + 200] = "Mega Arcana Pack",
    [G.AP.id_offset + 201] = "Celestial Pack",
    [G.AP.id_offset + 202] = "Jumbo Celestial Pack",
    [G.AP.id_offset + 203] = "Mega Celestial Pack",
    [G.AP.id_offset + 204] = "Spectral Pack",
    [G.AP.id_offset + 205] = "Jumbo Spectral Pack",
    [G.AP.id_offset + 206] = "Mega Spectral Pack",
    [G.AP.id_offset + 207] = "Standard Pack",
    [G.AP.id_offset + 208] = "Jumbo Standard Pack",
    [G.AP.id_offset + 209] = "Mega Standard Pack",
    [G.AP.id_offset + 210] = "Buffoon Pack",
    [G.AP.id_offset + 211] = "Jumbo Buffoon Pack",
    [G.AP.id_offset + 212] = "Mega Buffoon Pack",

    -- Tarot Cards 

    [G.AP.id_offset + 213] = "The Fool",
    [G.AP.id_offset + 214] = "The Magician",
    [G.AP.id_offset + 215] = "The High Priestess",
    [G.AP.id_offset + 216] = "The Empress",
    [G.AP.id_offset + 217] = "The Emperor",
    [G.AP.id_offset + 218] = "The Hierophant",
    [G.AP.id_offset + 219] = "The Lovers",
    [G.AP.id_offset + 220] = "The Chariot",
    [G.AP.id_offset + 221] = "Justice",
    [G.AP.id_offset + 222] = "The Hermit",
    [G.AP.id_offset + 223] = "The Wheel of Fortune",
    [G.AP.id_offset + 224] = "Strength",
    [G.AP.id_offset + 225] = "The Hanged Man",
    [G.AP.id_offset + 226] = "Death",
    [G.AP.id_offset + 227] = "Temperance",
    [G.AP.id_offset + 228] = "The Devil",
    [G.AP.id_offset + 229] = "The Tower",
    [G.AP.id_offset + 230] = "The Star",
    [G.AP.id_offset + 231] = "The Moon",
    [G.AP.id_offset + 232] = "The Sun",
    [G.AP.id_offset + 233] = "Judgement",
    [G.AP.id_offset + 234] = "The World",

    -- Planet Cards

    [G.AP.id_offset + 235] = "Mercury",
    [G.AP.id_offset + 236] = "Venus",
    [G.AP.id_offset + 237] = "Earth",
    [G.AP.id_offset + 238] = "Mars",
    [G.AP.id_offset + 239] = "Jupiter",
    [G.AP.id_offset + 240] = "Saturn",
    [G.AP.id_offset + 241] = "Uranus",
    [G.AP.id_offset + 242] = "Neptune",
    [G.AP.id_offset + 243] = "Pluto",
    [G.AP.id_offset + 244] = "Planet X",
    [G.AP.id_offset + 245] = "Ceres",
    [G.AP.id_offset + 246] = "Eris",

    -- Spectral Cards

    [G.AP.id_offset + 247] = "Familiar",
    [G.AP.id_offset + 248] = "Grim",
    [G.AP.id_offset + 249] = "Incantation",
    [G.AP.id_offset + 250] = "Talisman",
    [G.AP.id_offset + 251] = "Aura",
    [G.AP.id_offset + 252] = "Wraith",
    [G.AP.id_offset + 253] = "Sigil",
    [G.AP.id_offset + 254] = "Ouija",
    [G.AP.id_offset + 255] = "Ectoplasm",
    [G.AP.id_offset + 256] = "Immolate",
    [G.AP.id_offset + 257] = "Ankh",
    [G.AP.id_offset + 258] = "Deja Vu",
    [G.AP.id_offset + 259] = "Hex",
    [G.AP.id_offset + 260] = "Trance",
    [G.AP.id_offset + 261] = "Medium",
    [G.AP.id_offset + 262] = "Cryptid",
    [G.AP.id_offset + 263] = "The Soul",
    [G.AP.id_offset + 264] = "Black Hole",

    -- Bonus Items
    [G.AP.id_offset + 300] = "Bonus Discards",
    [G.AP.id_offset + 301] = "Bonus Money",
    [G.AP.id_offset + 302] = "Bonus Starting Money",
    [G.AP.id_offset + 303] = "Bonus Hands",
    [G.AP.id_offset + 304] = "Bonus Hand Size",

    -- Trap Items
    [G.AP.id_offset + 320] = "Lose All Money",
    [G.AP.id_offset + 321] = "Lose Discard",
    [G.AP.id_offset + 322] = "Lose Hand"
}

G.APSave = {
    ShopLocations = 0
}

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
            G.FUNCS.APDisconnect()
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

        -- G.APClient:Set("empty_array", nil, true, {{"replace", AP.EMPTY_ARRAY}})

        local tags = {"Lua-APClientPP"}
        if (G.AP.slot_data.deathlink) then
            tags[#tags + 1] = "DeathLink"
        end

        G.APClient:ConnectUpdate(nil, tags)
        -- print("Players:")
        -- local players = G.APClient:get_players()
        -- for _, player in ipairs(players) do
        --     print("  " .. tostring(player.slot) .. ": " .. player.name .. " playing " ..
        --               G.APClient:get_player_game(player.slot))
        -- end
            
        local seed = G.APClient:get_seed()
        local clientSeed = nil
        local info = get_compressed(G.AP.profile_Id..'/profile.jkr')
        if info then
            local unpacked = STR_UNPACK(info)
            clientSeed = unpacked['ap_seed']
        end


        if not clientSeed then
            G.PROFILES[G.AP.profile_Id]['ap_seed'] = seed
        else
            if clientSeed ~= seed then
                sendDebugMessage("Client and Server have different seeds")
                G.FUNCS.APDisconnect()
            end
        end


        -- set profile name to slot name 
        G.PROFILES[G.AP.profile_Id]['name'] = G.AP['APSlot']
        -- just to make sure it's actually loading the right profile
        G.SETTINGS.profile = G.AP.profile_Id

        G.FUNCS.load_profile(false)

        G.FUNCS.set_up_APProfile()
    end

    function on_slot_refused(reasons)
        print("Slot refused: " .. table.concat(reasons, ", "))
    end

    function on_items_received(items)
        print("Items received:")
        for _, item in ipairs(items) do
            local item_id = item.item - G.AP.id_offset
            local item_name = G.APItems[item.item]

            -- if item was already received, ignore it 
            if G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                item_id = 0
            end

            function unlock(item_name)
                local i = 1
                while i <= #G.P_LOCKED do
                    local wasLocked = false
                    local item = G.P_LOCKED[i]
                    if item_name == item.name then

                        -- progressive vouchers
                        if item.requires then
                            if (not G.P_CENTERS[item.requires[1]].unlocked) then
                                G.P_CENTERS[item.requires[1]].nextVoucher = item
                                item = G.P_CENTERS[item.requires[1]]
                            end

                        elseif item.nextVoucher then
                            item = item.nextVoucher
                        end

                        if (not G.AP.slot_data.remove_jokers and item.set == "Joker") or
                            (not G.AP.slot_data.remove_consumables and
                                (item.set == "Tarot" or item.set == "Planet" or item.set == "Spectral")) then

                            item.ap_unlocked = true

                            if G.jokers and G.jokers.cards then
                                for k, v in pairs(G.jokers.cards) do
                                    if v and type(v) == 'table' and v.config.center.name == item.name then
                                        v:set_debuff(false)
                                    end
                                end
                            end

                            if G.consumeables and G.consumeables.cards then
                                for k, v in pairs(G.consumeables.cards) do
                                    if v and type(v) == 'table' and v.config.center.name == item.name then
                                        v:set_debuff(false)
                                    end
                                end
                            end

                            if G.STATES then
                                if G.STATE == G.STATES.SHOP and G.shop_jokers and G.shop_jokers.cards then
                                    for k, v in pairs(G.shop_jokers.cards) do
                                        if v and type(v) == 'table' and v.config.center.name == item.name then
                                            v:set_debuff(false)
                                        end
                                    end
                                end
                                if G.STATE == G.STATES.BUFFOON_PACK and G.pack_cards and G.pack_cards.cards then
                                    for k, v in pairs(G.pack_cards.cards) do
                                        if v and type(v) == 'table' and v.config.center.name == item.name then
                                            v:set_debuff(false)
                                        end
                                    end
                                end
                            end
                        end

                        item.unlocked = true
                        item.discovered = true
                        item.hidden = false
                        wasLocked = true
                        item.demo = nil

                        G.FUNCS.AP_unlock_item(item)
                    end

                    if wasLocked == true then
                        table.remove(G.P_LOCKED, i)
                    else
                        i = i + 1
                    end
                end

            end

            sendDebugMessage("received Item id" .. tostring(item_id))
            sendDebugMessage("received Item name" .. tostring(item_name))

            -- failsave, because if item_name is unknown or was already received, item_id will be 0
            if item_id ~= 0 then
                -- unlock decks by adding their name to the list of backs (this backs list is only there in AP to keep track of unlocks):
                -- same with jokers/vouchers
                if item_id <= 15 then
                    sendDebugMessage("received Deck")

                    -- different handling if item was received on startup (queue it)
                    -- or if it's during gameplay (display immediately)
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["backs"][item_name] = true
                        unlock(item_name)
                    else
                        G.AP.BackQueue[item_name] = item.index
                    end

                elseif item_id >= 16 and item_id <= 165 then
                    sendDebugMessage("received Joker")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["jokers"][item_name] = true
                        unlock(item_name)
                    else
                        G.AP.JokerQueue[item_name] = item.index
                    end
                    -- Vouchers
                elseif item_id >= 166 and item_id <= 197 then
                    sendDebugMessage("received Voucher")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["vouchers"][item_name] = true
                        unlock(item_name)
                    else
                        G.AP.VoucherQueue[item_name] = item.index
                    end
                    -- Packs
                elseif item_id >= 198 and item_id <= 212 then
                    sendDebugMessage("received Pack")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["packs"][item_name] = true
                        unlock(item_name)
                    else
                        G.AP.PackQueue[item_name] = item.index
                    end
                    -- Consumables
                elseif item_id >= 213 and item_id <= 264 then
                    sendDebugMessage("received Consumable")
                    if G.AP.GameObjectInit then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        G.PROFILES[G.AP.profile_Id]["consumables"][item_name] = true
                        unlock(item_name)
                    else
                        G.AP.ConsumableQueue[item_name] = item.index
                    end

                    -- Bonus Items
                elseif item_id >= 300 and item_id < 330 then
                    if item_id == 301 then
                        if G.AP.GameObjectInit then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            G.PROFILES[G.AP.profile_Id]["bonusdiscards"] =
                                (G.PROFILES[G.AP.profile_Id]["bonusdiscards"] or 0) + 1
                            if G.STAGE == G.STAGES.RUN then
                                ease_discard(1)
                            end
                            
                            notify_alert('op_discard', "Bonus")
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
                            
                            notify_alert('op_money', "Bonus")
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
                                ease_hands_played(1)
                            end

                            notify_alert('op_hand', "Bonus")
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

                            notify_alert('op_hand_size', "Bonus")
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

                            notify_alert('op_interest', "Bonus")
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

                            notify_alert('op_joker_slot', "Bonus")
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

                            notify_alert('op_consum_slot', "Bonus")
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

                            notify_alert('fill_money', "Bonus")
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

                            notify_alert('fill_buffoon', "Bonus")
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
                            notify_alert('fill_'..choice, "Bonus")
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
                            notify_alert('fill_juggle', "Bonus")
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
                            notify_alert('fill_d_six', "Bonus")
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
                            notify_alert('fill_uncommon', "Bonus")
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
                            notify_alert('fill_rare', "Bonus")
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
                            notify_alert('fill_negative', "Bonus")
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
                            notify_alert('fill_foil', "Bonus")
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
                            notify_alert('fill_holo', "Bonus")
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
                            notify_alert('fill_poly', "Bonus")
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
                            notify_alert('fill_double', "Bonus")
                        end
                    end

                    -- traps (only trigger while in run)
                elseif item_id >= 330 and item_id < 340 and G.STAGE and G.STAGE == G.STAGES.RUN then
                    if (item_id == 330) then
                        -- Lose All Money
                        ease_dollars(-G.GAME.dollars, true)
                        notify_alert("t_money", "Trap")

                    elseif (item_id == 331) then
                        -- Lose 1 Discard
                        ease_discard(-1)
                        notify_alert("t_discard", "Trap")
                    elseif item_id == 332 then
                        -- Lose 1 Hand
                        ease_hands_played(-1)
                        notify_alert("t_hand", "Trap")
                    elseif item_id == 333 then
                        -- make joker perishable
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_perishable(true)
                            notify_alert("t_perishable", "Trap")
                        end
                    elseif item_id == 334 then
                        -- make joker eternal
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_eternal(true)
                            notify_alert("t_eternal", "Trap")
                        end
                    elseif item_id == 335 then
                        -- make joker rental
                        if G.jokers and #G.jokers.cards > 0 then
                            G.jokers.cards[math.random(#G.jokers.cards)]:set_rental(true)
                            notify_alert("t_rental", "Trap")
                        end
                    end

                    -- joker bundles
                elseif item_id > 350 and item_id < 366 then
                    sendDebugMessage("received Joker Bundle")
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        local items_to_unlock = {}
                        for k, v in ipairs(G.AP.slot_data["jokerbundle" .. tostring(item_id - 350)]) do
                            items_to_unlock[#items_to_unlock + 1] = {
                                index = "joker" .. tostring(item_id - 350) .. tostring(#items_to_unlock + 1),
                                item = v
                            }
                        end

                        on_items_received(items_to_unlock)
                    end
                    -- tarot
                elseif item_id == 371 then
                    if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                        G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                        local items_to_unlock = {}
                        for i = 213, 234, 1 do
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
                        for i = 247, 264, 1 do
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
                        for i = 235, 246, 1 do
                            items_to_unlock[#items_to_unlock + 1] = {
                                index = "planet" .. tostring(i),
                                item = i + G.AP.id_offset
                            }
                        end
                        on_items_received(items_to_unlock)
                    end
                elseif item_id >= 390 and item_id <= 397 then
                    if item_id == 390 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('White Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'White Stake'
                            end

                        end
                    end
                    if item_id == 391 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Red Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Red Stake'
                            end

                        end
                    end
                    if item_id == 392 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Green Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Green Stake'
                            end

                        end
                    end
                    if item_id == 393 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Black Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Black Stake'
                            end

                        end
                    end
                    if item_id == 394 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Blue Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Blue Stake'
                            end

                        end
                    end
                    if item_id == 395 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Purple Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Purple Stake'
                            end

                        end
                    end
                    if item_id == 396 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Orange Stake')
                            else
                                G.AP.StakeQueue[#G.AP.StakeQueue + 1] = 'Orange Stake'
                            end

                        end
                    end
                    if item_id == 397 then
                        if not G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] then
                            G.PROFILES[G.AP.profile_Id]["received_indeces"][item.index] = true
                            if (G.AP.StakesInit) then
                                G.FUNCS.AP_unlock_stake('Gold Stake')
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
                        G.FUNCS.AP_unlock_stake_per_deck(stake_name, deck_name)
                    else
                        G.AP.StakeQueue[#G.AP.StakeQueue + 1] = {
                            stake = stake_name,
                            deck = deck_name
                        }
                    end
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
                    player_name = player_alias
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
        print("Retrieved:")
        -- since lua tables won't contain nil values, we can use keys array
        for _, key in ipairs(keys) do
            print("  " .. key .. ": " .. tostring(map[key]))
        end
        -- extra will include extra fields from Get
        print("Extra:")
        for key, value in pairs(extra) do
            print("  " .. key .. ": " .. tostring(value))
        end
        -- both keys and extra are optional
    end

    function on_set_reply(message)
        print("Set Reply:")
        for key, value in pairs(message) do
            print("  " .. key .. ": " .. tostring(value))
            if key == "value" and type(value) == "table" then
                for subkey, subvalue in pairs(value) do
                    print("    " .. subkey .. ": " .. tostring(subvalue))
                end
            end
        end
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
