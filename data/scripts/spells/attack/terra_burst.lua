local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_RING1_BURST3))

function onGetFormulaValues(player, level, maglevel)
    -- Calculate base maximum damage and increase it by 50%
    local max = (((level / 5) + (maglevel * 2.053) + 12) * 0.7275) * 2.1 -- Increased by 50%

    -- Apply scaling factor similar to "exori"
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 2.2
    if levelScalingFactor > maxScalingCap then
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return 0, -max -- No minimum damage, only maximum damage applied
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:revelationStageWOD("Twin Burst")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local cooldown = 0
	if grade >= 3 then
		cooldown = 14
	elseif grade >= 2 then
		cooldown = 18
	elseif grade >= 1 then
		cooldown = 22
	end

	var.instantName = "Twin Burst"
	if combat:execute(creature, var) then
		-- Ice cooldown
		local condition1 = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 262)
		condition1:setTicks((cooldown * 1000) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		creature:addCondition(condition1)
		-- Earth cooldown
		local condition2 = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 263)
		condition2:setTicks((cooldown * 1000) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		creature:addCondition(condition2)
		return true
	end
	return false
end

spell:group("attack")
spell:id(263)
spell:name("Terra Burst")
spell:words("exevo ulus tera")
spell:level(1)
spell:mana(170)
spell:isPremium(true)
spell:cooldown(4000) -- Cooldown is calculated on the casting
spell:groupCooldown(2 * 1000)
spell:needLearn(true)
spell:vocation("druid;true", "elder druid;true")
spell:register()
