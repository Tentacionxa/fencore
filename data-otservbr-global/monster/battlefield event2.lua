local mType = Game.createMonsterType("Battlefield Eveent")
local monster = {}

monster.description = "Battlefield Eveent"
monster.experience = 500
monster.outfit = {
	lookType = 134,
	lookHead = 94,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "undead"
monster.corpse = 8961
monster.speed = 180
monster.manaCost = 0
monster.maxSummons = 0

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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Mst.... klll....", yell = false},
	{text = "Whrrrr... ssss.... mmm.... grrrrl", yell = false},
	{text = "Dnnnt... cmmm... clsrrr....", yell = false},
	{text = "Httt.... hmnnsss...", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -999, maxDamage = -9999},
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 50},
	{type = COMBAT_MANADRAIN, percent = 50},
	{type = COMBAT_DROWNDAMAGE, percent = 50},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
