taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
        {x = 32341, y = 32229, z = 7},
        {x = 31469, y = 31764, z = 7},
    },
	selectLanguage = 1 -- options: 1 = pt_br or 2 = english
	uniqueTask = true, -- do one task at a time
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