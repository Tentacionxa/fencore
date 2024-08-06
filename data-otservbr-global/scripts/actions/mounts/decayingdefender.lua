DecayingId = 43899

local Decaying = Action()

function Decaying.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    player:addOutfitAddon(1663, 1)
    player:addOutfitAddon(1662, 1)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Decaying Defender Addon.")
	return true
end

Phantasm:id(DecayingId)
Phantasm:register()