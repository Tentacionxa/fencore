local mType = Game.createMonsterType("Devovorga")
local monster = {}

monster.description = "Devovorga"
monster.experience = 50000
monster.outfit = {
	lookType = 354,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 677,
	bossRace = RARITY_NEMESIS,
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 240
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
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
	{ text = "Slurp!", yell = true },
	{ text = "See how weak you are?", yell = true },
	{ text = "I tried to save you, but there's no use.", yell = true },
	{ text = "My soul, power, hatred, knowledge and fury are far away.", yell = true },
	{ text = "Now you made me mad.", yell = true },
	{ text = "THE SEVEN? THEY WERE NOT ABLE TO CONTROL ME!", yell = true },
	{ text = "BRING IT! WE END THIS HERE!", yell = true },
	{ text = "YOU WILL ALL DIE - ONE WAY OR THE OTHER.", yell = true },
	{ text = "PEREAT MUNDUS!", yell = true },
}

monster.loot = {
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 392, attack = 500 },
	{ name = "omrafir wave", interval = 2000, chance = 17, minDamage = -500, maxDamage = -1000, target = false },
	{ name = "omrafir beam", interval = 2000, chance = 15, minDamage = -1000, maxDamage = -4000, target = false },
}

monster.defenses = {
	defense = 165,
	armor = 155,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_HEALING, minDamage = 800, maxDamage = 3000, target = false },
	{ name = "omrafir healing 2", interval = 2000, chance = 20, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
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
