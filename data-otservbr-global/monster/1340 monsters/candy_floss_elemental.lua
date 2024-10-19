local mType = Game.createMonsterType("Candy Floss Elemental")
local monster = {}

monster.description = "a candy floss elemental"
monster.experience = 24740
monster.outfit = {
	lookType = 1749,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2533
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Dessert Dungeons.",
}

monster.health = 16100
monster.maxHealth = 16100
monster.race = "blood"
monster.corpse = 48346
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
	targetDistance = 4,
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
	{ text = "Come into my fluffy embrace!", yell = false },
	{ text = "Want fairy floss? I will feed you up.", yell = false },
	{ text = "Did you have to come here, little one? I just wanted to lay around and take it easy.", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "crystal coin", chance = 100000, maxCount = 5 },
	{ name = "platinum coin", chance = 100000, maxCount = 45 },
	{ name = "energy bar", chance = 5000, maxCount = 6 },
	{ name = "opal", chance = 5000, maxCount = 2 },
	{ name = "milk chocolate coin", chance = 5000, maxCount = 4 },
	{ name = "fairy wings", chance = 5000, maxCount = 4 },
	{ name = "gummy rotworm", chance = 5000, maxCount = 4 },
	{ name = "wad of fairy floss", chance = 5000, maxCount = 4 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1200 },
	-- bleed
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -650, maxDamage = -1005, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -1050, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1250, range = 7, shootEffect = CONST_ANI_HUNTINGSPEAR, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 38,
	armor = 74,
	mitigation = 2.31,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
