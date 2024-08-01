local arcanomancerRepair = TalkAction("!arcanomancer")
local config = {
	wormSoftId = 39185,
	newSoftId = 39183,
	value = 75000,
}

function arcanomancerRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new spirithorn ring
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged the Charged Alicorn Ring successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a used Alicorn Ring!")
	end
	return false
end
arcanomancerRepair:groupType("normal")
arcanomancerRepair:register()
