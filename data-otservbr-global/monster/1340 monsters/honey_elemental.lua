local mType = Game.createMonsterType("Honey Elemental")
local monster = {}

monster.description = "a honey elemental"
monster.experience = 12740
monster.outfit = {
	lookType = 1733,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2551
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 1000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Chocolate Mines.",
}

monster.health = 13100
monster.maxHealth = 13100
monster.race = "blood"
monster.corpse = 48113
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
	{ text = "*Squelch*", yell = false },
	{ text = "*Slurp*", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "crystal coin", chance = 100000, maxCount = 5 },
	{ name = "platinum coin", chance = 100000, maxCount = 41 },
	{ name = "strong health potion", chance = 5000, maxCount = 1 },
	{ name = "honeycomb", chance = 5000, maxCount = 2 },
	{ name = "beijinho", chance = 5000, maxCount = 4 },
	{ name = "terra amulet", chance = 5000, maxCount = 4 },
	{ name = "magma boots", chance = 5000, maxCount = 3 },
	{ name = "magma legs", chance = 5000, maxCount = 4 },
	{ name = "small emerald", chance = 5000, maxCount = 5 },
	{ name = "dark chocolate coin", chance = 5000, maxCount = 4 },
	{ name = "fire sword", chance = 5000, maxCount = 3 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -1500 },
	-- bleed

}

monster.defenses = {
	defense = 38,
	armor = 74,
	mitigation = 2.31,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
