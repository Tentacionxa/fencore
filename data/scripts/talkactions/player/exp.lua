local expRateCommand = TalkAction("!exp")
local cooldowns = {}

-- Function to get the experience stage multiplier
local function getExperienceStageMultiplier(level)
    local experienceStages = {
        { minlevel = 1, maxlevel = 50, multiplier = 200 },
        { minlevel = 50, maxlevel = 80, multiplier = 190 },
        { minlevel = 80, maxlevel = 100, multiplier = 180 },
        { minlevel = 100, maxlevel = 120, multiplier = 170 },
        { minlevel = 120, maxlevel = 140, multiplier = 160 },
        { minlevel = 140, maxlevel = 160, multiplier = 150 },
        { minlevel = 160, maxlevel = 200, multiplier = 140 },
        { minlevel = 200, maxlevel = 250, multiplier = 130 },
        { minlevel = 250, maxlevel = 300, multiplier = 120 },
        { minlevel = 300, maxlevel = 350, multiplier = 110 },
        { minlevel = 350, maxlevel = 450, multiplier = 100 },
        { minlevel = 450, maxlevel = 1000, multiplier = 50 },
        { minlevel = 1000, maxlevel = 2000, multiplier = 30 },
        { minlevel = 2000, maxlevel = 3000, multiplier = 10 },
        { minlevel = 3000, maxlevel = 4000, multiplier = 4 },
        { minlevel = 4000, maxlevel = 5000, multiplier = 2 },
        { minlevel = 5000, maxlevel = 5500, multiplier = 0.5 },
        { minlevel = 5500, maxlevel = 6000, multiplier = 0.3 },
        { minlevel = 6000, multiplier = 0.2 },
    }

    for _, stage in ipairs(experienceStages) do
        if level >= stage.minlevel and (not stage.maxlevel or level <= stage.maxlevel) then
            return stage.multiplier / 100 -- Convert to a percentage multiplier
        end
    end
    return 1 -- Default 100% multiplier if no stage is found
end

function expRateCommand.onSay(player, words, param)
    local playerId = player:getId()
    local currentTime = os.time()
    local cooldownTime = 1800 -- 30-minute cooldown

    if cooldowns[playerId] and (currentTime - cooldowns[playerId]) < cooldownTime then
        local remainingTime = cooldownTime - (currentTime - cooldowns[playerId])
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must wait " .. math.ceil(remainingTime / 60) .. " minutes before using this command again.")
        return true
    end

    cooldowns[playerId] = currentTime
    local level = player:getLevel()
    local stageMultiplier = getExperienceStageMultiplier(level)

    -- Calculate the base rate, including the VIP bonus if applicable
    local baseRate = player:getFinalBaseRateExperience() * 100
    if configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
        local vipBonusExp = configManager.getNumber(configKeys.VIP_BONUS_EXP)
        if vipBonusExp > 0 and player:isVip() then
            vipBonusExp = (vipBonusExp > 100 and 100) or vipBonusExp
            baseRate = baseRate * (1 + (vipBonusExp / 100))
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Normal base xp is: " .. baseRate .. "%, because you are VIP, bonus of " .. vipBonusExp .. "%")
        end
    end

    -- Apply Stamina Multiplier
    local staminaMultiplier = 1
    if configManager.getBoolean(configKeys.STAMINA_SYSTEM) and player:getStamina() > 2400 then
        staminaMultiplier = 1.5
    end
    local adjustedBaseRate = baseRate * staminaMultiplier -- Apply stamina multiplier

    -- Add XP Scroll Bonus
    local scrollBonusMultiplier = 0
    local activeScrollBonus = player:kv():get('scrolls_bonus')
    if activeScrollBonus and activeScrollBonus > os.time() then
        local activeScrollId = player:kv():get('scrolls')
        local scroll = Karin.Scrolls[activeScrollId]
        if scroll then
            scrollBonusMultiplier = scroll.bonus.Experience - 1
        end
    end
    local finalRate = adjustedBaseRate + (scrollBonusMultiplier * 100)-- Add scroll bonus

    -- Apply World Boost Multiplier if active (multiply at the end)
    if getGlobalStorageValue(480664) > os.time() then
        finalRate = finalRate * 2
    end

    -- Display result
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your current experience rate is: %.2f%%", finalRate))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Player Level = %d", level))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Retrieved Stage Multiplier = %.2f%%", stageMultiplier * 100))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Base Rate = %.2f%%", baseRate))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Stamina Multiplier = %.2f", staminaMultiplier))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("XP Scroll Bonus = %.2f%%", scrollBonusMultiplier * 100))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("World Boost Multiplier = %.2f", getGlobalStorageValue(480664) > os.time() and 2 or 1))

    return true
end

expRateCommand:separator(" ")
expRateCommand:groupType("normal")
expRateCommand:register()
