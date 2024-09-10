local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)



function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
			local min = (level) + (maglevel * 23)
			local max = (level) + (maglevel * 26)
			return -min, -max
else if  level >= 1500  and level <= 1999 then

local min = (level) + (maglevel * 18)
			local max = (level) + (maglevel * 20)
			return -min, -max

else if  level >= 700 and level <= 1499 then

local min = (level) + (maglevel * 13)
			local max = (level) + (maglevel * 18)
			return -min, -max
elseif level >= 2 and level <= 699 then
local min = (level) + (maglevel * 9)
			local max = (level) + (maglevel * 14)
			return -min, -max
end
end
end
end



combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Salvation")
spell:words("exura gran san")
spell:group("healing")
spell:vocation("paladin;true", "royal paladin;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_SALVATION)
spell:id(36)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(60)
spell:mana(210)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
