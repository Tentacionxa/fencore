local mType = Game.createMonsterType("Undead Grash")
local monster = {}

monster.description = "Undead Grash"
monster.experience = 3250000
monster.outfit = {
	lookType = 705,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.race = "undead"
monster.corpse = 46266
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2606,
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
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "WILL ... PUNISH ... YOU!", yell = true },
	{ text = "RAAAR!", yell = false },
	{ text = "The ... light ... that ... drains!Light ... that ... isn't!", yell = false },
	{ text = "Darkness ... devours!", yell = true },
}

monster.loot = {
	{id = 3043, chance = 20000, maxCount = 70}, 
        {id = 43504, chance = 500}, -- the essence of chagorz
        {id = 43860, chance = 300}, -- Bag you covet
	{id = 32623, chance = 14000},
    {id = 30054, chance = 14000}, -- unicorn figurine
    {id = 43961, chance = 14000}, -- darklight figurine
	{id = 7643, chance = 10000, maxCount = 5}, -- ultimate health potion
    {id = 7443, chance = 10000, maxCount = 31}, -- bullseye potion
	{id = 238, chance = 10000, maxCount = 7}, -- great mana potion
    {id = 23375, chance = 10000, maxCount = 164}, -- supreme health potion
    {id = 7440, chance = 10000, maxCount = 27}, -- mastermind potion
	{id = 7642, chance = 10000, maxCount = 6}, -- great spirit potion
	{id = 3041, chance = 10000, maxCount = 2}, -- blue gem
    {id = 32769, chance = 10000, maxCount = 3}, -- white gem
	{id = 16122, chance = 10000, maxCount = 3}, -- green crystal splinter
	{id = 16120, chance = 10000, maxCount = 2}, -- violet crystal shard
	{id = 30061, chance = 15000},
	{id = 33778, chance = 2000},
    {id = 46409, chance = 100, maxCount = 5},
    {id = 46311, chance = 100, maxCount = 5},
    {id = 46310, chance = 100, maxCount = 5},
    {id = 46309, chance = 100, maxCount = 5},
    {id = 46308, chance = 100, maxCount = 5},
	{id = 46213, chance = 100, maxCount = 5},
    {id = 46097, chance = 100, maxCount = 5},

}

monster.summon = {
    maxSummons = 4,
    summons = {
        { name = "Sub Enerfire", chance = 100, interval = 1000, count = 4 },
    },
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -7000, maxDamage = -9000},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -4000, maxDamage = -7000, radius = 7, effect = 191, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -4000, maxDamage = -7000, range = 4, radius = 7, effect = 194, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -5000, maxDamage = -8000, length = 10, spread = 3, effect = 180, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -3000, maxDamage = -4000, length = 10, spread = 3, effect = 186, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = 179, target = false, duration = 20000},
}

monster.defenses = {
	defense = 105,
	armor = 105,
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
monster:setIcon("sub-devis", CreatureIconCategory_Quests, CreatureIconQuests_GreenShield, 100)
monster:setIcon("subdevis", CreatureIconCategory_Quests, CreatureIconQuests_RedShield, 100)
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