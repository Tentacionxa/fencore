local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 25.2) + 7
	local max = (level / 5) + (maglevel * 35.5) + 17
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(player, var, isHotkey)
    player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
    local targetPosition = var:getPosition()

    for i = 0, 4 do
        addEvent(function()
            combat:execute(player, var)
            targetPosition:sendSingleSoundEffect(1016, player)
        end, i * 1000 + 250)
    end

    addEvent(function()
        for i = 0, 20 do
            addEvent(function()
                for j = 1, 4 do
                    local hitPosition = targetPosition:getRandomPosition(2, 2)
                    local fromPosition =
                        Position(hitPosition.x - 10, hitPosition.y - 10,
                                 hitPosition.z)
                    doSendDistanceShoot(fromPosition, hitPosition, CONST_ANI_ENERGY)
                    addEvent(function()
                        hitPosition:sendMagicEffect(CONST_ME_BIGCLOUDS)
                    end, 220)
                end
            end, 200 * i)
        end
    end, 200)
    return true
end

rune:id(264)
rune:group("attack")
rune:name("storm launch rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_STONE_SHOWER_RUNE)
rune:runeId(46248)
rune:allowFarUse(true)
rune:charges(4)
rune:level(2000)
rune:magicLevel(45)
rune:cooldown(5 * 1000)
rune:groupCooldown(2 * 1000)
rune:vocation("druid;true", "elder druid;true","sorcerer;true","master sorcerer;true")
rune:register()