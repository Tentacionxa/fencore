local mType = Game.createMonsterType("Sub Iceearth")
local monster = {}

monster.description = "a sub iceearth"
monster.experience = 0
monster.outfit = {
	lookType = 1596,
	lookHead = 57,
	lookBody = 96,
	lookLegs = 38,
	lookFeet = 105,
	lookAddons = 1,
	lookMount = 0,
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "blood"
monster.corpse = 0
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	{ text = "Mmmhaarrrgh!", yell = false },
}

monster.loot = {

}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -1750},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, range = 4, radius = 4, effect = 44, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, length = 10, spread = 3, effect = 43, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -2000, maxDamage = -3000, length = 10, spread = 3, effect = 42, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = 31, target = false, duration = 20000},
}

monster.defenses = {
	defense = 86,
	armor = 86,
	mitigation = 2.37,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -50},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)