local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


function onGetFormulaValues(player, level, magicLevel)
	if level >= 2000 then
			local min = (level / 5) + (magicLevel * 40) +42
			local max = (level / 5) + (magicLevel * 60) +90
			return min, max
else if  level >= 1500  and level <= 1999 then

local min = (level / 5) + (magicLevel * 27)
			local max = (level / 5) + (magicLevel * 40)
			return min, max

else if  level >= 700 and level <= 1499 then

local min = (level / 5) + (magicLevel * 25)
			local max = (level / 5) + (magicLevel * 40)
			return min, max
elseif level >= 2 and level <= 699 then
local min = (level / 5) + (magicLevel* 15)
			local max = (level / 5) + (magicLevel * 30)
			return min, max
end
end
end
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Ultimate Healing")
spell:words("exura vita")
spell:group("healing")
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_HEALING)
spell:id(3)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(30)
spell:mana(160)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
