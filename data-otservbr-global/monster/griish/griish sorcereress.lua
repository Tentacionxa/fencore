local mType = Game.createMonsterType("Griish Sorcereress")
local monster = {}

monster.description = "a griish sorcereress"
monster.experience = 105000
monster.outfit = {
	lookType = 169,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2590
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
	{ text = "ZZZZZZZION!", yell = false },
	{ text = "Behold!", yell = false },
	{ text = "Release the jewels!", yell = false },
	{ text = "You've entered the wrong portal!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 79040 },
	{ name = "great mana potion", chance = 62450, maxCount = 3 },
	-- {name = "giant shimmering pearl", chance = 10040}, -- unknown item: giant shimmering pearl
	{ name = "blue gem", chance = 5240 },
	{ id = 23533, chance = 4370 }, -- ring of red plasma
	{ name = "wand of voodoo", chance = 4370 },
	{ id = 23531, chance = 3490 }, -- ring of green plasma
	{ id = 23529, chance = 3060 }, -- ring of blue plasma
	{ name = "violet gem", chance = 2620 },
	{ name = "glacier amulet", chance = 2620 },
	{ name = "wand of everblazing", chance = 2180 },
	{ name = "wand of defiance", chance = 1750 },
	{ name = "wand of starstorm", chance = 1310 },
	{ name = "stone skin amulet", chance = 1310 },
	{ name = "alloy legs", chance = 440 },
	{ name = "fera bag", chance = 30 },
	{ name = "ratmiral bag", chance = 30 },
	{ name = "red crystal coin", chance = 100000, maxCount = 1 },
	{ name = "green crystal coin", chance = 1130, maxCount = 2 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -1500 },
	{ name = "combat", interval = 2000, chance = 60, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1500, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 90, type = COMBAT_DEATHDAMAGE, minDamage = -1100, maxDamage = -1600, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1400, range = 7, length = 3, spread = 0, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 1000, chance = 22, type = COMBAT_ENERGYDAMAGE, minDamage = -900, maxDamage = -1400, range = 7, length = 6, spread = 0, effect = CONST_ME_PINK_ENERGY_SPARK, target = false },
}
monster.defenses = {
	defense = 60,
	armor = 62,
	mitigation = 1.7,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -40 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = -35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("scout1", CreatureIconCategory_Quests, CreatureIconQuests_Energy, 40)
	monster:setIcon("scout2", CreatureIconCategory_Quests, CreatureIconQuests_Fire, 40)
	monster:setIcon("scout3", CreatureIconCategory_Quests, CreatureIconQuests_RedBall, 30)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)
