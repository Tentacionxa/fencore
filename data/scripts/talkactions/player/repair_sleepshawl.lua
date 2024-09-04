local sleepRepair = TalkAction("!sleepshawl")
local config = {
	wormSoftId = 22516,
	newSoftId = 30342,
	value = 75000,
}

function sleepRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItemStoreInboxEx(Game.createItem(config.newSoftId, 1), 1, self)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged a soft boots successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have worn soft boots!")
	end
	return false
end
sleepRepair:groupType("normal")
sleepRepair:register()

