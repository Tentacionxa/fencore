local mType = Game.createMonsterType("Darklight Emitter")
local monster = {}

monster.description = "a Darklight Emitter"
monster.experience = 20600
monster.outfit = {
	lookType = 1627,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2382
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

monster.health = 27500
monster.maxHealth = 27500
monster.race = "undead"
monster.corpse = 43583
monster.speed = 210
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
	{ text = "*Rrrzp!*", yell = false },

}

monster.loot = {
	{name = "crystal coin", chance = 70540, maxCount = 9},
	{name = "tainted heart", chance = 500, maxCount = 1},
	{name = "darklight heart", chance = 700, maxCount = 1},
	{name = "small topaz", chance = 32220, maxCount = 2},
	{name = "platinum coin", chance = 82220, maxCount = 9},
	{name = "great spirit potion", chance = 32220, maxCount = 7},
	{name = "blue gem", chance = 54560},
	{name = "basalt crumbs", chance = 74560},
	{name = "darklight core", chance = 21920},
	{name = "amber staff", chance = 4000},
	{name = "darklight obsidian axe", chance = 2920},
	{name = "zaoan armor", chance = 1920},
	{name = "yellow gem", chance = 14500},

}

monster.attacks = {
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -850, maxDamage = -1800, range = 7, radius = 3, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1100, maxDamage = -1950, length = 6, spread = 4, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -750, maxDamage = -1800, radius = 3, effect = CONST_ME_ICETORNADO, target = false},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -650, maxDamage = -1600, range = 7, radius = 4, effect = CONST_ME_ICEATTACK, target = true}
}

monster.defenses = {
	defense = 100,
	armor = 120
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 5},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
