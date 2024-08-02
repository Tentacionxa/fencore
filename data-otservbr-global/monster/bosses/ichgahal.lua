local mType = Game.createMonsterType("Ichgahal")
local monster = {}

monster.description = "Ichgahal"
monster.experience = 3250000
monster.outfit = {
	lookType = 1665,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "undead"
monster.corpse = 44018
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2364,
	bossRace = RARITY_NEMESIS,
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
}

monster.voices = {
}

monster.loot = {
	{id = 3043, chance = 20000, maxCount = 115}, 
        {id = 43502, chance = 500}, -- the essence of ichgahal
        {id = 43860, chance = 300}, -- Bag you covet
	{id = 32623, chance = 14000},
    {id = 43962, chance = 14000}, -- putrefactive gifurine
    {id = 43899, chance = 14000}, -- cursed wood
    {id = 43964, chance = 14000}, -- ichgahals fungal infestation
    {id = 44048, chance = 14000}, -- spiritual horseshoe
	{id = 7643, chance = 10000, maxCount = 5}, -- ultimate health potion
    {id = 7443, chance = 10000, maxCount = 45}, -- bullseye potion
    {id = 7439, chance = 10000, maxCount = 45}, -- berserk potion
	{id = 238, chance = 10000, maxCount = 7}, -- great mana potion
    {id = 23375, chance = 10000, maxCount = 164}, -- supreme health potion
    {id = 7440, chance = 10000, maxCount = 27}, -- mastermind potion
	{id = 7642, chance = 10000, maxCount = 6}, -- great spirit potion
	{id = 3041, chance = 10000, maxCount = 2}, -- blue gem
    {id = 32769, chance = 10000, maxCount = 3}, -- white gem
	{id = 16122, chance = 10000, maxCount = 3}, -- green crystal splinter
	{id = 16120, chance = 10000, maxCount = 2}, -- violet crystal shard
	{id = 30061, chance = 15000},
	{id = 33778, chance = 2000}

}

monster.attacks = {
	{name ="melee", interval = 3000, chance = 100, minDamage = -1500, maxDamage = -2300},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -2700, maxDamage = -3900, length = 12, spread = 3, effect = 249, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -2600, maxDamage = -3300, length = 12, spread = 3, effect = 193, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -2900, maxDamage = -3500, length = 6, spread = 2, effect = CONST_ME_FIREAREA, target = false},
	{name ="speed", interval = 2000, chance = 35, speedChange = -600, radius = 8, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000}
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1200, effect = 236, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
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