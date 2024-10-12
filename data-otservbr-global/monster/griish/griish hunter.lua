local mType = Game.createMonsterType("Griish Hunter")
local monster = {}

monster.description = "a griish hunter"
monster.experience = 70000
monster.outfit = {
	lookType = 700,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2588
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 2500,
	SecondUnlock = 5000,
	CharmsPoints = 500,
	Stars = 5,
	Occurrence = 0,
	Locations = "Griish World",
}

monster.health = 60000
monster.maxHealth = 60000
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
	{ text = "Taste my arrow!", yell = false },
	{ text = "Look at my bow.", yell = false },
	{ text = "DIE!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 12880, maxCount = 1 },
	{ name = "warrior helmet", chance = 8701, maxCount = 1 },
	{ name = "great spirit potion", chance = 7870, maxCount = 1 },
	{ name = "green gem", chance = 8590, maxCount = 1 },
	{ name = "violet gem", chance = 9444, maxCount = 1 },
	{ name = "blue gem", chance = 11964, maxCount = 1 },
	{ name = "glacier mask", chance = 14910, maxCount = 1 },
	{ name = "glacier amulet", chance = 8810, maxCount = 1 },
	{ name = "skull helmet", chance = 13047, maxCount = 1 },
	{ name = "wood cape", chance = 9153, maxCount = 1 },
	{ id = 23529, chance = 9172, maxCount = 1 }, -- ring of blue plasma
	{ id = 23542, chance = 12966, maxCount = 1 }, -- collar of blue plasma
	{ id = 46314, chance = 1130, maxCount = 2 },
	{ name = "stone skin amulet", chance = 11779, maxCount = 1 },
	{ name = "composite hornbow", chance = 5682, maxCount = 1 },
	{ name = "fera bag", chance = 15 , maxCount = 1 },
	{ id = 46294, chance = 100, maxCount = 1 },
	{ id = 46316, chance = 100000, maxCount = 1 },
	{ name = "crystal arcane nectar", chance = 15, maxCount = 1  },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1200, maxDamage = 1500 },
	{ name = "combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -1300, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_ENCHANTEDSPEAR, effect = CONST_ME_HITAREA, target = false },
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_HOLYDAMAGE, minDamage = -1200, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true}
}

monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -45 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -45 },
	{ type = COMBAT_FIREDAMAGE, percent = -45 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -40 },
	{ type = COMBAT_HOLYDAMAGE, percent = -40 },
	{ type = COMBAT_DEATHDAMAGE, percent = -25 },
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
