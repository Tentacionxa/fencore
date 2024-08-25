local mType = Game.createMonsterType("Sopping Corpus")
local monster = {}

monster.description = "a Sopping Corpus"
monster.experience = 48600
monster.outfit = {
	lookType = 1659,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 33400
monster.maxHealth = 33400
monster.race = "undead"
monster.corpse = 43836
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.raceId = 2397
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
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

}

monster.loot = {
	{name = "crystal coin", chance = 28000},
	{name = "ultimate health potion", chance = 46000, maxCount = 6},
    {name = "ultimate mana potion", chance = 46000, maxCount = 6},
	{name = "crystal crossbow", chance = 1500},
	{name = "underworld rod", chance = 2000},
	{name = "skullcracker armor", chance = 4000},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_ICEDAMAGE, minDamage = -450, maxDamage = -1000, range = 7, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_BIGCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_HOLYDAMAGE, minDamage = -550, maxDamage = -900, radius = 4, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -750, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -750, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -900, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 112,
	armor = 112
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 35},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)