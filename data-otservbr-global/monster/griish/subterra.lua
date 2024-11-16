local mType = Game.createMonsterType("Sub Terra")
local monster = {}

monster.description = "Sub Terra"
monster.experience = 6250000
monster.outfit = {
	lookType = 186,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700000
monster.maxHealth = 700000
monster.race = "undead"
monster.corpse = 46258
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2604,
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
	maxSummons = 4,
	summons = {
		{ name = "Sub Iceearth", chance = 100, interval = 1000, count = 4 },
	},
}
monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "PUNISH ... YOU!", yell = true },
	{ text = "GGGGGGRAAAR!", yell = false },
	{ text = "The ... light ... that ...", yell = false },
	{ text = "Earth ... devours!", yell = true },
}

monster.loot = {
	{id = 46315, chance = 20000, maxCount = 60}, 
{id = 46314, chance = 20000, maxCount = 5},
 {id = 46404, chance = 500},
        {id = 46272, chance = 500}, 
		{id = 46378, chance = 100}, 
        {id = 46356, chance = 30}, 
	{id = 46255, chance = 30},
{id = 46322, chance = 50},
{id = 46316, chance = 100000, maxCount = 1 },
{id = 43874, chance = 100},
{id = 43873, chance = 60},
{id = 43872, chance = 100},
{id = 43867, chance = 60},
	

}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2300, maxDamage = -2750},
	{name ="combat", interval = 2000, chance = 90, type = COMBAT_EARTHDAMAGE, minDamage = -4000, maxDamage = -7000, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 90, type = COMBAT_EARTHDAMAGE, minDamage = -4000, maxDamage = -7000, range = 4, radius = 6, effect = 55, target = true},
	{name ="combat", interval = 2000, chance = 90, type = COMBAT_EARTHDAMAGE, minDamage = -4000, maxDamage = -7000, length = 7, spread = 4, effect = 51, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -4000, maxDamage = -7000, length = 7, spread = 3, effect = 47, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000},
}

monster.defenses = {
	defense = 105,
	armor = 105,
	
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -50},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
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
monster:setIcon("sub-terra", CreatureIconCategory_Quests, CreatureIconQuests_Energy, 45)
monster:setIcon("subterra", CreatureIconCategory_Quests, CreatureIconQuests_Ice, 10)
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