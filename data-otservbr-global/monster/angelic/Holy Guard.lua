local mType = Game.createMonsterType("Holy Guard")
local monster = {}

monster.description = "a holy guard"
monster.experience = 460000
monster.outfit = {
	lookType = 1925,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2610

monster.Bestiary = {
    class = "Extra Dimensional",
    race = BESTY_RACE_EXTRA_DIMENSIONAL,
    toKill = 2500,
    FirstUnlock = 500,
    SecondUnlock = 1000,
    CharmsPoints = 500,
    Stars = 4,
    Occurrence = 0,
    Locations = "Heaven",
}
monster.health = 240000
monster.maxHealth = 240000
monster.race = "venom"
monster.corpse = 49318
monster.speed = 110
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
}

monster.loot = {
	{ id = 3043, chance = 60000, maxCount = 7 }, -- crystal coin
	{ id = 47375, chance = 500},
	{ id = 46095, chance = 100},
	{ id = 47374, chance = 500},
	{ id = 49282, chance = 10},
	{ id = 49283, chance = 10},
	{ id = 49284, chance = 10},
	{ id = 49285, chance = 10},
	{ id = 49286, chance = 10},
	{ id = 49287, chance = 10},
	{ id = 49288, chance = 10},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5000, maxDamage = -8000},
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -5000, maxDamage = -8000, radius = 6, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "melee", interval = 2000, chance = 50, minDamage = -5000, maxDamage = -8000},
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -5000, maxDamage = -8000, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false },
}

monster.defenses = {
	defense = 92,
	armor = 92,
	mitigation = 2.0,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = -20 },
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


