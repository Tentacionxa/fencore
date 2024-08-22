local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(39523) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(943, 20)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found 20x holy soil.")
	player:setStorageValue(39523, 1)
	return true
end

chest:uid(45732)
chest:register()
