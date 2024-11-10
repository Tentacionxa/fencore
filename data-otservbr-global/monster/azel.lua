local mType = Game.createMonsterType("Azel")
local monster = {}

monster.description = "Azel"
monster.experience = 3000000
monster.outfit = {
    lookType = 1820,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0,
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.race = "blood"
monster.corpse = 0
monster.speed = 1030
monster.manaCost = 0

-- Register the event
monster.events = {
    "TreasureChestOnDeath"
}

mType.onThink = function(monster, interval)
    -- Additional logic for thinking, if needed
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

monster.loot = {}

monster.attacks = {	
    { name = "melee", interval = 2000, chance = 100, minDamage = -9000, maxDamage = -15000 },
{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -9000, maxDamage = -11100, range = 7, radius = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },
{ name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -6000, maxDamage = -11000, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
{ name = "combat", interval = 2000, chance = 19, type = COMBAT_DEATHDAMAGE, minDamage = -6000, maxDamage = -11800, range = 7, radius = 6, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
{ name = "melee", interval = 1800, chance = 40, minDamage = -4000, maxDamage = -11000 },
{ name = "combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -4000, maxDamage = -10000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
{ name = "combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -4000, maxDamage = -13400, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
{ name = "combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -4000, maxDamage = -11480, range = 7, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false },

}

monster.defenses = {
    defense = 50,
    armor = 50
}

mType:register(monster)
