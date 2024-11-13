
local function onMovementRemoveProtection(playerId, oldPos, time)
	local player = Player(playerId)
	if not player then
		return true
	end

	local playerPos = player:getPosition()
	if (playerPos.x ~= oldPos.x or playerPos.y ~= oldPos.y or playerPos.z ~= oldPos.z) or player:getTarget() then
		player:kv():remove("combat-protection")
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, playerId, oldPos, time - 1)
end

local playerLoginGlobal = CreatureEvent("PlayerLoginGlobal")

-- Define rates for each day
local dailyRates = {
    ["Monday"] = { expRate = 160, skillRate = 300, spawnRate = 160, lootRate = 150, bossLootRate = 130 },
    ["Tuesday"] = { expRate = 170, skillRate = 300, spawnRate = 140, lootRate = 150, bossLootRate = 130 },
    ["Wednesday"] = { expRate = 180, skillRate = 300, spawnRate = 125, lootRate = 150, bossLootRate = 130 },
    ["Thursday"] = { expRate = 160, skillRate = 300, spawnRate = 170, lootRate = 150, bossLootRate = 130 },
    ["Friday"] = { expRate = 250, skillRate = 150, spawnRate = 130, lootRate = 250, bossLootRate = 100 },
    ["Saturday"] = { expRate = 250, skillRate = 150, spawnRate = 140, lootRate = 250, bossLootRate = 100 },
    ["Sunday"] = { expRate = 250, skillRate = 150, spawnRate = 150, lootRate = 250, bossLootRate = 100 }
}

-- Function to set global rates
local function setGlobalRates()
    local currentDay = os.date("%A")
    local rates = dailyRates[currentDay]
    
    if rates then
        SCHEDULE_EXP_RATE = rates.expRate
        SCHEDULE_SKILL_RATE = rates.skillRate
        SCHEDULE_SPAWN_RATE = rates.spawnRate
        SCHEDULE_LOOT_RATE = rates.lootRate
        SCHEDULE_BOSS_LOOT_RATE = rates.bossLootRate
    end
end

-- Call setGlobalRates to apply rates on login
local function setPlayerRates(player)
    setGlobalRates()
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Today's rates: ExpRate %d%%, SkillRate %d%%, SpawnRate %d%%, LootRate %d%%, BossLootRate %d%%.",
        SCHEDULE_EXP_RATE, SCHEDULE_SKILL_RATE, SCHEDULE_SPAWN_RATE, SCHEDULE_LOOT_RATE, SCHEDULE_BOSS_LOOT_RATE))
end

function playerLoginGlobal.onLogin(player)
    -- Set rates for the player on login
    setPlayerRates(player)
    
	-- Welcome message
	local loginStr
	if player:getLastLoginSaved() == 0 then
		loginStr = "Please choose your outfit."
		player:sendOutfitWindow()
		local startStreakLevel = configManager.getNumber(configKeys.START_STREAK_LEVEL)
		if startStreakLevel > 0 then
			player:setStreakLevel(startStreakLevel)
		end

		db.query("UPDATE `players` SET `istutorial` = 0 WHERE `id` = " .. player:getGuid())
	else
		loginStr = string.format("Your last visit in %s: %s.", SERVER_NAME, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_LOGIN, loginStr)

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local hasPromotion = player:kv():get("promoted")
		if not player:isPromoted() and hasPromotion then
			player:setVocation(promotion)
		end
	elseif player:isPromoted() then
		player:setVocation(vocation:getDemotion())
	end

	-- Boosted creatures and bosses
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, string.format("Today's boosted creature: %s.\nBoosted creatures yield more experience points, carry more loot than usual, and respawn at a faster rate.", Game.getBoostedCreature()))
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, string.format("Today's boosted boss: %s.\nBoosted bosses contain more loot and count more kills for your Bosstiary.", Game.getBoostedBoss()))

	-- Rewards
	local rewards = #player:getRewardList()
	if rewards > 0 then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d reward%s in your reward chest.", rewards, rewards > 1 and "s" or ""))
	end

	

	-- Recruiter Outfit
	local resultId = db.storeQuery("SELECT `recruiter` FROM `accounts` WHERE `id`= " .. getAccountNumberByPlayerName(getPlayerName(player)))
	if resultId then
		local recruiterStatus = Result.getNumber(resultId, "recruiter")
		local sex = player:getSex()
		local outfitId = (sex == 1) and 746 or 745
		for outfitAddOn = 0, 2 do
			if recruiterStatus >= outfitAddOn * 3 + 1 then
				if not player:hasOutfit(outfitId, outfitAddOn) then
					if outfitAddOn == 0 then
						player:addOutfit(outfitId)
					else
						player:addOutfitAddon(outfitId, outfitAddOn)
					end
				end
			end
		end
	end

	-- Send Client Exp Display
	if configManager.getBoolean(configKeys.XP_DISPLAY_MODE) then
		local baseRate = player:getFinalBaseRateExperience() * 100
		if configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
			local vipBonusExp = configManager.getNumber(configKeys.VIP_BONUS_EXP)
			if vipBonusExp > 0 and player:isVip() then
				vipBonusExp = (vipBonusExp > 100 and 100) or vipBonusExp
				baseRate = baseRate * (1 + (vipBonusExp / 100))
				player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Normal base xp is: " .. baseRate .. "%, because you are VIP, bonus of " .. vipBonusExp .. "%")
			end
		end

		player:setBaseXpGain(baseRate)
	end

	player:setStaminaXpBoost(player:getFinalBonusStamina() * 100)
	player:getFinalLowLevelBonus()

	-- Updates the player's VIP status and executes corresponding actions if applicable.
	if configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
		local isVipNow = player:isVip()
		local wasVip = player:kv():scoped("account"):get("vip-system") or false

		if wasVip ~= isVipNow then
			if wasVip then
				player:onRemoveVip()
			else
				player:onAddVip(player:getVipDays())
			end
		end

		if isVipNow then
			CheckPremiumAndPrint(player, MESSAGE_LOGIN)
		end
	end

	-- Set Ghost Mode
	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		player:setGhostMode(true)
	end

	-- Resets
	if _G.OnExerciseTraining[player:getId()] then
		stopEvent(_G.OnExerciseTraining[player:getId()].event)
		_G.OnExerciseTraining[player:getId()] = nil
		player:setTraining(false)
	end

	local playerId = player:getId()
	_G.NextUseStaminaTime[playerId] = 1
	_G.NextUseXpStamina[playerId] = 1
	_G.NextUseConcoctionTime[playerId] = 1
	DailyReward.init(playerId)

	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Remove Boss Time
	if GetDailyRewardLastServerSave() >= player:getLastLoginSaved() then
		player:setRemoveBossTime(1)
	end

	-- Remove combat protection
	local isProtected = player:kv():get("combat-protection") or 0
	if isProtected < 1 then
		player:kv():set("combat-protection", 1)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end

	-- Change support outfit to a normal outfit to open customize character without crashes
	local playerOutfit = player:getOutfit()
	if table.contains({ 75, 266, 302 }, playerOutfit.lookType) then
		playerOutfit.lookType = 136
		playerOutfit.lookAddons = 0
		player:setOutfit(playerOutfit)
	end

	player:initializeLoyaltySystem()
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("BossParticipation")
	player:registerEvent("UpdatePlayerOnAdvancedLevel")
	return true
end

playerLoginGlobal:register()
