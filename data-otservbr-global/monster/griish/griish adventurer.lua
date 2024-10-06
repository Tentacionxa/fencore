local mType = Game.createMonsterType("Griish Adventurer")
local monster = {}

monster.description = "a griish adventurer"
monster.experience = 60000
monster.outfit = {
	lookType = 703,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2587

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 4156
monster.speed = 110
monster.manaCost = 360

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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "The danger of adventure is worth a thousand days of ease and comfort.", yell = false },
	{ text = "The world is a book and those who do not travel read only one page.", yell = false },
	{ text = "Do not go where the path may lead", yell = false },
	{ text = "Travel makes one modest!", yell = true },
}

monster.loot = {
	{ name = "waterskin", chance = 1350 },
	{ name = "crystal coin", chance = 75000, maxCount = 10 },
	{ name = "rift bow", chance = 4000 },
	{ name = "crystal arrow", chance = 30710, maxCount = 12 },
	{ name = "ethernal spear", chance = 15400, maxCount = 4 },
	{ name = "sandals", chance = 1180 },
	{ name = "grapes", chance = 17750 }, 
	{ name = "elvish bow", chance = 140 },
	{ name = "elvish talisman", chance = 5200 },
	{ name = "elven scouting glass", chance = 9750 },
	{ id = 46314, chance = 1130, maxCount = 2 },
	{ name = "fera bag", chance = 15 },
	{ id = 46293, chance = 100, maxCount = 1 },
	{ id = 46316, chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1500 },
	{ name = "combat", interval = 2000, chance = 60, type = COMBAT_FIREDAMAGE, minDamage = -1100, maxDamage = -1500, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 90, type = COMBAT_PHYSICALDAMAGE, minDamage = -1100, maxDamage = -1600, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -800, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 30000 },
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1200, range = 7, length = 3, spread = 0, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1800, range = 7, length = 6, spread = 0, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -1400, maxDamage = -2300, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -45 },
	{ type = COMBAT_EARTHDAMAGE, percent = -45 },
	{ type = COMBAT_FIREDAMAGE, percent = -45 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -45 },
	{ type = COMBAT_HOLYDAMAGE, percent = -45 },
	{ type = COMBAT_DEATHDAMAGE, percent = -40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
