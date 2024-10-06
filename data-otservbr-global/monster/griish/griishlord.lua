local mType = Game.createMonsterType("Griish Lord")
local monster = {}

monster.description = "a griish lord"
monster.experience = 155000
monster.outfit = {
	lookType = 178,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2596

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
	{ text = "Greetings Warrio.", yell = false },
	{ text = "Lets battle!", yell = false },
	{ text = "Die in peace.", yell = false },
	{ text = "Welcome, poor soul...", yell = false },
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
	{ name = "fera bag", chance = 15 },
	{ id = 46290, chance = 150, maxCount = 1 },
	{ id = 46316, chance = 100000, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1100, maxDamage = 1600 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1300, maxDamage = -1550, radius = 3, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -1250, radius = 5, effect = CONST_ME_DRAWBLOOD, target = false },
{ name = "melee", interval = 2000, chance = 100, minDamage = -1100, maxDamage = -1600 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -1200, maxDamage = -1700, range = 7, shootEffect = CONST_ANI_, target = false },
}

monster.defenses = {
	defense = 92,
	armor = 92,
	mitigation = 2.0,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -80 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = -30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	monster:setIcon("griishknight", CreatureIconCategory_Quests, CreatureIconQuests_WhiteCross, 80)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end

mType:register(monster)


