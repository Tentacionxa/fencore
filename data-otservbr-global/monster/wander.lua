local mType = Game.createMonsterType("Wandering Pillar")
local monster = {}

monster.description = "a Wandering Pillar"
monster.experience = 23200
monster.outfit = {
	lookType = 1657,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 37000
monster.maxHealth = 37000
monster.race = "undead"
monster.corpse = 43828
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.raceId = 2395
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Sanctuary."
	}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 800,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	{ text = "POWERRR!!", yell = false },
	{ text = "DARKNESS. DEATH.", yell = false },
	{ text = "ENERGIES.", yell = false },
	{ text = "TREMMMBLE!", yell = false },
	{ text = "STONE, EARTH, LIGHT.", yell = false },
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 7},
	{name = "tainted heart", chance = 50, maxCount = 1},
	{name = "darklight heart", chance = 50, maxCount = 1},
	{name = "onyx chip", chance = 100000, maxCount = 2},
	{name = "sulphurous stone", chance = 6000},
	{name = "magma boots", chance = 7000},
	{name = "darklight obsidian axe", chance = 6000},
	{name = "dark helmet", chance = 9000},
	{name = "fire sword", chance = 9000},
	{name = "basalt crumbs", chance = 6000},
	{name = "darklight core", chance = 6000},
	{name = "magma coat", chance = 8000},
	{name = "basalt core", chance = 9000},
	}

monster.attacks = {
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -450, maxDamage = -800, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -450, maxDamage = -800, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SMALLPLANTS, target = true},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -400, maxDamage = -800, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true}
}

monster.defenses = {
	defense = 120,
	armor = 120
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 60},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
