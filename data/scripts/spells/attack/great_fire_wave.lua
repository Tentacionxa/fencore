local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE7, AREADIAGONAL_WAVE7)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 13)+20
	local max = (level / 5) + (maglevel * 16)

return -min * 1.0, -max * 1.9 -- TODO : Use New Real Formula instead of an %
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
spell:cooldown(7 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
