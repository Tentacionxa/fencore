local BONUS_STORAGE_KEY = 65785

-- Configuration for items that have temporary effects when equipped
local config = {
    [18935] = {
        slot = "ring",
        equipEffect = 23,
        deEquipEffect = 24,
    },
}

-- Function to manage capacity bonus
function manageCapacityBonus(player, item, apply)
    if not item then return end  -- Ensure item is valid, adjust logic as needed for logout and death
    local itemId = item:getId()
    local itemConfig = config[itemId]
    if not itemConfig then return end

    local currentBonus = player:getStorageValue(BONUS_STORAGE_KEY)
    local currentCapacity = player:getCapacity()
    local bonusCapacity = math.floor(currentCapacity * 0.30)  -- Calculate 10% of current capacity

    if apply and currentBonus == 0 then
        player:setCapacity(currentCapacity + bonusCapacity)
        player:setStorageValue(BONUS_STORAGE_KEY, bonusCapacity)  -- Mark the bonus as applied
        player:getPosition():sendMagicEffect(itemConfig.equipEffect)
    elseif not apply and currentBonus > 0 then
        player:setCapacity(currentCapacity - currentBonus)
        player:setStorageValue(BONUS_STORAGE_KEY, 0)  -- Reset the bonus mark
        player:getPosition():sendMagicEffect(itemConfig.deEquipEffect)
    end
end

-- Registering the event for equipping and unequipping items
for itemId, itemConfig in pairs(config) do
    local moveeventEquip = MoveEvent()
    moveeventEquip:type("equip")
    moveeventEquip:id(itemId)  -- Assigning the item ID
    moveeventEquip.onEquip = function(player, item, slot, isCheck)
        if not isCheck then
            manageCapacityBonus(player, item, true)
        end
        return true
    end
    moveeventEquip:register()

    local moveeventDeEquip = MoveEvent()
    moveeventDeEquip:type("deEquip")
    moveeventDeEquip:id(itemId)  -- Assigning the item ID
    moveeventDeEquip.onDeEquip = function(player, item, slot, isCheck)
        if not isCheck then
            manageCapacityBonus(player, item, false)
        end
        return true
    end
    moveeventDeEquip:register()
end

-- Login, Logout, and Death handlers
local loginEvent = CreatureEvent("LoginHandler")
loginEvent.onLogin = function(player)
    for itemId, itemConfig in pairs(config) do
        local item = player:getSlotItem(itemConfig.slot)
        if item and config[item:getId()] then
            manageCapacityBonus(player, item, true)
        end
    end
    return true
end
loginEvent:register()

local logoutEvent = CreatureEvent("LogoutHandler")
logoutEvent.onLogout = function(player)
    for itemId, itemConfig in pairs(config) do
        local item = player:getSlotItem(itemConfig.slot)
        if item then
            manageCapacityBonus(player, item, false)
        end
    end
    return true
end
logoutEvent:register()

local deathEvent = CreatureEvent("DeathHandler")
deathEvent.onDeath = function(player)
    for itemId, itemConfig in pairs(config) do
        local item = player:getSlotItem(itemConfig.slot)
        if item then
            manageCapacityBonus(player, item, false)
        end
    end
    return true
end
deathEvent:register()