local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 43120 then
		if player:getStorageValue(73450) <= 0 then
			player:setStorageValue(73450, 1)
			player:addItem(40593, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a mutant bone boots.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 43121 then
			if player:getStorageValue(73455) <= 0 then
			player:setStorageValue(73455, 1)
			player:addItem(22757, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a shroud of despair.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

inServiceYalaharReward:uid(43120, 43121)
inServiceYalaharReward:register()
