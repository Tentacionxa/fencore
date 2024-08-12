local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(37543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(3587, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found an banana you CHEST stealing THIEF!.")
	player:setStorageValue(37543, 1)
	return true
end

chest:aid(45672)
chest:register()
