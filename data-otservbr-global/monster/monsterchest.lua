local mType = Game.createMonsterType("Monster Chest")
local monster = {}

monster.description = "Monster Chest"
monster.experience = 1000000
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
    { id = 14758, chance = 1000000},
    { id = 24390, chance = 10000, maxCount = 500},
    
}

monster.attacks = {}

monster.defenses = {
    defense = 0,
    armor = 0
}

mType:register(monster)
