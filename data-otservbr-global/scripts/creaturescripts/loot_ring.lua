local BONUS_STORAGE_KEY = 59321

-- Configuration for items that have temporary effects when equipped
local config = {
    [18935] = {
        equipEffect = 23,
        deEquipEffect = 24,
        bonusCap = 65 --%
    },
}

local function getBaseCapForPlayer(player)
    if not player then return end
    local level = player:getLevel()
    logger.trace("LOOT RING: PLAYER LEVEL: {}", level)
    local vocation = player:getVocation()
    logger.trace("LOOT RING: PLAYER VOCATION: {}", vocation)
    local capGain = vocation:getCapacityGain()
    logger.trace("LOOT RING: PLAYER CAP GAIN: {}", capGain)

    local baseCap = (math.max(8, level) - 8) * capGain + 47000
    logger.trace("LOOT RING: BASE CAP: {}", baseCap)
    
    return baseCap
end

local lootRingPlayerOnLogin = CreatureEvent("lootRingPlayerOnLogin")
function lootRingPlayerOnLogin.onLogin(player)
    if not player then return false end

    logger.trace("Player: {} has logged in, calculating his cap", player:getName())
    local ringItem = player:getSlotItem(CONST_SLOT_RING)

    local tmpConfig
    if ringItem then
        tmpConfig = config[ringItem:getId()]
    end

    local bonus = 1 + (tmpConfig and tmpConfig.bonusCap / 100 or 0)

    logger.trace("Player bonus: {}", bonus)

    local newCap = getBaseCapForPlayer(player) * bonus

    logger.trace("LOOT RING: NEW CAP: {}", newCap)

    player:setCapacity(newCap)
    return true
end
lootRingPlayerOnLogin:register()

local moveEventEquip = MoveEvent()
moveEventEquip:type("equip")
moveEventEquip.onEquip = function(player, item, slot, isCheck)
    local tmpConfig = config[item:getId()]
    local bonus = 1 + tmpConfig.bonusCap / 100
    player:setCapacity(getBaseCapForPlayer(player) * bonus)

    player:getPosition():sendMagicEffect(tmpConfig.equipEffect)
    return true
end
for itemId, itemConfig in pairs(config) do
    moveEventEquip:id(itemId)  -- Assigning the item ID
end
moveEventEquip:register()

local moveEventDeEquip = MoveEvent()
moveEventDeEquip:type("deEquip")
moveEventDeEquip.onDeEquip = function(player, item, slot, isCheck)
    player:setCapacity(getBaseCapForPlayer(player))

    local tmpConfig = config[item:getId()]
    player:getPosition():sendMagicEffect(tmpConfig.deEquipEffect)
    return true
end
for itemId, itemConfig in pairs(config) do
    moveEventDeEquip:id(itemId)  -- Assigning the item ID
end
moveEventDeEquip:register()
