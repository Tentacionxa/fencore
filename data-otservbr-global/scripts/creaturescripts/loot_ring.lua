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
    local vocation = player:getVocation()
    local capGain = vocation:getCapacityGain()

    return (level - 8) * capGain + 470
end

local lootRingPlayerOnLogin = CreatureEvent("lootRingPlayerOnLogin")
function lootRingPlayerOnLogin.onLogin(player)
    if not player then return false end
    local ringItem = player:getSlotItem(CONST_SLOT_RING)

    local tmpConfig
    if ringItem then
        tmpConfig = config[ringItem:getId()]
    end

    local bonus = 1 + (tmpConfig and tmpConfig.bonusCap / 100 or 0)

    player:setCapacity(getBaseCapForPlayer(player) * bonus)
    return true
end
--lootRingPlayerOnLogin:register()

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
--moveEventEquip:register()

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
--moveEventDeEquip:register()
