Phantasm2Id = 34074

local Phantasm2 = Action()

function Phantasm2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addMount(167)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Phantasmal Jade mount.")
	return true
end

Phantasm2:id(Phantasm2Id)
Phantasm2:register()