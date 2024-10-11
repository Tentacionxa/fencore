local mType = Game.createMonsterType("Griish Leader")
local monster = {}

monster.description = "a griish leader"
monster.experience = 155000
monster.outfit = {
	lookType = 171,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2595
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
	targetDistance = 2,
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
	{ text = "Have You met my wife?", yell = false },
	{ text = "Say hello to my little arrow!", yell = false },
	{ text = "I'll feed You. Don't worry", yell = false },
	{ text = "Welcome to my world.", yell = false },
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
	{ name = "tenebris bag", chance = 50, maxCount = 3  },
	{ name = "lion bag", chance = 50, maxCount = 3  },
	{ name = "alicorn quiver", chance = 10, maxCount = 1  },
	{ name = "naga quiver", chance = 10, maxCount = 1  },
	{ name = "red crystal coin", chance = 100000, maxCount = 1 },
	{ name = "green crystal coin", chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1300, maxDamage = 1700 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -1350, radius = 6, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 90, type = COMBAT_PHYSICALDAMAGE, minDamage = -900, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
{name ="combat", interval = 2000, chance = 50, type = COMBAT_HOLYDAMAGE, minDamage = -900, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
}

monster.defenses = {
	defense = 80,
	armor = 92,
	mitigation = 2.0,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -45 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -45 },
	{ type = COMBAT_DEATHDAMAGE, percent = -35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("scout1", CreatureIconCategory_Quests, CreatureIconQuests_WhiteCross, 45)
	monster:setIcon("scout2", CreatureIconCategory_Quests, CreatureIconQuests_RedBall, 30)
	monster:setIcon("scout3", CreatureIconCategory_Quests, CreatureIconQuests_YellowShield, 45)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
