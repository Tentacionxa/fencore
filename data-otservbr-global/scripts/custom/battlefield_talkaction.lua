local battlefield = TalkAction("!battlefield")
function battlefield.onSay(player, words, param)
	if player:getGroup():getAccess() then
		if battlefield_totalPlayers() == 0 then
			eventsOutfit = {}
			battlefield_teleportCheck()
		else
			player:sendCancelMessage("Battlefield event is already running.")
		end
	end
	return false
end
battlefield:groupType("god")
battlefield:register()
