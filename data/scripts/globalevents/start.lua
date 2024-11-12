local config = {
	{category = "Sword", name = "Magic Sword", itemId = 3288},
	{category = "Axe", name = "Stonecutter Axe", itemId = 3319},
	{category = "Club", name = "Hammer of Prophecy", itemId = 3349},
	{category = "Distance", name = "Hive Bow", itemId = 14246},
	{category = "Distance", name = "Crude Umbral Crossbow", itemId = 20085},
	{category = "Distance", name = "Wand of Defiance", itemId = 16096},
	{category = "Distance", name = "Dream Blossom Staff", itemId = 25700}
}

local exercise_reward_modal = TalkAction("!start")
local storageKey = 654321 -- Change to a unique storage key for this system

function exercise_reward_modal.onSay(player, words, param)
	if player:getStorageValue(storageKey) > 0 then
		player:sendCancelMessage("You have already chosen your reward and cannot select another.")
		return false
	end

	local window = ModalWindow {
		title = "Weapon Selection",
		message = 'Choose one weapon category: Sword, Axe, Club, or Distance. You can only select one item and this is a one-time selection.'
	}

	for i, info in ipairs(config) do
		window:addChoice(string.format("%s (%s)", info.name, info.category), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end

			local selectedItem = info
			if not selectedItem then
				player:sendCancelMessage("Invalid selection.")
				return false
			end

			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(selectedItem.itemId, 1)
				if item then
					player:setStorageValue(storageKey, 1) -- Set storage to mark the selection
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you just received a [".. selectedItem.name .."]. This is your only selection.")
				else
					player:sendCancelMessage("Could not add the item. Please check your inventory capacity.")
					return true
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to have capacity and empty slots to receive.")
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
