local mType = Game.createMonsterType("Sugar Daddy")
local monster = {}

monster.description = "a sugar daddy"
monster.experience = 29740
monster.outfit = {
	lookType = 1764,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2562
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Chocolate Mines.",
}

monster.health = 24100
monster.maxHealth = 24100
monster.race = "blood"
monster.corpse = 48417
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
	{ text = "SUGAR!!!", yell = false },
	{ text = "Sweet vengeance!", yell = false },
	{ text = "Let me have a bite!", yell = false },
	{ text = "YOU HAVE BAD BREATH, TAKE A MINT!!!", yell = false },
	{ text = "I LOOOOOOOOOVE CHOCOLATE TRUFFLES!!!", yell = false },
	{ text = "Yummy!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "platinum coin", chance = 100000, maxCount = 7 },
	{ name = "cookie", chance = 5000, maxCount = 2 },
	{ name = "energy bar", chance = 5000, maxCount = 2 },
	{ name = "gummy rotworm", chance = 5000, maxCount = 2 },
	{ name = "dark chocolate coin", chance = 5000, maxCount = 2 },
	{ name = "brigadeiro", chance = 5000, maxCount = 1 },
	{ name = "pastry dragon", chance = 5000, maxCount = 1 },
	{ name = "cocoa grimoire", chance = 5000, maxCount = 1 },
	{ name = "lime tart", chance = 5000, maxCount = 1 },
	{ name = "churro heart", chance = 5000, maxCount = 1 },
	{ name = "ring of temptation", chance = 5000, maxCount = 1 },
	{ name = "candy necklace", chance = 5000, maxCount = 1 },
	{ name = "peppermint backpack", chance = 5000, maxCount = 1 },
	{ name = "creamy grimoire", chance = 5000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -1500 },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 10, minDamage = -800, maxDamage = -1500, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -800, maxDamage = -1500, length = 5, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1500, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -100, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -700, maxDamage = -1500, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 38,
	armor = 74,
	mitigation = 2.31,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = -50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)