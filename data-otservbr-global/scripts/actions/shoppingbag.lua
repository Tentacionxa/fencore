local emptybps = Action()
local exhaustStorage = 54321 -- Unique storage ID for this action
local exhaustTime = 10 -- 10 seconds exhaust

function emptybps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check if the player is exhausted for this action
    if player:getExhaustion(exhaustStorage) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this action again.")
        return false
    end

    local toRemove = {}
    local removed = false

    -- Loop through items in the player's main backpack
    for _, itemZ in ipairs(player:getSlotItem(CONST_SLOT_BACKPACK):getItems(true)) do
        if itemZ:getId() == ITEM_SHOPPING_BAG and itemZ:getEmptySlots() == 20 then
            toRemove[itemZ] = itemZ
        end
    end

    -- Remove empty shopping bags if found
    for k, v in pairs(toRemove) do
        v:remove()
        removed = true
    end

    -- Send appropriate message to the player
    if removed then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You cleaned your empty main shopping bags.')
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have no shopping bags in your main backpack.')
    end

    -- Set the exhaust for 10 seconds
    player:setExhaustion(exhaustStorage, exhaustTime)

    return true
end

emptybps:uid(26914, 26915, 26916, 26917)
emptybps:register()
