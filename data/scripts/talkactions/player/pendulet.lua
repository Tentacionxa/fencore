local penduletRepair = TalkAction("!pendulet")
local config = {
	wormSoftId = 29429,
	newSoftId = 30344,
	value = 45000,
}

function penduletRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new soft boots
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged the Enchanted Pendulet Amulet successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a used Pendulet Amulet!")
	end
	return false
end
penduletRepair:groupType("normal")
penduletRepair:register()