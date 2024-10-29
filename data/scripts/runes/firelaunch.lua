local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 80) + 7
	local max = (level / 5) + (maglevel * 130) + 17
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(262)
rune:group("attack")
rune:name("fire launch rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_GREAT_FIREBALL_RUNE)
rune:runeId(46247)
rune:allowFarUse(true)
rune:charges(4)
rune:level(2000)
rune:magicLevel(45)
rune:cooldown(5 * 1000)
rune:groupCooldown(2 * 1000)
rune:vocation("druid;true", "elder druid;true","sorcerer;true","master sorcerer;true")
rune:register()
