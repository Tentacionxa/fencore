local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
    -- Base max healing
    local max = (level) + (maglevel * 60)
    -- Scaling factor based on player level
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    local maxScalingCap = 3.5
    if levelScalingFactor > maxScalingCap then
        levelScalingFactor = maxScalingCap
    end
    
    -- Apply scaling to max healing
    max = max * levelScalingFactor

    return 0, -max -- Removed minimum value (set to 0), only using the max value
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if creature:isPlayer() and var:getNumber() == creature:getId() then
		creature:sendCancelMessage("You can't cast this spell to yourself.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	else
		return combat:execute(creature, var)
	end
end

--spell:group("healing")
--spell:id(242)
--spell:name("Nature's Embrace")
--spell:words("exura gran sio")
--spell:castSound(SOUND_EFFECT_TYPE_SPELL_NATURES_EMBRACE)
--spell:level(300)
--spell:mana(400)
--spell:isPremium(true)
--spell:needTarget(true)
---spell:cooldown(60 * 1000)
--spell:groupCooldown(1 * 1000)
--spell:isAggressive(false)
--spell:isBlockingWalls(true)
--spell:hasParams(true)
--spell:hasPlayerNameParam(true)
--spell:vocation("druid;true", "elder druid;true")
--spell:needLearn(false)
--spell:register()
