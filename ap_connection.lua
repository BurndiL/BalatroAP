require(G.AP.this_mod.path .. "utils")

G.APItems = {
    [G.AP.id_offset + 1]="Red Deck"   ,
    [G.AP.id_offset + 2]="Blue Deck"  ,
    [G.AP.id_offset + 3]="Yellow Deck" ,
    [G.AP.id_offset + 4]="Green Deck" ,
    [G.AP.id_offset + 5]="Black Deck" ,
    [G.AP.id_offset + 6]="Magic Deck" ,
    [G.AP.id_offset + 7]="Nebula Deck",
    [G.AP.id_offset + 8]="Ghost Deck" ,
    [G.AP.id_offset + 9]="Abandoned Deck" ,
    [G.AP.id_offset + 10]="Checkered Deck",
    [G.AP.id_offset + 11]="Zodiac Deck",
    [G.AP.id_offset + 12]="Painted Deck",
    [G.AP.id_offset + 13]="Anaglyph Deck",
    [G.AP.id_offset + 14]="Plasma Deck" ,
    [G.AP.id_offset + 15]="Erratic Deck" ,
    [G.AP.id_offset + 16]="Filler Item" ,

}

G.APSave = {
    ShopLocations = 0,
}

function APConnect()
    server = G.AP.APAddress..":"..G.AP.APPort
    slot = G.AP.APSlot
    password = G.AP.APPassword
    function on_socket_connected()
        print("Socket connected")
    end

    function on_socket_error(msg)
        print("Socket error: " .. msg)
    end

    function on_socket_disconnected()
        print("Socket disconnected")
    end

    function on_room_info()
        print("Room info")
        G.APClient:ConnectSlot(slot, password, 7, {"Lua-APClientPP"}, {0, 4, 4})
    end

    function on_slot_connected(slot_data)
        print("Slot connected")
        print(slot_data)
        
        print("missing locations: " .. table.concat(G.APClient.missing_locations, ", "))
        print("checked locations: " .. table.concat(G.APClient.checked_locations, ", "))
        G.APClient:Say("Hello World!")
        G.APClient:Bounce({name="test"}, {"Balatro"})
        local extra = {nonce = 123}  -- optional extra data will be in the server reply
        G.APClient:Get({"counter"}, extra)
        G.APClient:Set("counter", 0, true, {{"add", 1}}, extra)
        G.APClient:Set("empty_array", nil, true, {{"replace", AP.EMPTY_ARRAY}})
        G.APClient:ConnectUpdate(nil, {"Lua-APClientPP", "DeathLink"})
        --G.APClient:LocationChecks({64000, 64001, 64002})
        print("Players:")
        local players = G.APClient:get_players()
        for _, player in ipairs(players) do
            print("  " .. tostring(player.slot) .. ": " .. player.name ..
                  " playing " .. G.APClient:get_player_game(player.slot))
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
        remove_locked = {}
        for _, item in ipairs(items) do
            print(item.item)
            local item_id = item.item
            local item_name = G.APItems[item.item]

            -- unlock decks by adding their name to the list of unlocked_backs:

            if (item_id - G.AP.id_offset) <= 15 then
                G.AP.unlocked_backs[item_name] = true
            end 

            -- local i=1
            -- while i <= #G.P_LOCKED do
            --     --leaving this for maybe unlocking cards in future (not planned though)
            --     i = i+1
            -- end
        end
    end

    function on_location_info(items)
        print("Locations scouted:")
        for _, item in ipairs(items) do
            print(item.item)
        end
    end

    function on_location_checked(locations)
        print("Locations checked:" .. table.concat(locations, ", "))
        print("Checked locations: " .. table.concat(G.APClient.checked_locations, ", "))
    end

    function on_data_package_changed(data_package)
        print("Data package changed:")
        print(data_package)
    end

    function on_print(msg)
        print(msg)
    end

    function on_print_json(msg, extra)
        print(G.APClient:render_json(msg, AP.RenderFormat.TEXT))
        for key, value in pairs(extra) do
            -- print("  " .. key .. ": " .. tostring(value))
        end
    end

    function on_bounced(bounce)
        print("Bounced:")
        print(tostring(bounce))
        if bounce ~= nil and bounce.tags and tbl_contains(bounce.tags, "DeathLink") and bounce.data then
            G.AP.death_link_cause = bounce.data.cause or "unknown"
            G.AP.death_link_source = bounce.data.source or "unknown"
            
            G.FUNCS.die()
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
    print(server)
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
