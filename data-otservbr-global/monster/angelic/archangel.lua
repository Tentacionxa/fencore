local mType = Game.createMonsterType("Archangel")
local monster = {}

monster.description = "an archangel"
monster.experience = 500000
monster.outfit = {
	lookType = 1982,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2608
monster.Bestiary = {
    class = "Extra Dimensional",
    race = BESTY_RACE_EXTRA_DIMENSIONAL,
    toKill = 2500,
    FirstUnlock = 500,
    SecondUnlock = 1000,
    CharmsPoints = 500,
    Stars = 4,
    Occurrence = 0,
    Locations = "Heaven",
}


monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 49318
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "The smell of fear follows you.", yell = false },
	{ text = "Your soul will burn.", yell = false },
}

monster.loot = {
	{ id = 3043, chance = 60000, maxCount = 6 }, -- crystal coin
    { id = 49282, chance = 10},
	{ id = 46095, chance = 1500},
        { id = 49283, chance = 10},
        { id = 49284, chance = 10},
        { id = 49285, chance = 10},
        { id = 49286, chance = 10},
        { id = 49287, chance = 10},
        { id = 49288, chance = 10},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5000, maxDamage = -8000 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -8000, radius = 6, effect = 25 , target = false },
{ name = "melee", interval = 2000, chance = 0, minDamage = -5000, maxDamage = -8000 },
	{ name = "combat", interval = 2000, chance = 0, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -8000, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },

}

monster.defenses = {
	defense = 120,
	armor = 120,
	mitigation = 3.33,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -30 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
