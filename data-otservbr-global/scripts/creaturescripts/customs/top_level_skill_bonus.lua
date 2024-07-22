-- TopSkillBonus.lua
-- Credits:  Adaptado para o Canary por NvSo

local TopSkillBonus = CreatureEvent("TopSkillBonus")

function TopSkillBonus.onLogin(player)
    local skillNames = {
        "skill_axe",
        "skill_club",
        "skill_dist",
        "skill_fist",
        "maglevel",
        "skill_sword",
        "skill_shielding"
    }
    
    local skillBonus = 10 -- Bonus Amount
    local skillBonuses = {}
    
    local function getSkillParam(skillName)
        if skillName == "skill_axe" or skillName == "skill_sword" or skillName == "skill_club" then
            return CONDITION_PARAM_SKILL_MELEE
        elseif skillName == "skill_dist" then
            return CONDITION_PARAM_SKILL_DISTANCE
        elseif skillName == "skill_fist" then
            return CONDITION_PARAM_SKILL_FIST
        elseif skillName == "maglevel" then
            return CONDITION_PARAM_STAT_MAGICPOINTS
        elseif skillName == "skill_shielding" then
            return CONDITION_PARAM_SKILL_SHIELD
        end
    end
    
    local function getSkillDisplayName(skillName)
        if skillName == "skill_axe" then
            return "Axe"
        elseif skillName == "skill_sword" then
            return "Sword"
        elseif skillName == "skill_club" then
            return "Club"
        elseif skillName == "skill_dist" then
            return "Distance"
        elseif skillName == "skill_fist" then
            return "Fist"
        elseif skillName == "maglevel" then
            return "Magic Level"
        elseif skillName == "skill_shielding" then
            return "Shielding"
        end
    end
    
    for _, skillName in ipairs(skillNames) do
        skillBonuses[skillName] = Condition(CONDITION_ATTRIBUTES)
        skillBonuses[skillName]:setParameter(CONDITION_PARAM_TICKS, -1)
        skillBonuses[skillName]:setParameter(getSkillParam(skillName), skillBonus)
    end
    
    local topSkill = ""
    local topBonus = nil
    local topValue = 0
    
    for _, skillName in ipairs(skillNames) do
        local resultId = db.storeQuery("SELECT name, " .. skillName .. " FROM players WHERE group_id < 2 ORDER BY " .. skillName .. " DESC LIMIT 1;")
        
        if resultId ~= nil then
            local playerName = Result.getString(resultId, "name")
            local playerSkill = Result.getNumber(resultId, skillName)
            
            if playerName == player:getName() and playerSkill > topValue then
                topSkill = skillName
                topBonus = skillBonuses[skillName]
                topValue = playerSkill
            end
            
            Result.free(resultId)
        end
    end
    
    if topSkill ~= "" and topBonus then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations for your effort in being the Top " .. getSkillDisplayName(topSkill) .. " skill. You will receive a +" .. skillBonus .. " skill bonus.")
        player:addCondition(topBonus)
    end
    
    return true
end

TopSkillBonus:register()