local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(21543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dragon body is empty.")
		return true
	end

	player:addItem(3430, 1)
    player:addItem(3374, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a cooper shield and legion helmet.")
	player:setStorageValue(21543, 1)
	return true
end

chest:uid(64122)
chest:register()
