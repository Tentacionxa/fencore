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
	{name = "Rotworm", color = 40, total = 250, type = "once", storage = 190006, storagecount = 190007, 
	rewards = {
	{3043, 10},
	{"exp", 100000},
		},
	},
	
	{name = "Minotaur", color = 40, total = 5000, type = "once", storage = 190000, storagecount = 190001, 
	rewards = {
	{3043, 10},
	{"exp", 1000000},
		},
	},
{name = "Dwarf", color = 10, total = 50, type = "once", storage = 210101, storagecount = 210102, 
rewards = {
{8043, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Dwarf Soldier", color = 10, total = 50, type = "once", storage = 210103, storagecount = 210104, 
rewards = {
{3210, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Dwarf Guard", color = 10, total = 50, type = "once", storage = 210105, storagecount = 210106, 
rewards = {
{645, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Orc", color = 20, total = 50, type = "once", storage = 210107, storagecount = 210108, 
rewards = {
{3370, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Orc Warrior", color = 20, total = 50, type = "once", storage = 210109, storagecount = 210110, 
rewards = {
{3371, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Orc Spearman", color = 20, total = 50, type = "once", storage = 210111, storagecount = 210112, 
rewards = {
{3079, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Orc Spearman", color = 20, total = 50, type = "once", storage = 210113, storagecount = 210114, 
rewards = {
{3079, 1},
{3043, 2},
{"exp", 50000},
	},
},
{name = "Cyclops", color = 30, total = 50, type = "once", storage = 210115, storagecount = 210116, 
rewards = {
{9604, 1},
{3045, 10},
{"exp", 50000},
	},
},
{name = "Cyclops Drone", color = 30, total = 50, type = "once", storage = 210117, storagecount = 210118, 
rewards = {
{8082, 1},
{12741, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Cyclops Smith", color = 30, total = 50, type = "once", storage = 210119, storagecount = 210120, 
rewards = {
{7404, 1},
{7436, 1},
{7426, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Cyclops Smith", color = 30, total = 50, type = "once", storage = 210121, storagecount = 210122, 
rewards = {
{8027, 1},
{8021, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Elf Scout", color = 40, total = 50, type = "once", storage = 210122, storagecount = 210123, 
rewards = {
{8074, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Elf Arcanist", color = 40, total = 50, type = "once", storage = 210124, storagecount = 210125, 
rewards = {
{3439, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Barbarian Bloodwalker", color = 50, total = 50, type = "once", storage = 210126, storagecount = 210127, 
rewards = {
{22062, 1},
{3043, 10},
{"exp", 50000},
	},
},
{name = "Dragon", color = 60, total = 200, type = "once", storage = 210128, storagecount = 210129, 
rewards = {
{20085, 1},
{20082, 1},
{3043, 20},
{"exp", 100000},
	},
},
{name = "Dragon", color = 70, total = 200, type = "once", storage = 210128, storagecount = 210129, 
rewards = {
{20076, 1},
{20070, 1},
{20064, 1},
{3043, 20},
{"exp", 100000},
	},
},
{name = "Dragon", color = 70, total = 200, type = "once", storage = 210128, storagecount = 210129, 
rewards = {
{8075, 1},
{3043, 20},
{"exp", 100000},
	},
},
	{name = "Dragon", color = 40, total = 1000, type = "daily", storage = 190002, storagecount = 190003, 
	rewards = {
	{3043, 20},
	{5908, 1},
	{"exp", 1500000},
		},
	},
	
	{name = "Dragon Lord", color = 40, total = 1000, type = "once", storage = 190004, storagecount = 190005, 
	rewards = {
	{5919, 1},
	{"exp", 1500000},
		},
	},
	
	{name = "Amazon", color = 40, total = 500, type = "repeatable", storage = 190008, storagecount = 190009, 
	rewards = { 
	{"exp", 1500000},
		},
	},
	
	{name = "Valkyrie", color = 40, total = 2000, type = "once", storage = 190010, storagecount = 190011, 
	rewards = { 
	{3437, 1},
		},
	},
	
	{name = "Lizard Legionnaire", color = 40, total = 2000, type = "repeatable", storage = 190531, storagecount = 190532, 
	rewards = { 
	{3043, 10},
		},
	},
	{name = "Lizard Dragon Priest", color = 40, total = 2000, type = "repeatable", storage = 190533, storagecount = 190534, 
	rewards = { 
	{3043, 10},
		},
	},
	{name = "Lizard High Guard", color = 40, total = 2000, type = "repeatable", storage = 190535, storagecount = 190536, 
	rewards = { 
	{3043, 15},
		},
	},
	{name = "Lizard Zaogun", color = 40, total = 2000, type = "repeatable", storage = 190537, storagecount = 190538, 
	rewards = { 
	{3043, 30},
		},
	},
	{name = "Draken Warmaster", color = 40, total = 2000, type = "repeatable", storage = 190539, storagecount = 190540, 
	rewards = { 
	{3043, 40},
		},
	},
	{name = "Draken Spellweaver", color = 40, total = 2000, type = "repeatable", storage = 190541, storagecount = 190542, 
	rewards = { 
	{3043, 40},
		},
	},
	{name = "Lizard Chosen", color = 40, total = 2000, type = "repeatable", storage = 190543, storagecount = 190544, 
	rewards = { 
	{3043, 50},
	{22516, 5},
		},
	},
	{name = "Ghastly Dragon", color = 40, total = 2000, type = "repeatable", storage = 190545, storagecount = 190546, 
	rewards = { 
	{3043, 70},
	{22516, 5},
		},
	},
	{name = "Draken Elite", color = 40, total = 2000, type = "repeatable", storage = 190547, storagecount = 190548, 
	rewards = { 
	{3043, 50},
	{22516, 5},
		},
	},
	{name = "Draken Abomination", color = 40, total = 2000, type = "repeatable", storage = 190549, storagecount = 190560, 
	rewards = { 
	{3043, 30},
	{22516, 5},
		},
	},
	{name = "Adult Goanna", color = 40, total = 1000, type = "repeatable", storage = 190561, storagecount = 190562, 
	rewards = { 
	{22516, 10},
	{3043, 50},
		},
	},
	{name = "Young Goanna", color = 40, total = 1000, type = "repeatable", storage = 190563, storagecount = 190564, 
	rewards = { 
	{22516, 10},
	{3043, 30},
		},
	},
	{name = "Betrayed Wraith", color = 40, total = 1000, type = "repeatable", storage = 190565, storagecount = 190566, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Nightmare", color = 40, total = 1000, type = "repeatable", storage = 190567, storagecount = 190568, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Lost Soul", color = 40, total = 1000, type = "repeatable", storage = 190569, storagecount = 190570, 
	rewards = { 
	{22516, 1},
		},
	},
	{name = "Plaguesmith", color = 40, total = 1000, type = "repeatable", storage = 190571, storagecount = 190572, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Dark Torturer", color = 40, total = 1000, type = "repeatable", storage = 190573, storagecount = 190574, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Demon Outcast", color = 40, total = 1000, type = "repeatable", storage = 190575, storagecount = 190576, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Blightwalker", color = 40, total = 1000, type = "repeatable", storage = 190577, storagecount = 190578, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Hellhound", color = 40, total = 1000, type = "repeatable", storage = 190579, storagecount = 190580, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Frazzlemaw", color = 40, total = 1000, type = "repeatable", storage = 190581, storagecount = 190582, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Silencer", color = 40, total = 1000, type = "repeatable", storage = 190583, storagecount = 190584, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Retching Horror", color = 40, total = 1000, type = "repeatable", storage = 190585, storagecount = 190586, 
	rewards = { 
	{22516, 3},
		},
	},
	
	{name = "Choking Fear", color = 40, total = 1000, type = "repeatable", storage = 190587, storagecount = 190588, 
	rewards = { 
	{22516, 3},
		},
	},
	
	{name = "Guzzlemaw", color = 40, total = 1000, type = "repeatable", storage = 190589, storagecount = 190590, 
	rewards = { 
	{22516, 5},
		},
	},
	{name = "Sight of Surrender", color = 40, total = 1000, type = "repeatable", storage = 190591, storagecount = 190592, 
	rewards = { 
	{22721, 25},
		},
	},
	
	{name = "Weakened Frazzlemaw", color = 40, total = 1000, type = "repeatable", storage = 190593, storagecount = 190594, 
	rewards = { 
	{22516, 1},
		},
	},
	
	{name = "Sphinx", color = 40, total = 1000, type = "repeatable", storage = 190595, storagecount = 190596, 
	rewards = { 
	{22516, 5},
	{3043, 40},
		},
	},
	{name = "Lamassu", color = 40, total = 1000, type = "repeatable", storage = 190791, storagecount = 190792, 
	rewards = { 
	{22516, 5},
	{3043, 60},
		},
	},
	{name = "Crypt Warden", color = 40, total = 1000, type = "repeatable", storage = 190597, storagecount = 190598, 
	rewards = { 
	{22516, 4},
	{3043, 50},
		},
	},
	{name = "Priestess of the Wild Sun", color = 40, total = 1000, type = "repeatable", storage = 190599, storagecount = 190600, 
	rewards = { 
	{22721, 2},
		},
	},
	{name = "Black Sphinx Acolyte", color = 40, total = 1000, type = "repeatable", storage = 190601, storagecount = 190602, 
	rewards = { 
	{22721, 3},
		},
	},
	{name = "Burning Gladiator", color = 40, total = 1000, type = "repeatable", storage = 190603, storagecount = 190604, 
	rewards = { 
	{22721, 5},
		},
	},
	{name = "Deepling Guard", color = 40, total = 1000, type = "repeatable", storage = 190605, storagecount = 190606, 
	rewards = { 
	{14142, 1},
		},
	},
	
	{name = "Deepling Warrior", color = 40, total = 1000, type = "repeatable", storage = 190607, storagecount = 190608, 
	rewards = { 
	{"exp", 1000000},
		},
	},
	
	{name = "Deepling Scout", color = 40, total = 1000, type = "repeatable", storage = 190609, storagecount = 190610, 
	rewards = { 
	{"exp", 1000000},
		},
	},
	{name = "Falcon Knight", color = 40, total = 1000, type = "repeatable", storage = 197320, storagecount = 197321, 
	rewards = { 
		{3043, 50},
	{"exp", 1000000},
		},
	},
	{name = "Falcon Paladin", color = 40, total = 1000, type = "repeatable", storage = 197320, storagecount = 197321, 
	rewards = { 
		{3043, 50},
	{"exp", 1000000},
		},
	},
	{name = "Guzzlemaw", color = 40, total = 1000, type = "once", storage = 190611, storagecount = 190612, 
	rewards = { 
	{20270, 1},
		},
	},
	
	{name = "Frazzlemaw", color = 40, total = 1000, type = "once", storage = 190613, storagecount = 190614, 
	rewards = { 
	{20272, 1},
		},
	},
	
	{name = "Silencer", color = 40, total = 1000, type = "once", storage = 190615, storagecount = 190616, 
	rewards = { 
	{20271, 1},
		},
	},
	
	{name = "Medusa", color = 40, total = 1000, type = "once", storage = 190617, storagecount = 190618, 
	rewards = { 
	{3393, 1},
		},
	},
	
	{name = "Demon", color = 40, total = 1000, type = "once", storage = 190028, storagecount = 190029, 
	rewards = { 
	{3365, 1},
		},
	},
	
	{name = "Hero", color = 40, total = 5000, type = "once", storage = 190030, storagecount = 190031, 
	rewards = { 
	{3394, 1},
		},
	},
	{name = "Glooth Brigand", color = 40, total = 1000, type = "once", storage = 190133, storagecount = 190134, 
	rewards = { 
	{3043, 20},
		},
	},
	{name = "Glooth Bandit", color = 40, total = 1000, type = "once", storage = 190131, storagecount = 190132, 
	rewards = { 
	{3043, 20},
		},
	},
	{name = "Ogre Sage", color = 70, total = 1000, type = "repeatable", storage = 190570, storagecount = 190571, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Ogre Ruffian", color = 70, total = 1000, type = "repeatable", storage = 190572, storagecount = 190573, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Ogre Rowdy", color = 70, total = 1000, type = "repeatable", storage = 190575, storagecount = 190576, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Ogre Shaman", color = 70, total = 1000, type = "repeatable", storage = 190589, storagecount = 190590, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Gazer Spectre", color = 40, total = 1000, type = "repeatable", storage = 190596, storagecount = 190597, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Thanatursus", color = 40, total = 1000, type = "repeatable", storage = 190598, storagecount = 190599, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Priestess Of The Wild Sun", color = 40, total = 1000, type = "repeatable", storage = 190580, storagecount = 190581, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Black Sphinx Acolyte", color = 40, total = 1000, type = "repeatable", storage = 190582, storagecount = 190583, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Burning Gladiator", color = 40, total = 1000, type = "repeatable", storage = 190585, storagecount = 190586, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Pirat Bombardier", color = 10, total = 1000, type = "repeatable", storage = 190532, storagecount = 190533, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Pirat Mate", color = 10, total = 1000, type = "repeatable", storage = 190534, storagecount = 190535, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Pirat Cutthroat", color = 10, total = 1000, type = "repeatable", storage = 190536, storagecount = 190537, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Pirat Scoundrel", color = 10, total = 1000, type = "repeatable", storage = 190538, storagecount = 190539, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Cloak Of Terror", color = 40, total = 1000, type = "repeatable", storage = 190032, storagecount = 190033, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Hellhound", color = 40, total = 500, type = "repeatable", storage = 190732, storagecount = 190733, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Nightmare", color = 40, total = 500, type = "repeatable", storage = 190734, storagecount = 190735, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Demon", color = 40, total = 500, type = "repeatable", storage = 190736, storagecount = 190737, 
	rewards = { 
	{"exp", 300000},
		},
	},
	{name = "Vibrant Phantom", color = 40, total = 1000, type = "repeatable", storage = 190034, storagecount = 190035, 
	rewards = { 
	{"exp", 3000000},
		},
	},
	
	{name = "Courage Leech", color = 40, total = 1000, type = "repeatable", storage = 190036, storagecount = 190037, 
	rewards = { 
	{"exp", 3000000},
		},
	},
	
	{name = "Brachiodemon", color = 40, total = 1000, type = "repeatable", storage = 190038, storagecount = 190039, 
	rewards = { 
	{"exp", 3000000},
		},
	},
	
	{name = "Infernal Demon", color = 40, total = 1000, type = "once", storage = 190040, storagecount = 190041, 
	rewards = { 
	{34109, 2},
		},
	},
	
	{name = "Infernal Phantom", color = 40, total = 1000, type = "repeatable", storage = 190042, storagecount = 190043, 
	rewards = { 
	{"exp", 3000000},
		},
	},
	{name = "Demon Outcast", color = 40, total = 1000, type = "repeatable", storage = 190680, storagecount = 190681, 
	rewards = { 
	{"exp", 3000000},
		},
	},
	{name = "Juggernaut", color = 40, total = 1000, type = "once", storage = 190044, storagecount = 190045, 
	rewards = { 
	{3422, 1},
		},
	},
	
	{name = "Dawnfire Asura", color = 60, total = 1000, type = "repeatable", storage = 190046, storagecount = 190047, 
	rewards = { 
		{3043, 40},
	{"exp", 2000000},
		},
	},
	{name = "True Midnight Asura", color = 60, total = 1000, type = "repeatable", storage = 197432, storagecount = 197433, 
	rewards = { 
		{3043, 40},
	{"exp", 2000000},
		},
	},
	{name = "Frost Flower Asura", color = 60, total = 1000, type = "repeatable", storage = 190070, storagecount = 190071, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Freakish Lost Soul", color = 40, total = 1000, type = "repeatable", storage = 190073, storagecount = 190074, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Flimsy Lost Soul", color = 40, total = 1000, type = "repeatable", storage = 190075, storagecount = 190076, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Mean Lost Soul", color = 40, total = 1000, type = "repeatable", storage = 190077, storagecount = 190078, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Crazed Winter Vanguard", color = 20, total = 1000, type = "repeatable", storage = 190080, storagecount = 190081, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Crazed Winter Rearguard", color = 20, total = 1000, type = "repeatable", storage = 190082, storagecount = 190083, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Soul-Broken Harbinger", color = 40, total = 1000, type = "repeatable", storage = 190084, storagecount = 190085, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Breach Brood", color = 40, total = 1000, type = "repeatable", storage = 190086, storagecount = 190087, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Reality Reaver", color = 40, total = 1000, type = "repeatable", storage = 190088, storagecount = 190089, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Sparkion", color = 40, total = 1000, type = "repeatable", storage = 190091, storagecount = 190092, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Werelion", color = 40, total = 1000, type = "repeatable", storage = 190094, storagecount = 190095, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Werelioness", color = 40, total = 1000, type = "repeatable", storage = 190096, storagecount = 190097, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Dark Carnisylvan", color = 30, total = 1000, type = "repeatable", storage = 190646, storagecount = 190647, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Poisonous Carnisylvan", color = 30, total = 1000, type = "repeatable", storage = 190648, storagecount = 190649, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Hulking Carnisylvan", color = 30, total = 1000, type = "repeatable", storage = 190650, storagecount = 190651, 
	rewards = { 
	{"exp", 2000000},
		},
	},
	{name = "Girtablilu Warrior", color = 40, total = 1000, type = "once", storage = 190052, storagecount = 190053, 
	rewards = {   
	{"exp", 10000000},
		},
	},
	
	{name = "Dark Carnisylvan", color = 30, total = 1000, type = "once", storage = 190062, storagecount = 190063, 
	rewards = { 
	{"exp", 10000000},
		},
	},
{name = "Grimeleech", color = 40, total = 1000, type = "repeatable", storage = 155210, storagecount = 155211, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Vaxclaw", color = 40, total = 1000, type = "repeatable", storage = 155212, storagecount = 155213, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Fury", color = 40, total = 1000, type = "repeatable", storage = 155214, storagecount = 155215, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Hellflayer", color = 40, total = 1000, type = "repeatable", storage = 155216, storagecount = 155217, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Destroyer", color = 40, total = 1000, type = "repeatable", storage = 155218, storagecount = 155219, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Midnight Asura", color = 60, total = 1000, type = "repeatable", storage = 155220, storagecount = 155221, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "True Dawnfire Asura", color = 60, total = 1000, type = "repeatable", storage = 155222, storagecount = 155223, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "True Frost Flower Asura", color = 60, total = 1000, type = "repeatable", storage = 155224, storagecount = 155225, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Cobra Scout", color = 50, total = 1000, type = "repeatable", storage = 155235, storagecount = 155236, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Cobra Vizier", color = 50, total = 1000, type = "repeatable", storage = 155237, storagecount = 155238, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Cobra Assassin", color = 50, total = 1000, type = "repeatable", storage = 155239, storagecount = 155240, 
	rewards = { 
		{"3043", 30},
	{"exp", 1000000},
		},
	},
	{name = "Crazed Summer Rearguard", color = 80, total = 1000, type = "repeatable", storage = 155242, storagecount = 155243, 
	rewards = { 
		{"3043", 35},
	{"exp", 1000000},
		},
	},
	{name = "Crazed Summer Vanguard", color = 80, total = 1000, type = "repeatable", storage = 155244, storagecount = 155245, 
	rewards = { 
		{"3043", 50},
	{"exp", 1000000},
		},
	},
}

squareWaitTime = 5000
taskQuestLog = 45123 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60 

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
		if data.name:lower() == name:lower() then
			return data
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
		player:say('Task: '..data.name ..' - ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end
