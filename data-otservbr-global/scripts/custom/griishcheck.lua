local itemConfig = {
    [46338] = {storage = 921001},  
    [46372] = {storage = 921002}, 
    [46367] = {storage = 921003}, 
    [46347] = {storage = 921004}, 
    [46351] = {storage = 921005}, 

    [46348] = {storage = 921006}, 
    [46357] = {storage = 921007}, 
    [46358] = {storage = 921008}, 

    [46363] = {storage = 921009}, 
    [46366] = {storage = 921010}, 
    [46377] = {storage = 921011},

    [46338] = {storage = 921012}, 
    [46352] = {storage = 921013}, 
    -- Example item ID with unique storage value
    -- Add more item IDs and their storage values as needed
}

-- Function to check the storage value and modify ActionId or move item to store inbox
local function checkStorageAndModifyActionId(player, item)
    if not item then
        return true  -- If the item doesn't exist, return
    end

    local config = itemConfig[item:getId()]  -- Get the item's configuration

    -- If the item is not in the config, allow it to be equipped/moved
    if not config then
        return true
    end

    local storageValue = player:getStorageValue(config.storage)

    -- If storage is 1, ensure ActionId is 0 (item should be usable)
    if storageValue == 1 then
        if item:getActionId() == 100 then
            item:setActionId(0)  -- Reset ActionId to 0
            player:say("Your Griish item is now active again.", TALKTYPE_MONSTER_SAY)
        end
        return true  -- Allow the item to be equipped or used
    end

    -- If storage is 0 or less, move to store inbox and set ActionId to 100
    if storageValue <= 0 then
        local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)  -- Use CONST_SLOT_STORE_INBOX
        if storeInbox then
            if item:moveTo(storeInbox) then
                item:setActionId(100)
                player:say("You have not proven to be a Griish Adept. Moved the items away...", TALKTYPE_MONSTER_SAY)
            else
                player:say("Failed to move item to store inbox.", TALKTYPE_MONSTER_SAY)
            end
        else
            -- Fallback: Drop the item at the player's feet if store inbox is not available
            item:moveTo(player:getPosition())
            item:setActionId(100)
            player:say("Item dropped because store inbox is not available.", TALKTYPE_MONSTER_SAY)
        end
        return false  -- Block the equip or movement action
    end

    return true  -- Allow the item to be equipped or moved
end

-- Custom function to check items in the backpack and move them to store inbox if storage conditions are met
local function checkBackpackItemsAndModify(player)
    local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)  -- Get player's backpack
    if backpack then
        local items = backpack:getItems()  -- Get all items in the backpack
        for _, item in pairs(items) do
            local config = itemConfig[item:getId()]
            if config then
                local storageValue = player:getStorageValue(config.storage)
                if storageValue <= 0 then
                    -- Move the item to the store inbox and set ActionId to 100
                    local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                    if storeInbox then
                        if item:moveTo(storeInbox) then
                            item:setActionId(100)
                            player:say("You have not proven to be a Griish Adept. Moved the items away...", TALKTYPE_MONSTER_SAY)
                        else
                            player:say("Failed to move item from your backpack to store inbox.", TALKTYPE_MONSTER_SAY)
                        end
                    else
                        item:moveTo(player:getPosition())
                        item:setActionId(100)
                        player:say("Item from your backpack has been dropped because store inbox is not available.", TALKTYPE_MONSTER_SAY)
                    end
                end
            end
        end
    end
end

-- Custom function to check items in the store inbox and reset ActionId if storage conditions are met
local function resetActionIdInInbox(player)
    local inbox = player:getStoreInbox()
    if inbox then
        local items = inbox:getItems()
        for _, item in pairs(items) do
            local config = itemConfig[item:getId()]
            if config then
                local storageValue = player:getStorageValue(config.storage)
                if storageValue == 1 and item:getActionId() == 100 then
                    -- Reset ActionId to 0 if storage value is 1
                    item:setActionId(0)
                    player:say("You have proven to be a Griish Adept. You can use Your Griish equipment.", TALKTYPE_MONSTER_SAY)
                end
            end
        end
    end
end

-- Event to handle login and adjust ActionId/move items if needed
local loginCheckEvent = CreatureEvent("loginCheck")

function loginCheckEvent.onLogin(player)
    -- Check the left-hand slot
    local leftHandItem = player:getSlotItem(CONST_SLOT_LEFT)
    if leftHandItem then
        checkStorageAndModifyActionId(player, leftHandItem)
    end

    -- Check the right-hand slot
    local rightHandItem = player:getSlotItem(CONST_SLOT_RIGHT)
    if rightHandItem then
        checkStorageAndModifyActionId(player, rightHandItem)
    end

    -- Check items in the player's backpack
    checkBackpackItemsAndModify(player)

    -- Call the custom reset function to reset ActionId of items in the store inbox
    resetActionIdInInbox(player)

    return true
end

loginCheckEvent:register()

-- Event to handle item movement and reset ActionId if necessary
local moveEvent = MoveEvent()

function moveEvent.onMoveItem(player, item, fromPosition, toPosition)
    -- Check if the item is being moved from the store inbox
    if fromPosition.slot == CONST_SLOT_STORE_INBOX then
        resetActionIdInInbox(player)  -- Ensure ActionId is updated before moving the item
    end

    return true  -- Allow the item to be moved
end

moveEvent:type("moveitem")
moveEvent:register()
