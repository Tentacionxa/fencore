local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(37543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(14758, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found an experience scroll.")
	player:setStorageValue(37543, 1)
	return true
end

chest:aid(45672)
chest:register()
