dream2Id = 20275

local dream2 = Action()

function dream2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addOutfit(578)
    player:addOutfit(577)
	player:addOutfitAddon(578,2)
    player:addOutfitAddon(577,2)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received Dream Warden outfit and 2nd addon.")
	return true
end

dream2:id(dream2Id)
dream2:register()