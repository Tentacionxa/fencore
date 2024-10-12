local emptybps = Action()
local exhaustStorage = 12345 -- Unique storage ID for this action
local exhaustTime = 10 -- 10 seconds exhaust

function emptybps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check if the player is exhausted for this action
    if player:getExhaustion(exhaustStorage) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this action again.")
        return false
    end

    local toRemove = {}
    local removed = false

    -- Loop through items in the player's store inbox
    for _, itemZ in ipairs(player:getSlotItem(CONST_SLOT_STORE_INBOX):getItems(true)) do
        if itemZ:getId() == 37561 and itemZ:getEmptySlots() == 2 then
            toRemove[itemZ] = itemZ
        end
    end

    -- Remove forge chests if found
    for k, v in pairs(toRemove) do
        v:remove()
        removed = true
    end

    -- Send appropriate message to the player
    if removed then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You cleaned your store inbox.')
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have no forge chests in your store inbox.')
    end

    -- Set the exhaust for 10 seconds
    player:setExhaustion(exhaustStorage, exhaustTime)

    return true
end

emptybps:uid(26999, 36999)
emptybps:register()
