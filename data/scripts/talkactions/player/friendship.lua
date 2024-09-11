local sleepRepair = TalkAction("!friend")
local config = {
	wormSoftId = 9802,
	newSoftId = 9803,
	value = 300000,
}

function friendRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged Your Friendship Amulet successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a Friendship Amulet!")
	end
	return false
end
friendRepair:groupType("normal")
friendRepair:register()

