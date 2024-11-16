local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
    local skillTotal = skill * attack
    local levelTotal = player:getLevel() / 5

    -- Apply a 40% increase over the "Fierce Berserk" multipliers
    local baseMin = ((skillTotal * 0.17) + 13) + levelTotal
    local baseMax = ((skillTotal * 0.20) + 34) + levelTotal

    -- Conservative scaling with slight increase
    local levelScalingFactor = 1 + math.sqrt(player:getLevel() / 1200) * 1.4 -- Increased scaling factor

    local min = baseMin * levelScalingFactor
    local max = baseMax * levelScalingFactor

    -- Optional cap to avoid overpowered damage
    local maxScalingCap = 2.5 -- Cap on scaling
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.4, -max * 2.5 -- Adjusted multipliers for a 40% increase
end



combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(62)
spell:name("Annihilation")
spell:words("exori gran ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ANNIHILATION)
spell:level(110)
spell:mana(300)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
