local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()

    -- Reduced base min and max damage calculations
    local min = (level / 5) + (skill + attack) * 1.2 -- Lower multiplier
    local max = (level / 5) + (skill + attack) * 1.6 -- Lower multiplier

    -- Conservative scaling using a mild factor
    local levelScalingFactor = 1 + math.sqrt(level / 1500) -- Minimal growth

    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 1.5 -- Lower cap for reduced scaling
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.1, -max * 1.15 -- Further reduced final multipliers for lower damage
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(107)
spell:name("Whirlwind Throw")
spell:words("exori hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_WHIRLWIND_THROW)
spell:level(28)
spell:mana(40)
spell:isPremium(true)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
