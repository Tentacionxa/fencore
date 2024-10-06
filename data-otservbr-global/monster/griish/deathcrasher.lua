local mType = Game.createMonsterType("Death Crusher")
local monster = {}

monster.description = "a death crusher"
monster.experience = 70000
monster.outfit = {
	lookType = 167,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2586

monster.health = 70000
monster.maxHealth = 70000
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
	{ text = "I will Crush your bones!!!", yell = false },
	{ text = "Death for everyone!!!!", yell = false },
	{ text = "LOOK AT MEEE!", yell = true },
	{ text = "Look me in the Eyes!!", yell = false },
}

monster.loot = {
	{ name = "small stone", chance = 1350 },
	{ name = "crystal coin", chance = 75000, maxCount = 4 },
	{ name = "rift bow", chance = 4000 },
	{ name = "diamond arrow", chance = 30710, maxCount = 12 },
	{ name = "spectral bolt", chance = 15400, maxCount = 4 },
	{ name = "giant shimmering pearl ", chance = 140 },
	{ id = 46314, chance = 1130, maxCount = 2 },
	{ name = "fera bag", chance = 15 },
	{ id = 46293, chance = 100, maxCount = 1 },
	{ id = 46316, chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1500 },
	{ name = "combat", interval = 2000, chance = 60, type = COMBAT_DEATHDAMAGE, minDamage = -1100, maxDamage = -1500, length = 8, spread = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 80, type = COMBAT_DEATHDAMAGE, minDamage = -1100, maxDamage = -1600, length = 8, spread = 3, effect = CONST_ME_STONES, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -3000, maxDamage = -3600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "speed", interval = 2000, chance = 35, speedChange = -800, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 30000 },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -1200, range = 7, length = 7, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_DEATHAMAGE, minDamage = -900, maxDamage = -1800, range = 7, length = 6, spread = 0, effect = CONST_ME_HITBYDEATH, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_DEATHAMAGE, minDamage = -1400, maxDamage = -2300, range = 7, radius = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_DEATHATTACK, target = true },
}

monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 45 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -35 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("scout1", CreatureIconCategory_Quests, CreatureIconQuests_Energy, 45)
	monster:setIcon("scout2", CreatureIconCategory_Quests, CreatureIconQuests_Fire, 45)
	monster:setIcon("scout3", CreatureIconCategory_Quests, CreatureIconQuests_RedBall, 30)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
