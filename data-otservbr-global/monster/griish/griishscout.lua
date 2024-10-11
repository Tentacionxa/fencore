local mType = Game.createMonsterType("Griish Scout")
local monster = {}

monster.description = "a griish scout"
monster.experience = 105000
monster.outfit = {
	lookType = 176,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2598
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
	{ text = "Griiiishia!", yell = false },
	{ text = "I might show You some stuff!", yell = false },
	{ text = "Lets feed you with my arrows!", yell = false },
	{ text = "Pa pa pa, arrow queen!", yell = false },
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
	{ name = "stone skin amulet", chance = 11779, maxCount = 1 },
	{ name = "composite hornbow", chance = 5682, maxCount = 1 },
	{ name = "tenebris bag", chance = 50 , maxCount = 1 },
	{ name = "lion bag", chance = 50 , maxCount = 1 },
	{ name = "candy-coated quiver", chance = 10 , maxCount = 1 },
	{ name = "jungle quiver", chance = 10 , maxCount = 1 },
	{ name = "red crystal coin", chance = 100000, maxCount = 1 },
	{ name = "green crystal coin", chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1200, maxDamage = 1500 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -1300, maxDamage = -1550, radius = 6, effect = CONST_ME_HOLYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -1300, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
{name ="combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -1200, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true}
}

monster.defenses = {
	defense = 60,
	armor = 72,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -60 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -40 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("scout1", CreatureIconCategory_Quests, CreatureIconQuests_WhiteCross, 40)
	monster:setIcon("scout2", CreatureIconCategory_Quests, CreatureIconQuests_RedBall, 30)
	monster:setIcon("scout3", CreatureIconCategory_Quests, CreatureIconQuests_YellowShield, 40)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
