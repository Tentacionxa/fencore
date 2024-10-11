local mType = Game.createMonsterType("Griish Warrior")
local monster = {}

monster.description = "a griish warrior"
monster.experience = 65000
monster.outfit = {
	lookType = 701,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2591
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

monster.health = 55000
monster.maxHealth = 55000
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
	{ text = "I do what I do because it is the right thing to do", yell = false },
	{ text = "To achieve the mood of a warrior is not a simple matter.", yell = false },
	{ text = "Resilience is, of course, necessary for a warrior!", yell = false },
	{ text = "There are no contests in the Art of Peace!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 5489, maxCount = 1 },
	{ name = "ultimate health potion", chance = 6910, maxCount = 1 },
	{ name = "epee", chance = 11948, maxCount = 1 },
	{ name = "green gem", chance = 12934, maxCount = 1 },
	{ name = "violet gem", chance = 7273, maxCount = 1 },
	{ name = "crystal mace", chance = 12437, maxCount = 1 },
	{ name = "glacier amulet", chance = 8960, maxCount = 1 },
	{ name = "jade hammer", chance = 6508, maxCount = 1 },
	{ name = "giant sword", chance = 9714, maxCount = 1 },
	{ name = "crown shield", chance = 8795, maxCount = 1 },
	{ name = "stone skin amulet", chance = 7203, maxCount = 1 },
	{ id = 46314, chance = 1130, maxCount = 2 },
	{ name = "fera bag", chance = 15, maxCount = 1  },
	{ id = 46316, chance = 100000, maxCount = 1 },
	{ id = 46292, chance = 100, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -1501 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -1100, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -2500, range = 7, radius = 3, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -1500, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}
monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -45 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -45 },
	{ type = COMBAT_EARTHDAMAGE, percent = -45 },
	{ type = COMBAT_FIREDAMAGE, percent = -45 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -45 },
	{ type = COMBAT_HOLYDAMAGE, percent = -55 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("scout4", CreatureIconCategory_Quests, CreatureIconQuests_Energy, 45)
	monster:setIcon("scout5", CreatureIconCategory_Quests, CreatureIconQuests_Earth, 45)
	monster:setIcon("scout1", CreatureIconCategory_Quests, CreatureIconQuests_Ice, 45)
	monster:setIcon("scout2", CreatureIconCategory_Quests, CreatureIconQuests_Fire, 45)
	monster:setIcon("scout3", CreatureIconCategory_Quests, CreatureIconQuests_RedBall, 30)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
