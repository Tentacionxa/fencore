local mType = Game.createMonsterType("Teneshpar")
local monster = {}

monster.description = "Teneshpar"
monster.experience = 20000
monster.outfit = {
	lookType = 241,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 649,
	bossRace = RARITY_NEMESIS,
}

monster.health = 15000
monster.maxHealth = 15000
monster.corpse = 6343
monster.speed = 170
monster.manaCost = 0

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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 350,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 3,
	color = 203,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Phantasm Summon", chance = 20, interval = 2000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Oh my, you forgot to put your pants on!", yell = false },
	{ text = "Weeheeheeheehee!", yell = false },
	{ text = "Its nothing but a dream.", yell = false },
	{ text = "Dream a little dream with me!", yell = false },
	{ text = "Give in.", yell = false },
}

monster.loot = {
	{ id = 3034, chance = 15550 }, -- stealth ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -610, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -80, radius = 3, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "phantasm drown", interval = 2000, chance = 15, target = false },
	{ name = "drunk", interval = 2000, chance = 15, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.defenses = {
	defense = 0,
	armor = 80,
	mitigation = 1.10,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 228, maxDamage = 449, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = 500, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
	{ name = "invisible", interval = 2000, chance = 25, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}


mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)

