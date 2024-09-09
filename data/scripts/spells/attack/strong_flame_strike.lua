local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 15)
													local max = (level) + (maglevel * 19)
											return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 10)
									local max = (level) + (maglevel * 16)
									return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 8)
													local max = (level) + (maglevel * 14.5)
									return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 6)
							local max = (level) + (maglevel * 13)
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
spell:id(150)
spell:name("Strong Flame Strike")
spell:words("exori gran flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_STRONG_FLAME_STRIKE)
spell:level(70)
spell:mana(60)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
