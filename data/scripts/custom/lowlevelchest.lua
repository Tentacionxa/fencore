local config = {
    exhaustTime = 20, -- Time to take another reward in hours
    exhaustStorage = 30061, -- Storage of chest
    level = 170, -- Minimum level to open the chest
    capacity = 100 -- Minimum capacity required to take a reward (Set to heaviest item's weight)
}

local rewards = {
    { id = 3043, name = "Crystal Coins", count = 50, text = "50" },
}
 
local dailyRewardChest = Action()
function dailyRewardChest.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player:isPlayer() then
        return false
    end
 
    if player:getStorageValue(config.exhaustStorage) > os.time() then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The chest is empty! You need to wait ' .. config.exhaustTime .. ' hours between rewards from this chest!')
        return true
    end
 
    local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)   -- Checks your backpack has room
    if not backpack or backpack:getEmptySlots(true) < 1 then
        player:sendTextMessage (MESSAGE_STATUS_WARNING, "You do not have any available space free in your backpack to receive your reward!")
        return false
    end
  
    if (player:getFreeCapacity() / 100) < (config.capacity) then  -- Checks your characters capacity
        player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You do not have enough capacity to take a reward! Make sure you have a minimum of ' .. config.capacity .. ' before taking the reward!')
        return false
    end

    local randId = math.random(1, #rewards)
    local rewardItem = rewards[randId]
    if player:getLevel() > (config.level) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need to be below level ' .. config.level ..' to claim this daily reward!') -- Checks character level
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    else player:addItemEx(Game.createItem(rewardItem.id, rewardItem.count), true, CONST_SLOT_WHEREEVER)
        player:setStorageValue(config.exhaustStorage, os.time() + config.exhaustTime * 60 * 60) -- Setting cooldown
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received ' .. rewardItem.text.. ' ' .. rewardItem.name .. '.')
    end
    return true
end

 
 
 dailyRewardChest:aid(52341)
 dailyRewardChest:register()