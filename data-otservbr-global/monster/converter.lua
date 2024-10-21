local mType = Game.createMonsterType("Converter")
local monster = {}

monster.description = "a Converter"
monster.experience = 21425
monster.outfit = {
	lookType = 1623,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2379
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Sanctuary."
	}

monster.health = 29600
monster.maxHealth = 29600
monster.race = "undead"
monster.corpse = 43567
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	runHealth = 0,
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
	{ text = "ZZZZRRR!!", yell = false },
}

monster.loot = {
	{name = "crystal coin", chance = 90540, maxCount = 6},
	{name = "tainted heart", chance = 700, maxCount = 1},
	{name = "darklight heart", chance = 700, maxCount = 1},
	{name = "ultimate health potion", chance = 32220, maxCount = 5},
	{name = "darklight core", chance = 8500},
	{name = "darklight matter", chance = 5500},
	{name = "focus cape", chance = 6500},
	{name = "wand of starstorm", chance = 6500},
	{name = "blue gem", chance = 10500},
	{name = "white gem", chance = 9500},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -4000, maxDamage = -950},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -2900, range = 7, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -750, maxDamage = -1900, radius = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 22, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1800, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 24, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -1500, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -1650, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = false},
}

monster.defenses = {
	defense = 100,
	armor = 100
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 35},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
