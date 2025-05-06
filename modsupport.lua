-- this is where all mod support will go from now on

-- DebugPlus console
local success, dpAPI = pcall(require, "debugplus-api")
local logger = { -- Placeholder logger, for when DebugPlus isn't available
    log = sendInfoMessage,
    debug = sendDebugMessage,
    info = sendInfogMessage,
    warn = sendWarnMessage,
    error = sendErrorMessage
}

G.AP.log = function(msg, level)
	level = level or "DEBUG"
	if G.AP.debugplus then
		G.AP.debugplus.logger[string.lower(level)](msg)
	else
		logger[string.lower(level)](msg, "ArchipelagoLogger")
	end
end

if success and dpAPI.isVersionCompatible(1) then
	local debugplus = dpAPI.registerID("Archipelago")
	G.AP.debugplus = debugplus
	logger = debugplus.logger
	
	debugplus.addCommand({
		name = "hint",
		shortDesc = "Hint an AP Item.",
		desc = "Hint an AP Item. Type the item's name or mouse over it while executing this command.",
		exec = function (args, rawArgs, dp)
		
			if not G.APClient then return "You have to be connected to Archipelago for this command.", "ERROR" end
			-- Hovered Item takes priotiry
			if dp.hovered and dp.hovered.config and dp.hovered.config.center then
				local center = dp.hovered.config.center
				if not center.modded then
					local valid_sets = {}
					valid_sets.Joker = true
					valid_sets.Tarot = true
					valid_sets.Planet = true
					valid_sets.Spectral = true
					valid_sets.Voucher = true
					valid_sets.Booster = true
					
					if valid_sets[center.set] then
					
						if key == 'v_rand_ap_item' then
							return "Can't hint AP Check.", "ERROR"
						end
						
						if center.ap_unlocked then
							return "Can't hint unlocked items.", "ERROR"
						else
							G.AP.last_message = "!hint "..center.name
							G.APClient:Say("!hint "..center.name)
							return 'Hinting "'..center.name..'"...', "INFO", {1, 0, 1}
						end
					else
						if center.key == 'c_base' then
							if dp.hovered.facing == 'back' then
								local center_back = G.GAME[dp.hovered.back]
								if center_back.unlocked then
									return "Can't hint unlocked items.", "ERROR"
								else
									G.APClient:Say("!hint "..center_back.name)
									return "INFO", 'Hinting "'..center_back.name..'"...', "INFO", {1, 0, 1}
								end
							else
								return "Hovering over an invalid item.", "ERROR"
							end
						end
						return "Hovering over an invalid item.", "ERROR"
					end
				else
					return "Can't hint modded items.", "ERROR"
				end
			-- Attempt to hint rawArgs if no hovered items.
			elseif rawArgs and string.len(rawArgs) > 3 then
				G.APClient:Say("!hint "..rawArgs)
				return 'Hinting "'..rawArgs..'"... (Keep in mind, typed item names are not checked for validity!)', "INFO", {1, 0, 1}
			end
			return "No item to hint.", "ERROR"
		end
	})
	
	debugplus.addCommand({
		name = "ap",
		shortDesc = "Send a message to the Archipelago server.",
		desc = 'Send a message to the Archipelago server. Can be used to execute commands: "ap !hint Joker"',
		exec = function (args, rawArgs, dp)
			if not G.APClient then return "You have to be connected to Archipelago for this command.", "ERROR" end
			
			if rawArgs and string.len(rawArgs) > 0 then
				G.APClient:Say(rawArgs)
				return "Message sent!", "INFO", {1, 0, 1}
			end
			
			return "Can't send blank message.", "ERROR"
		end
	})
end

--G.APClient:Say("!hint "..dp.hovered.config.center.name)
--G.APClient:Say("!send "..G.AP.APSlot.." "..dp.hovered.config.center.name)