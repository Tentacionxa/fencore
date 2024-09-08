local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 14)
									local max = (level) + (maglevel * 24)
									return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 10)
									local max = (level) + (maglevel * 21)
									return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 8)
									local max = (level) + (maglevel * 18)
									return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 5)
									local max = (level) + (maglevel * 16)
									return -min, -max
	end
	end
	end
	end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return combat:execute(creature, variant)
end

spell:name("Heal Friend")
spell:words("exura sio")
spell:group("healing")
spell:vocation("druid;true", "elder druid;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HEAL_FRIEND)
spell:id(84)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(18)
spell:mana(120)
spell:needTarget(true)
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:allowOnSelf(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()
