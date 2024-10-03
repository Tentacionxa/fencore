local forge = Action()

function forge.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getFreeCapacity() <= 200 then  -- Checks your characters capacity
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You do not have enough capacity to use the Forge! Make sure you have a minimum of 200 Capacity before using the Forge!')
        return false
		else
	player:openForge()
	return true
end
end
forge:id(37122, 37128, 37129, 37131, 37132, 37133, 37153, 37157)
forge:register()
