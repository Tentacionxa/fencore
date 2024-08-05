PhantasmId = 34072

local Phantasm = Action()

function Phantasm.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addMount(167)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Phantasmal Jade mount.")
	return true
end

Phantasm:id(SpiritualId)
Phantasm:register()