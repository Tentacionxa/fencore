local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 51520 then
		if player:getStorageValue(48152) <= 0 then
			player:setStorageValue(48152, 1)
			player:addItem(3318, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a knight axe.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
 elseif item.uid == 51521 then
        if player:getStorageValue(48151) <= 0 then
                        player:setStorageValue(48151, 1)
                        player:addItem(3370, 1)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a knight armor.")
                else
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
                end

    elseif item.uid == 51522 then
        if player:getStorageValue(48150) <= 0 then
			player:setStorageValue(48150, 1)
			player:addItem(3280, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a fire sword.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(51520,51521,51522)
inServiceYalaharReward:register()
