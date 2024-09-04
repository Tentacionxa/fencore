Decaying2Id = 43900

local Decaying2 = Action()

function Decaying2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    player:addOutfitAddon(1663, 2)
    player:addOutfitAddon(1662, 2)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Decaying Defender Addon.")
	return true
end

Decaying2:id(Decaying2Id)
Decaying2:register()
