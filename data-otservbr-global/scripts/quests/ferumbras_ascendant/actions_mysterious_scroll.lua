local ferumbrasAscendantMysterious = Action()
function ferumbrasAscendantMysterious.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		player:addMount(87)
		item:remove(1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You decipher something! You get a rift runner to accompany you on your journey.")
end

ferumbrasAscendantMysterious:id(22865)
ferumbrasAscendantMysterious:register()
