local mType = Game.createMonsterType("Gate Guard")
local monster = {}

monster.description = "Gate Guard"
monster.experience = 7000000
monster.outfit = {
	lookType = 1815,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000000
monster.maxHealth = 6000000
monster.race = "undead"
monster.corpse = 49318
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2610,
	bossRace = RARITY_ARCHFOE,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.events = {
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Cloudy Spirit", chance = 100, interval = 1000, count = 6 },
	},
}
monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Portal to Heaven?", yell = true },
	{ text = "Let me shut the gates...", yell = false },
	{ text = "SINS!...", yell = false },
	{ text = "Were you a good boy?", yell = true },
}

monster.loot = {
	{id = 47418, chance = 150, maxCount = 1}, 
	{id = 47419, chance = 50, maxCount = 1},
	{id = 47425, chance = 150, maxCount = 1},
	{id = 47426, chance = 50, maxCount = 1},
	{id = 47429, chance = 20, maxCount = 1},
	{id = 47435, chance = 25, maxCount = 1},
	{id = 47446, chance = 500, maxCount = 1},
	{id = 47458, chance = 175, maxCount = 1},
	{id = 47472, chance = 125, maxCount = 1},
	{id = 47485, chance = 200, maxCount = 1},
	{id = 47492, chance = 250, maxCount = 1},
	{id = 47499, chance = 450, maxCount = 1},
	{id = 47505, chance = 250, maxCount = 1},
	{id = 47510, chance = 500, maxCount = 1},
	{id = 47888, chance = 400, maxCount = 1},
	{id = 47514, chance = 100, maxCount = 1},
	{id = 47529, chance = 150, maxCount = 1},
	{id = 47537, chance = 400, maxCount = 1},
	{id = 47542, chance = 300, maxCount = 1},
	{id = 47769, chance = 200, maxCount = 1},
	{id = 49242, chance = 5, maxCount = 1},
	{id = 49287, chance = 1000, maxCount = 25},
	{id = 49283, chance = 1000, maxCount = 25},
	{id = 49286, chance = 1000, maxCount = 25},
	{id = 49285, chance = 1000, maxCount = 25},
	{id = 49284, chance = 1000, maxCount = 25},
	{id = 49283, chance = 1000, maxCount = 25},
	{id = 46095, chance = 1000, maxCount = 3},
	{id = 3043, chance = 1000000, maxCount = 2000},
	{id = 5879, chance = 1000000, maxCount = 250},
	{id = 5879, chance = 1000000, maxCount = 250},
	{id = 24390, chance = 1000000, maxCount = 250},
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10000, maxDamage = -20750},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -9000, maxDamage = -22000, radius = 4, effect = 2, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -9000, maxDamage = -23000, range = 4, radius = 4, effect = 12, target = true},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -9000, maxDamage = -24000, length = 10, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_LIFEDRAIN, minDamage = -9000, maxDamage = -21000, length = 10, spread = 3, effect = 34, target = false},
	{name ="speed", interval = 2000, chance = 50, speedChange = -600, radius = 7, effect = 24, target = false, duration = 20000},
}


monster.defenses = {
	defense = 105,
	armor = 105,
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = 236, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)