local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    if creature:getCondition(CONDITION_FIRE) then
        creature:removeCondition(CONDITION_FIRE)
    end
    if creature:getCondition(CONDITION_CURSED) then
        creature:removeCondition(CONDITION_CURSED)
    end
    if creature:getCondition(CONDITION_ENERGY) then
        creature:removeCondition(CONDITION_ENERGY)
    end
    if creature:getCondition(CONDITION_POISON) then
        creature:removeCondition(CONDITION_POISON)
    end
    return true
end

spell:name("Ultimate Cure")
spell:words("exana ultimate")
spell:group("healing")
spell:vocation("sorcerer;true", "master sorcerer;true","druid;true", "elder druid;true", "paladin;true", "royal paladin;true", "knight;true", "elite knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_CURE_BURNING)
spell:id(600)
spell:cooldown(6000)
spell:groupCooldown(1000)
spell:level(250)
spell:mana(300)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
