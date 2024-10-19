local mType = Game.createMonsterType("Griish Druid")
local monster = {}

monster.description = "a griish druid"
monster.experience = 155000
monster.outfit = {
	lookType = 164,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2593
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 5000,
	FirstUnlock = 2500,
	SecondUnlock = 3500,
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
	{ text = "I will show YOUUUUU", yell = false },
	{ text = "Dark and white powers...", yell = false },
	{ text = "Lets play with earth and ice!", yell = false },
	{ text = "Freeezing power!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 9846, maxCount = 5 },
	{ name = "terra rod", chance = 6003, maxCount = 1 },
	{ name = "great mana potion", chance = 11376, maxCount = 3 },
	{ name = "blue gem", chance = 10582, maxCount = 1 },
	{ name = "green gem", chance = 7730, maxCount = 1 },
	{ name = "stone skin amulet", chance = 7394, maxCount = 1 },
	{ name = "sacred tree amulet", chance = 11777, maxCount = 1 },
	{ name = "glacier amulet", chance = 10210, maxCount = 1 },
	{ name = "underworld rod", chance = 6477, maxCount = 1 },
	{ name = "springsprout rod", chance = 12363, maxCount = 1 },
	{ name = "platinum amulet", chance = 8615, maxCount = 1 },
	{ name = "glacier robe", chance = 7211, maxCount = 1 },
	{ name = "alba bag", chance = 50, maxCount = 3  },
	{ name = "brainstealer bag", chance = 50, maxCount = 3  },
	{ name = "green crystal coin", chance = 1130, maxCount = 2 },
	{ name = "red crystal coin", chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -850 },
	{ name = "combat", interval = 3000, chance = 31, type = COMBAT_ENERGYDAMAGE, minDamage = -1080, maxDamage = -1300, range = 7, radius = 6, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_BIGCLOUDS, target = true },
	{ name = "ice chain", interval = 9500, chance = 37, minDamage = -1100, maxDamage = -1300, range = 7 },
	{ name = "combat", interval = 4000, chance = 55, type = COMBAT_EARTHDAMAGE, minDamage = -1100, maxDamage = -1250, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_SMALLPLANTS, target = true },
	{ name = "combat", interval = 3000, chance = 23, type = COMBAT_ICEDAMAGE, minDamage = -1250, maxDamage = -1400, radius = 6, effect = CONST_ME_ICETORNADO, target = false },
}
monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = -30 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -50 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
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
