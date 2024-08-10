taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
        {x = 32341, y = 32229, z = 7},
        {x = 31469, y = 31764, z = 7},
    },
	selectLanguage = 1, -- options: 1 = pt_br or 2 = english
	uniqueTask = false, -- do one task at a time
	uniqueTaskStorage = 65002
}

task_pt_br = {
	exitButton = "Exit",
	confirmButton = "Confirm",
	cancelButton = "Cancel",
	returnButton = "Return",
	title = "Quest Board",
	missionError = "Mission is in progress or has already been completed.",
	uniqueMissionError = "You can only do one mission at a time.",
	missionErrorTwo = "You have completed the mission",
	missionErrorTwoo = "\nHere are your rewards:",
	choiceText = "- Experience: ",
	messageAcceptedText = "You accepted this mission!",
	messageDetailsText = "Mission details:",
	choiceMonsterName = "Name: ",
	choiceMonsterKill = "Kills: ",
	choiceEveryDay = "Repetition: Every day",
	choiceRepeatable = "Repetition: Always",
	choiceOnce = "Repetition: Only once",
	choiceReward = "Rewards:",
	messageAlreadyCompleteTask = "You have already completed this mission.",
	choiceCancelTask = "You canceled this mission",
	choiceCancelTaskError = "You cannot cancel this quest because it has already been completed or has not been started.",
	choiceBoardText = "Choose a mission and use the buttons below:",
	choiceRewardOnHold = "Redeem Prize",
	choiceDailyConclued = "Completed Daily",
	choiceConclued = "Completed",
	messageTaskBoardError = "The quest board is too far away or this is not the correct quest board.",
	messageCompleteTask = "You finished this mission! \nReturn to the quest board and collect your reward.",
}

