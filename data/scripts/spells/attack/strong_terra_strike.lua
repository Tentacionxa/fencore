local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH)

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

spell:group("attack", "special")
spell:id(153)
spell:name("Strong Terra Strike")
spell:words("exori gran tera")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_STRONG_TERRA_STRIKE)
spell:level(70)
spell:mana(60)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
