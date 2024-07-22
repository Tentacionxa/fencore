local snowball = TalkAction("!snowball")
function snowball.onSay(player, words, param)
	logger.debug("handling snowball event")

	if not isInArena(player) then
		return false
	end

	if param == "shoot" then
		if player:getStorageValue(10107) > 1 then
			return true
		end

		if not SnowBall_Configurations.Ammo_Configurations.Ammo_Infinity then
			if player:getStorageValue(10108) > 0 then
				player:setStorageValue(10108, player:getStorageValue(10108) - 1)
				player:sendCancelMessage("Still left ".. player:getStorageValue(10108) .." snow balls.") --seems like any player can use !snowball not only the god so i should delete the group type as I added itxddddddddddddddddd
			else
				player:sendCancelMessage("You are without snow balls.")
				return true
			end
		end

		player:setStorageValue(10107, SnowBall_Configurations.Ammo_Configurations.Ammo_Exhaust)
		Event_sendSnowBall(player:getId(), player:getPosition(), SnowBall_Configurations.Ammo_Configurations.Ammo_Distance, player:getDirection())
		return false
	elseif param == "info" then
		local str = "     ## -> Player Infos <- ##\n\nPoints: ".. player:getStorageValue(10109) .."\nSnow balls: ".. player:getStorageValue(10108)

		str = str .. "\n\n          ## -> Ranking <- ##\n\n"
		for i = 1, 5 do
			if CACHE_GAMEPLAYERS[i] then
				str  = str .. i .. ". " .. Player(CACHE_GAMEPLAYERS[i]):getName() .."\n"
			end
		end
		for pos, players in ipairs(CACHE_GAMEPLAYERS) do
			if player:getId() == players then
				str = str .. "My Ranking Pos: " .. pos
			end
		end

		player:showTextDialog(2111, str)
		return false
	end
end

snowball:separator(" ")
snowball:groupType("normal")
snowball:register()

snowball = TalkAction("/snowball") --!SNOWBALL MAKES THE PLAYER PARTICIPATE... /SNOWBALL THE GOD CAN START THE EVENT
function snowball.onSay(player, words, param)
	START_SNOWBALL()
end
snowball:separator(" ")
snowball:groupType("god")
snowball:register()