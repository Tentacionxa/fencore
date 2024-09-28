local config = {
	{name = "durable exercise sword", itemId = 35279, charges = 10000},
	{name = "durable exercise axe", itemId = 35280, charges = 10000},
	{name = "durable exercise club", itemId = 35281, charges = 10000},
	{name = "durable exercise shield", itemId = 44066, charges = 10000},
	{name = "durable exercise bow", itemId = 35282, charges = 10000},
	{name = "durable exercise rod", itemId = 35283, charges = 10000},
	{name = "durable exercise wand", itemId = 35284, charges = 10000}
}

local cooldown ={
	waitTime =  15 * 60 * 60
}

local exercise_reward_modal = TalkAction("!rewards")
function exercise_reward_modal.onSay(player, words, param)
	local window = ModalWindow {
		title = "Exercise Reward",
		message = 'Choose a item'
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end

            if player:getStorageValue(653215) >= os.time() then
                player:sendCancelMessage("You already collected your daily reward. Please wait 15 hours")
           return false
            end
			
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(info.itemId, info.charges)
				if item then
					item:setActionId(IMMOVABLE_ACTION_ID)
                    player:setStorageValue(653215, os.time() + 3 * 60 * 60)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Congratulations, you just received a [".. info.name .."].")
				end
			else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You need to have capacity and empty slots to receive.")
				return true
			end
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return false
end
exercise_reward_modal:separator(" ")
exercise_reward_modal:groupType("normal")
exercise_reward_modal:register()
