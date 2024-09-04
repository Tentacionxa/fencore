local mType = Game.createMonsterType("Bulltaur Brute")
local monster = {}

monster.description = "a bulltaur brute"
monster.experience = 13000
monster.outfit = {
	lookType = 1717,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 14000
monster.maxHealth = 10000
monster.race = "blood"
monster.corpse = 44709
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
	{ text = "It's hammer time!", yell = false },
	{ text = "I'll do some downsizing!", yell = false },
	{ text = "This will be a smash hit!!", yell = false },
}

monster.loot = {
	{ name = "platinum coin", chance = 100000, maxCount = 13 },
	{ name = "bulltaur hoof", chance = 7000, maxCount = 1 },
	{ name = "might ring", chance = 15000, maxCount = 2 },
	{ name = "gold nugget", chance = 8000, maxCount = 1 },
	{ name = "white gem", chance = 7000, maxCount = 2 },
	{ name = "small topaz", chance = 6000, maxCount = 3 },
	{ name = "bulltaur armor scrap", chance = 15000, maxCount = 1 },
	{ name = "dwarven ring", chance = 15000, maxCount = 2 },
	{ name = "blue gem", chance = 9000, maxCount = 2 },
	{ name = "bulltaur horn", chance = 7000, maxCount = 2 },
	{ name = "violet gem", chance = 5000, maxCount = 2 },
	{ name = "mino shield", chance = 5000, maxCount = 1 },
	{ name = "dragon hammer", chance = 5000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -800 },
	-- bleed
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -700, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -100, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -900, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 38,
	armor = 78,
	mitigation = 2.22,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
