local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
			local min = (level) + (maglevel * 6)
			local max = (level) + (maglevel * 9)
			return -min, -max
else if  level >= 1500  and level <= 1999 then

local min = (level) + (maglevel * 4)
			local max = (level) + (maglevel * 6)
			return -min, -max

else if  level >= 700 and level <= 1499 then

local min = (level) + (maglevel * 2.5)
			local max = (level) + (maglevel * 5)
			return -min, -max
elseif level >= 2 and level <= 699 then
local min = (level) + (maglevel * 1.5)
			local max = (level) + (maglevel * 5)
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

spell:group("healing")
spell:id(239)
spell:name("Fair Wound Cleansing")
spell:words("exura med ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FAIR_WOUND_CLEANSING)
spell:level(300)
spell:mana(90)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:isAggressive(false)
spell:vocation("knight;true", "elite knight;true")
spell:needLearn(false)
spell:register()
