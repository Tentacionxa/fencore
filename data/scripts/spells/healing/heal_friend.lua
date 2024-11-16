local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)
    -- Base max healing
    local max = (level) + (maglevel * 60)
    
    -- Scaling factor based on player level
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    local maxScalingCap = 2.4
    if levelScalingFactor > maxScalingCap then
        levelScalingFactor = maxScalingCap
    end
    
    -- Apply scaling to max healing
    max = max * levelScalingFactor

    return 0, -max -- Removed minimum value (set to 0), only using the max value
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return combat:execute(creature, variant)
end

spell:name("Heal Friend")
spell:words("exura sio")
spell:group("healing")
spell:vocation("druid;true", "elder druid;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HEAL_FRIEND)
spell:id(84)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(18)
spell:mana(120)
spell:needTarget(true)
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:allowOnSelf(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()
