local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE7, AREADIAGONAL_WAVE7)
combat:setArea(area)

local function onGetFormulaValues(player, level, maglevel)
    -- Calculate base maximum damage and reduce it by 20%
    local max = ((level / 5) + (maglevel * 20)) * 0.8

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
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(240)
spell:name("Great Fire Wave")
spell:words("exevo gran flam hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GREAT_FIRE_WAVE)
spell:level(38)
spell:mana(120)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
