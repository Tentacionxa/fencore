local mType = Game.createMonsterType("Treasure Chest")
local monster = {}

monster.description = "Treasure Chest"
monster.experience = 3000000
monster.outfit = {
    lookType = 1938,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0,
}

monster.health = 6000000
monster.maxHealth = 6000000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 530
monster.manaCost = 0

local teleportCoordinates = {
    {32338, 32215, 7},
    {32338, 32251, 7},
    {32424, 32255, 7},
    {32426, 32182, 7},
    {32369, 32183, 7},
    {32324, 32189, 7},
    {32337, 32216, 7}
}
local currentCoordinateIndex = 1
local healthLossThreshold = 1000000
local healthLossCounter = 0

-- Track the last health value for the monster
local function initializeHealthStorage(monster)
    if monster:getStorageValue("lastHealth") == -1 then
        monster:setStorageValue("lastHealth", monster:getHealth())
    end
end

mType.onThink = function(monster, interval)
    initializeHealthStorage(monster)
    
    local lastHealth = monster:getStorageValue("lastHealth")
    local currentHealth = monster:getHealth()
    
    if lastHealth > currentHealth then
        healthLossCounter = healthLossCounter + (lastHealth - currentHealth)
        monster:setStorageValue("lastHealth", currentHealth)

        if healthLossCounter >= healthLossThreshold then
            local pos = teleportCoordinates[currentCoordinateIndex]
            local teleportPosition = Position(pos[1], pos[2], pos[3])
            
            -- Send teleport effect
            monster:getPosition():sendMagicEffect(CONST_ME_TELEPORT) -- Effect at current position before teleport
            teleportPosition:sendMagicEffect(CONST_ME_TELEPORT) -- Effect at the new position
            
            monster:teleportTo(teleportPosition)
            currentCoordinateIndex = (currentCoordinateIndex % #teleportCoordinates) + 1 -- Cycle through coordinates
            healthLossCounter = 0 -- Reset the health loss counter
        end
    end
end

monster.changeTarget = {
    interval = 2000,
    chance = 10,
}



monster.strategiesTarget = {
    nearest = 70,
    health = 10,
    damage = 10,
    random = 10,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 70,
    targetDistance = 1,
    runHealth = 0,
    healthHidden = false,
    isBlockable = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = false,
    pet = false
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 5000,
    chance = 10,
}

monster.loot = {
    { id = 22107, chance = 1000000},
    { id = 3043, chance = 10000, maxCount = 1500},
    
}

monster.attacks = {}

monster.defenses = {
    defense = 0,
    armor = 0
}

mType:register(monster)
