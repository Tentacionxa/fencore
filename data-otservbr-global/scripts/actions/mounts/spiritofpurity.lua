SpiritualId = 44048

local Spiritual = Action()

function Spiritual.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addMount(217)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Spirit of Purity mount.")
	return true
end

Spiritual:id(SpiritualId)
Spiritual:register()