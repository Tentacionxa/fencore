local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE7, AREADIAGONAL_WAVE7)
combat:setArea(area)



function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
			local min = (level) + (maglevel * 16) +14
			local max = (level) + (maglevel * 19)+19
			return -min, -max
else if  level >= 1500  and level <= 1999 then

local min = (level) + (maglevel * 13)+10
			local max = (level) + (maglevel * 15)+13
			return -min, -max

else if  level >= 700 and level <= 1499 then

local min = (level) + (maglevel * 10)+8
			local max = (level) + (maglevel * 13.5)+11
			return -min, -max
elseif level >= 2 and level <= 699 then
local min = (level) + (maglevel * 7)+5
			local max = (level) + (maglevel * 12.5)+10
			return -min, -max
end
end
end
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
