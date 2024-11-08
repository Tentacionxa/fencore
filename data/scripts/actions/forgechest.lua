chestId = 46095

local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local items = {37109, 37110}  -- Item IDs for Sliver and Exalted Core
    local randomItemId = items[math.random(1, #items)]
    local randomAmount = math.random(1, 10)  -- Random amount between 1 and 10

    player:addItem(randomItemId, randomAmount)
    item:remove(1)

    local itemName = (randomItemId == 37109) and "Sliver" or "Exalted Core"
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received " .. randomAmount .. " " .. itemName .. "(s) from the chest.")
    return true
end

chest:id(chestId)
chest:register()
