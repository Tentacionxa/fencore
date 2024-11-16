local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
    local skillTotal = skill * attack
    local levelTotal = player:getLevel() / 5

    -- Apply reduced multipliers for lower base damage
    local min = ((skillTotal * 0.015) + 3) + levelTotal -- Reduced multipliers for lower impact
    local max = ((skillTotal * 0.03) + 7) + levelTotal -- Reduced multipliers for lower impact

    -- Conservative scaling using a mild factor
    local levelScalingFactor = 1 + math.sqrt(player:getLevel() / 2000) -- Minimal growth

    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap to ensure balanced scaling at high levels
    local maxScalingCap = 1.3 -- Lower cap to keep the spell weaker
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.05, -max * 1.1 -- Further reduced final multipliers for less damage
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(61)
spell:name("Brutal Strike")
spell:words("exori ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BRUTAL_STRIKE)
spell:level(16)
spell:mana(30)
spell:isPremium(false)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
