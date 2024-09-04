local mType = Game.createMonsterType("Bulltaur Forgepriest")
local monster = {}

monster.description = "a bulltaur forgepriest"
monster.experience = 16000
monster.outfit = {
	lookType = 1719,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2449
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Bulltaur Lair.",
}

monster.health = 16000
monster.maxHealth = 16000
monster.race = "blood"
monster.corpse = 44712
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
	{ name = "platinum coin", chance = 10000, maxCount = 9 },
	{ name = "encrypted notes", chance = 7000, maxCount = 1 },
	{ name = "great health potion", chance = 1000, maxCount = 40 },
	{ name = "bulltaur horn", chance = 7000, maxCount = 1 },
	{ name = "gold ingot", chance = 7000, maxCount = 2 },
	{ name = "spellweaver's robe", chance = 5000, maxCount = 1 },
	{ name = "gold ring", chance = 5000, maxCount = 1 },
	{ name = "alloy legs", chance = 6000, maxCount = 1 },
	{ name = "blue gem", chance = 6000, maxCount = 2 },
	{ name = "bulltaur horn", chance = 7000, maxCount = 2 },
	{ name = "violet gem", chance = 6000, maxCount = 2 },
	{ name = "mino shield", chance = 4000, maxCount = 1 },
	{ name = "dragon hammer", chance = 4000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -900 },
	-- bleed
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -900, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -100, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -900, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "energy elemental electrify", interval = 2000, chance = 80, target = false },
}

monster.defenses = {
	defense = 38,
	armor = 78,
	mitigation = 2.22,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
