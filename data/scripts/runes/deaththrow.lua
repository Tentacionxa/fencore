local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, maglevel)
    local min = (level) + (maglevel * 40)
    local max = (level) + (maglevel * 65)
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
    local target = Creature(var:getNumber()) -- Pobieramy cel czaru

    if target and target:isPlayer() then -- Sprawdzamy, czy celem jest gracz
        creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE) -- Wyślij wiadomość o niemożliwości rzucenia czaru
        return false -- Anuluj rzucenie runy
    end

    return combat:execute(creature, var) -- Jeżeli cel nie jest graczem, wykonaj atak
end

rune:id(250)
rune:group("attack")
rune:name("death throw rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_SUDDENDEATH_RUNE)
rune:runeId(46246)
rune:allowFarUse(true)
rune:charges(3)
rune:level(2000)
rune:magicLevel(15)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(false) -- True = Solid / False = Creature
rune:vocation("druid;true", "elder druid;true","sorcerer;true","master sorcerer;true")
rune:register()