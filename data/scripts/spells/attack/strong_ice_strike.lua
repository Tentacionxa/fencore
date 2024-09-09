local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 4.35)
																	local max = (level) + (maglevel * 5.85)
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 4.10)
																	local max = (level) + (maglevel * 5.30)
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 4.55)
																	local max = (level) + (maglevel * 4.95)
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 4.65)
																	local max = (level) + (maglevel * 4.85)
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
spell:id(152)
spell:name("Strong Ice Strike")
spell:words("exori gran frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_STRONG_ICE_STRIKE)
spell:level(80)
spell:mana(60)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
