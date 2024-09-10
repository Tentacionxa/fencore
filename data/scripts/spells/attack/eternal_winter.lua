local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 8)
					local max = (level) + (maglevel * 20)
					return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 7)
					local max = (level) + (maglevel * 18)
					return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 5)
					local max = (level) + (maglevel * 15)
					return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 4)
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

spell:group("attack", "focus")
spell:id(118)
spell:name("Eternal Winter")
spell:words("exevo gran mas frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ETERNAL_WINTER)
spell:level(60)
spell:mana(1050)
spell:isPremium(true)
spell:range(5)
spell:isSelfTarget(true)
spell:cooldown(12 * 1000)
spell:groupCooldown(2 * 1000, 12 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
