local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))



function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()

	local min = (level / 5) + (skill + attack) * 4.0
	local max = (level / 5) + (skill + attack) * 4.65

	return -min * 1.1, -max * 1.5 -- TODO : Use New Real Formula instead of an %
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(80)
spell:name("Rookie Slash")
spell:words("xora ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BERSERK)
spell:level(35)
spell:mana(55)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("none;true")
spell:register()