taskConfiguration = {
	{name = "Beginner - Rotworm, Minotaur, Rat, Carrion Worm, White Pale, Rotworm Queen", color = 40, total = 100, type = "once", storage = 190006, storagecount = 190007, 
	rewards = {
		{20082, 1},
		{7405, 1},
		{7420, 1},
		{16096, 1},
		{16117, 1},
	{3043, 40},
	{"exp", 100000},
	},
	races = {
		"Rotworm",
		"Carrion Worm",
		"White Pale",
		"Rotworm Queen",
		"Rat",
		"Minotaur",
	},
},
{name = "Intermediate - Minotaur, Minotaur Archer, Minotaur Mage, Minotaur Guard", color = 40, total = 100, type = "once", storage = 190000, storagecount = 190001, 
	rewards = {
	{5804, 1},
	{3043, 50},
	{14086, 1},
	{11651, 1},
	{3079, 1},
	{"exp", 1000000},
	},
	races = {
		"Minotaur",
		"Minotaur Archer",
		"Minotaur Mage",
		"Minotaur Guard",
	},
},

{name = "Intermediate - Cyclops, Cyclops Drone, Cyclops Smith", color = 40, total = 100, type = "once", storage = 190022, storagecount = 190023, 
	rewards = { 
	{3043, 50},
	{13998, 1},
	{3422, 1},
	{"exp", 800000},
	},
	races = {
		"Cyclops",
		"Cyclops Drone",
		"Cyclops Smith",
	},
},

{name = "Amazon, Valkyrie, Xenia, Witch", color = 40, total = 500, type = "daily", storage = 190008, storagecount = 190009, 
	rewards = { 
	{3043, 60},
	{"exp", 1500000},
	{3437, 1},
	},
	races = {
		"Amazon",
		"Valkyrie",
		"Xenia",
		"Witch",
	},
},

{name = "Dragons - Dragon, Dragon Lord, Dragon Hatchling, Dragon Lord Hatchling", color = 40, total = 1000, type = "daily", storage = 190002, storagecount = 190003, 
	rewards = {
	{3043, 60},
	{5908, 1},
	{"exp", 1500000},
	},
	races = {
		"Dragon",
		"Dragon Lord",
		"Dragon Hatchling",
		"Dragon Lord Hatchling",
	},
},

{name = "Lower Roshamuul - Weakened Frazzlemaw, Frazzlemaw, Memory of Frazzlemaw, Guzzlemaw, Mawhawk, Silencer, Shock Head, Sight of Surrender", color = 40, total = 1500, type = "daily", storage = 190012, storagecount = 190013, 
	rewards = { 
	{22516, 1},
	{20270, 1},
	{20272, 1},
	{20062, 50},
	{3043, 70},
	{"exp", 3500000},
	},
	races = {
		"Weakened Frazzlemaw",
		"Frazzlemaw",
		"Memory Of A Frazzlemaw",
		"Guzzlemaw",
		"Mawhawk",
		"Sight of Surrender",
		"Silencer",
	},
},

{name = "Deeplings - Deepling Guard, Deepling Warrior, Deepling Scount", color = 40, total = 1500, type = "daily", storage = 190016, storagecount = 190017, 
	rewards = { 
	{14142, 1},
	{3043, 60},
	{"exp", 10000000},
	},
	races = {
		"Deepling Guard",
		"Deepling Warrior",
		"Deepling Scout",
	},
},

{name = "Falcon Bastion - Falcon Knight, Falcon Paladin, Monk, Preceptor Lazare, Grand Canon Dominus, Grand Commander, Grand Chaplain Gaunder", color = 40, total = 5000, type = "daily", storage = 190018, storagecount = 190019, 
	rewards = { 
	{3043, 300},
	{"exp", 10000000},
	},
	races = {
		"Falcon Knight",
		"Falcon Paladin",
		"Monk",
		"Preceptor Lazare",
		"Grand Canon Dominus",
		"Grand Commander",
		"Grand Chaplain Gaunder",
	},
},

{name = "Banuta - Medusa, Serpent Spawn, Hydra, Bonebeast, ", color = 40, total = 5000, type = "daily", storage = 190020, storagecount = 190021, 
	rewards = { 
	{3043, 200},
	{"exp", 20000000},
	},
	races = {
		"Medusa",
		"Serpent Spawn",
		"Hydra",
		"Bonebeast",
		"Giant Spider",
		"Behemoth",
		"Nightmare",
		"Hellspawn",
		"Phantasm",
		"Frost Dragon",
	},
},

{name = "Hero Cave - Bonelord, Dark Apprentice, Dark Magician, Demon Skeleton, Dragon, Hero, Hunter, Monk, Priestess, Stalker, Stone Golem, Wild Warrior, Minotaur Mage", color = 40, total = 1500, type = "daily", storage = 190024, storagecount = 190025, 
	rewards = { 
	{3043, 50},
	{"exp", 1000000},
	},
	races = {
		"Hero",
		"Bonelord",
		"Dark Apprentice",
		"Dark Magician",
		"Demon Skeleton",
		"Dragon",
		"Hunter",
		"Monk",
		"Priestess",
		"Stalker",
		"Stone Golem",
		"Wild Warrior",
		"Minotaur Mage",
	},
},

{name = "Ogre - Ogre Sage, Ogre Ruffian, Ogre Rowdy, Ogre Shaman", color = 40, total = 1500, type = "daily", storage = 190026, storagecount = 190027, 
	rewards = { 
	{3043, 60},
	{"exp", 30000000},
	},
	races = {
		"Ogre Sage",
		"Ogre Ruffian",
		"Ogre Rowdy",
		"Ogre Shaman",
	},
},

{name = "Pirat - Pirat Mate, Pirat Cutthroat, Pirat Scoundrel, Pirat Bombardier", color = 40, total = 1500, type = "daily", storage = 190028, storagecount = 190029, 
	rewards = { 
		{3043, 60},
	{"exp", 30000000},
	},
	races = {
		"Pirat Mate",
		"Pirat Cutthroat",
		"Pirat Scoundrel",
		"Pirat Bombardier",
	},
},

{name = "Asura Palace - Dawnfire Asura, Frost Flower Asura, Hellspawn, Midnight Asura, Destroyer", color = 40, total = 1500, type = "daily", storage = 190030, storagecount = 190031, 
	rewards = { 
		{3043, 60},
	{"exp", 30000000},
	},
	races = {
		"Dawnfire Asura",
		"Frost Flower Asura",
		"Hellspawn",
		"Midnight Asura",
		"Destroyer",
	},
},

{name = "Asura Vaults - True Dawnfire Asura, True Midnight Asura, True Frost Flower Asura", color = 40, total = 2500, type = "daily", storage = 190032, storagecount = 190033, 
	rewards = { 
		{3043, 100},
	{"exp", 70000000},
	},
	races = {
		"True Dawnfire Asura",
		"True Midnight Asura",
		"True Frost Flower Asura",
	},
},

{name = "Summer Dream Court - Crazed Summer Rearguard, Crazed Summer Vanguard, Insane Siren, Arachnophobica, Thanatursus, Lacewing Moth", color = 40, total = 3500, type = "daily", storage = 190034, storagecount = 190035, 
	rewards = { 
		{3043, 100},
		{"exp", 90000000},
	},
	races = {
		"Crazed Summer Rearguard",
		"Crazed Summer Vanguard",
		"Insane Siren",
		"Arachnophobica",
		"Thanatursus",
		"Lacewing Moth",
	},
},

{name = "Court of Winter - Crazed Winter Vanguard, Crazed Winter Rearguard, Soul-Broken Harbinger, Hibernal Moth, Arachnophobica, Thanatursus", color = 40, total = 3500, type = "daily", storage = 190036, storagecount = 190037, 
	rewards = { 
		{3043, 100},
		{"exp", 90000000},
	},
	races = {
		"Crazed Winter Vanguard",
		"Crazed Winter Rearguard",
		"Soul-Broken Harbinger",
		"Hibernal Moth",
		"Arachnophobica",
		"Thanatursus",
	},
},

{name = "Lion Sanctum - White Lion, Werelion, Werelioness", color = 40, total = 4000, type = "daily", storage = 190038, storagecount = 190039, 
	rewards = { 
	{3043, 100},
	{"exp", 70000000},
	},
	races = {
		"White Lion",
		"Werelion",
		"Werelioness",
	},
},

{name = "Sphinx, Lamassu", color = 40, total = 4000, type = "daily", storage = 190040, storagecount = 190041, 
	rewards = { 
		{3043, 100},
	{"exp", 70000000},
	},
	races = {
		"Sphinx",
		"Lamassu",
	},
},

{name = "Soul War - Bony Sea Devil, Brachiodemon, Capricious Phantom, Cloak of Terror, Distorted Phantom, Courage Leech, Infernal Phantom, Infernal Demon, Hazardous Phantom, Many Faces, Mean Maw, Mould Phantom, Rotten Golem, Spiteful Spitter, Vibrant Phantom, Branchy Crawler", color = 40, total = 6000, type = "daily", storage = 190042, storagecount = 190043, 
	rewards = {  
		{3043, 400},
		{37317, 1},
	{"exp", 100000000},
	},
	races = {
		"Bony Sea Devil",
		"Brachiodemon",
		"Capricious Phantom",
		"Cloak of Terror",
		"Distorted Phantom",
		"Courage Leech",
		"Infernal Phantom",
		"Hazardous Phantom",
		"Many Faces",
		"Mean Maw",
		"Mould Phantom",
		"Rotten Golem",
		"Spiteful Spitter",
"Vibrant Phantom",
"Branchy Crawler",
"Infernal Demon",
	},
},

{name = "Zao - Lizard Chosen, Lizard High Guard, Lizard Legionnaire, Lizard Dragon Priest, Ghastly Dragon, Draken Elite, Draken Abomination, Draken Warmaster, Draken Spellweaver, Lizard Zaogun", color = 40, total = 2500, type = "daily", storage = 190044, storagecount = 190045, 
	rewards = { 
		{3043, 170},
	{"exp", 8000000},
	},
	races = {
		"Lizard Chosen",
		"Lizard High Guard",
		"Lizard Legionnaire",
		"Lizard Dragon Priest",
		"Ghastly Dragon",
		"Draken Elite",
		"Draken Abomination",
		"Draken Warmaster",
		"Draken Spellweaver",
		"Lizard Zaogun",
	},
},

{name = "Issavi Sewers - Priestess of the Wild Sun, Black Sphinx Acolyte, Burning Gladiator, Sphinx, Crypt Warden, Gryphon", color = 40, total = 2500, type = "daily", storage = 190046, storagecount = 190047, 
	rewards = { 
		{3043, 170},
	{"exp", 8000000},
	},
	races = {
		"Priestess of the Wild Sun",
		"Black Sphinx Acolyte",
		"Burning Gladiator",
		"Sphinx",
		"Crypt Warden",
		"Gryphon",
	},
},

{name = "Cobra Bastion - Cobra Assassin, Cobra Vizier, Cobra Scout", color = 40, total = 2500, type = "daily", storage = 190048, storagecount = 190049, 
	rewards = { 
		{3043, 190},
	{"exp", 8000000},
	},
	races = {
		"Cobra Assassin",
		"Cobra Vizier",
		"Cobra Scout",
	},
},

{name = "POI - Banshee, Betrayed Wraith, Blightwalker, Dark Torturer, Defiler, Demon, Destroyer, Diabolic Imp, Fury, Hand of Cursed Fate, Hellfire Fighter, Hellhound, Juggernaut, Lost Soul, Plaguesmith, Spectre", color = 40, total = 4500, type = "daily", storage = 190050, storagecount = 190051, 
	rewards = { 
		{3043, 250},
	{"exp", 10000000},
	},
	races = {
		"Banshee",
		"Betrayed Wraith",
		"Blightwalker",
		"Dark Torturer",
		"Defiler",
		"Demon",
		"Destroyer",
		"Diabolic Imp",
		"Fury",
		"Hand of Cursed Fate",
		"Hellfire Fighter",
		"Hellhound",
		"Juggernaut",
		"Lost Soul",
		"Plaguesmith",
		"Spectre",
	},
},

{name = "INQ - Ancient Scarab, Behemoth, Betrayed Wraith, Blightwalker, Bonebeast, Braindeath, Crystal Spider, Dark Magician, Dark Torturer, Defiler, Demon, Destroyer, Diabolic Imp, Dreadbeast, Efreet, Eye of the Seven, Fire Devil, Fire Elemental, Fury, Gargoyle, Giant Spider, Hand of Cursed Fate, Hellfire Fighter, Hellhound, Ice Golem, Juggernaut, Lich, Lost Soul, Massive Fire Elemental, Nightmare, Phantom, The Count, Spectre, Plaguesmith, Warlock", color = 40, total = 5000, type = "daily", storage = 190052, storagecount = 190053, 
	rewards = { 
		{3043, 350},
	{"exp", 10000000},
	},
	races = {
		"Ancient Scarab",
		"Behemoth",
		"Betrayed Wraith",
		"Blightwalker",
		"Bonebeast",
		"Braindeath",
		"Crystal Spider",
		"Dark Magician",
		"Dark Torturer",
		"Defiler",
		"Demon",
		"Destroyer",
		"Diabolic Imp",
		"Dreadbeast",
		"Efreet",
		"Eye of the Seven",
		"Fire Devil",
		"Fire Elemental",
		"Fury",
		"Gargoyle",
		"Giant Spider",
		"Hand of Cursed Fate",
		"Hellfire Fighter",
		"Hellhound",
		"Ice Golem",
		"Juggernaut",
		"Lich",
		"Lost Soul",
		"Massive Fire Elemental",
		"Nightmare",
		"Phantom",
		"The Count",
		"Spectre",
		"Plaguesmith",
		"Warlock",
	},
},
{name = "Rotten Blood - Bloated Man-Maggot, Converter, Darklight Construct, Darklight Emitter, Darklight Matter, Darklight Source, Darklight Striker, Mycobiontic Beetle, Oozing Carcass, Oozing Corpus, Rotten Man-Maggot, Sopping Carcass, Sopping Corpus, Walking Pilar, Wandering Pilar", color = 40, total = 4500, type = "daily", storage = 190054, storagecount = 190055, 
	rewards = { 
		{3043, 350},
		{37317, 1},
	{"exp", 10000000},
	},
	races = {
		"Bloated Man-Maggot",
		"Converter",
		"Darklight Construct",
		"Darklight Emitter",
		"Darklight Source",
		"Darklight Striker",
		"Mycobiontic Beetle",
		"Oozing Carcass",
		"Oozing Corpus",
		"Rotten Man-Maggot",
		"Sopping Carcass",
		"Walking Pilar",
		"Wandering Pilar",
		
	},
},
{name = "Kilmaresh Central Steppe - Young Goanna, Adult Goanna, Feral Sphinx, Manticore, Lamassu, Sphinx", color = 40, total = 2500, type = "daily", storage = 190055, storagecount = 190056, 
	rewards = { 
		{3043, 150},
	{"exp", 5000000},
	},
	races = {
		"Young Goanna",
		"Adult Goanna",
		"Feral Sphinx",
		"Manticore",
		"Lamassu",
		"Sphinx",
	},
},
{name = "The Secret Library - Cursed Book, Animated Feather, Biting Book, Dark Knowledge, Brain Squid, Burning Book, Flying Book, Rage Squid", color = 40, total = 3500, type = "daily", storage = 190057, storagecount = 190058, 
	rewards = { 
		{3043, 280},
	{"exp", 8000000},
	},
	races = {
		"Cursed Book",
		"Animated Feather",
		"Biting Book",
		"Dark Knowledge",
		"Brain Squid",
		"Burning Book",
		"Flying Book",
		"Rage Squid",
	},
},
{name = "Marapur Turtles - Two-Headed Turtle, Foam Stalker", color = 40, total = 2500, type = "daily", storage = 190059, storagecount = 190060, 
	rewards = { 
		{3043, 200},
	{"exp", 8000000},
	},
	races = {
		"Two-Headed Turtle",
		"Foam Stalker",
	},
},
{name = "Bashmu - Bashmu, Juvenile Bashmu", color = 40, total = 2500, type = "daily", storage = 190059, storagecount = 190060, 
	rewards = { 
		{3043, 200},
	{"exp", 8000000},
	},
	races = {
		"Bashmu",
		"Juvenile Bashmu",
	},
},
{name = "Warzone 3 - Ironblight, Orewalker, Cliff Strider, Lost Berserker", color = 40, total = 1500, type = "daily", storage = 190061, storagecount = 190062, 
	rewards = { 
		{3043, 150},
	{"exp", 8000000},
	},
	races = {
		"Ironblight",
		"Orewalker",
		"Cliff Strider",
		"Lost Berserker",
	},
},
{name = "Warzone 5 - Drillworm, Chasm Spawn, Mole, Elder Wyrm", color = 40, total = 1500, type = "daily", storage = 190063, storagecount = 190064, 
	rewards = { 
		{3043, 150},
	{"exp", 8000000},
	},
	races = {
		"Drillworm",
		"Chasm Spawn",
		"Mole",
		"Elder Wyrm",
	},
},
{name = "Buried Cathedral - Burster Spectre, Ripper Spectre, Gazer Spectre", color = 40, total = 2000, type = "daily", storage = 190065, storagecount = 190066, 
	rewards = { 
		{3043, 200},
	{"exp", 8000000},
	},
	races = {
		"Burster Spectre",
		"Ripper Spectre",
		"Gazer Spectre",
	},
},
{name = "Oskayaat - Cunning Werepanther, Feral Werecrocodile, Werecrocodile, Werepanther, Weretiger, White Tiger, White Weretiger", color = 40, total = 3000, type = "daily", storage = 190067, storagecount = 190068, 
	rewards = { 
		{3043, 150},
	{"exp", 8000000},
	},
	races = {
		"Cunning Werepanther",
		"Feral Werecrocodile",
		"Werecrocodile",
		"Werepanther",
		"Weretiger",
"White Tiger",
		"White Weretiger",
	},
},

{name = "Library - Cursed Book, Biting Book, Animated Feather, Dark Knowledge, Energetic Book, Energuardian of Tales, Brain Squid, Flying Book, Guardian of Tales, Gulosh' Deathgaze, Knowledge elemental, The Book of Death, Rage Squid, Squid Warden", color = 40, total = 3000, type = "daily", storage = 190069, storagecount = 190070, 
	rewards = { 
		{3043, 250},
	{"exp", 8000000},
	},
	races = {
		"Cursed Book",
		"Biting Book",
		"Animated Feather",
		"Dark Knowledge",
		"Energetic Book",
"Energuardian of Tales",
		"Brain Squid",
		"Flying Book",
		"Guardian of Tales",
		"Gulosh' Deathgaze",
		"Knowledge elemental",
		"The Book of Death",
		"Rage Squid",
		"Squid Warden",
		"Burning Book",
	},
},

{name = "Casino Coins - Juggernaut, Hellhound, Demon, Hellfire Fighter", color = 40, total = 100, type = "daily", storage = 190075, storagecount = 190076, 
	rewards = { 
		{37317, 1},
	},
	races = {
		"Juggernaut",
		"Hellhound",
		"Demon",
		"Hellfire Fighter",
	},
},

{name = "Drefia - Grim Reaper, Lich, Gravedigger, Spectre", color = 40, total = 2000, type = "daily", storage = 190077, storagecount = 190078, 
	rewards = { 
		{3043, 120},
	{"exp", 1000000},
	},
	races = {
		"Grim Reaper",
		"Lich",
		"Gravedigger",
		"Spectre",
	},
},
}

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 6 * 60 * 60 

function Player.getCustomActiveTasksName(self)
local player = self
	if not player then
		return false
	end
local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
		tasks[#tasks + 1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end


function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		for _, dataList in ipairs(data.races) do
		if dataList:lower() == name:lower() then
			return data
		end
		end
	end
	return false
end

function Player.startTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
	end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end


function Player.getTaskKills(self, storage)
local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
		player:say(' ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end