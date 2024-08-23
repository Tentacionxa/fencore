FerumbrasAscendantMysteriousId = 34072

local FerumbrasAscendantMysterious = Action()

function FerumbrasAscendantMysterious.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addMount(87)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You decipher something! You get a rift runner to accompany you on your journey.")
	return true
end

FerumbrasAscendantMysterious:id(FerumbrasAscendantMysteriousId)
FerumbrasAscendantMysterious:register()