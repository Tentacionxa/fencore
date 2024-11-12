local mType = Game.createMonsterType("Gokushabaal")
local monster = {}

monster.description = "Gokushabaal"
monster.experience = 90000000
monster.outfit = {
	lookType = 1464,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 90000000
monster.maxHealth = 90000000
monster.race = "fire"
monster.corpse = 5995
monster.speed = 1500
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50,
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 2500000,
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

monster.summon = {
	maxSummons = 30,
	summons = {
		{ name = "morshabaal", chance = 100, interval = 1000, count = 6 },
	},
}

monster.voices = {
    interval = 5000,
    chance = 10,
    { text = "ALL HAIL THE MASTERS OF DESTRUCTION!", yell = true },
    { text = "YOUR FATE IS SEALED!", yell = true },
    { text = "GOKUSHABAAL HAS RETURNED!", yell = true },
    { text = "Prepare yourselves, for the masters shall descend upon you!", yell = false },
    { text = "GOKUSHABAAL DEMANDS MORE SOULS!", yell = true },
}

monster.loot = {
    { id = 14758, chance = 100000, maxCount = 1 }, -- Always drops 1 of this item
    { id = 46255, chance = 100000, maxCount = 1 }, -- Always drops 1 of this item
    { id = 49176, chance = 30000, maxCount = 2 }, -- 30% chance to drop up to 2
    { id = 3043, chance = 100000, maxCount = 3000 }, -- Always drops up to 3000
    { id = 49287, chance = 1000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
    { id = 49283, chance = 10000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
    { id = 49286, chance = 10000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
    { id = 49285, chance = 10000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
    { id = 49284, chance = 10000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
    { id = 49283, chance = 10000000, maxCount = 1 }, -- Drops 1 of this item with a chance of 100%
}


monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = -15000, maxDamage = -20000 },
    { name = "combat", interval = 1000, chance = 100, type = COMBAT_MANADRAIN, minDamage = -5000, maxDamage = -10000, range = 7, target = false },
    { name = "combat", interval = 1000, chance = 100, type = COMBAT_MANADRAIN, minDamage = -5000, maxDamage = -10000, radius = 5, effect = CONST_ME_POISONAREA, target = false },
    { name = "effect", interval = 1000, chance = 100, radius = 5, effect = CONST_ME_HITAREA, target = false },
    { name = "combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -10000, maxDamage = -15000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
    { name = "firefield", interval = 1000, chance = 100, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true, minDamage = -5000, maxDamage = -10000 },
    { name = "combat", interval = 1000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -15000, maxDamage = -20000, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
}


monster.defenses = {
	defense = 111,
	armor = 90,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 15000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_HEALING, minDamage = 6000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 50, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 7000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 80 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -30 },
	{ type = COMBAT_EARTHDAMAGE, percent = -30 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -30 },
	{ type = COMBAT_HOLYDAMAGE, percent = -30 },
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
