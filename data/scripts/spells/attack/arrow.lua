local spell = Spell("instant")

local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level / 5) + (skill + attack) * 2
    local max = (level / 5) + (skill + attack) * 3
    return -min * 1.3, -max * 1.7
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function spell.onCastSpell(player, var)
    local playerPosition = player:getPosition()
    local targetPosition = Creature(var:getNumber()):getPosition()
    local flyPos = Position(playerPosition.x - 2, playerPosition.y - 15, playerPosition.z)

    for i = 0, 20 do
        addEvent(
            function()
                doSendDistanceShoot(playerPosition, flyPos, CONST_ANI_ARROW)
            end,
            20 * i
        )
    end

    addEvent(
        function()
            for i = 0, 30 do
                addEvent(
                    function() 
                        local hitPosition = targetPosition:getRandomPosition(2, 2)
                        doSendDistanceShoot(flyPos, hitPosition, CONST_ANI_ARROW)
                        addEvent(
                            function()
                                hitPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
                            end,
                            220
                        )
                    end,
                200 * i)
            end
        end,
        1000
    )

    addEvent(
        function()
            for i = 1, 6 do
                addEvent(
                    function()
                        combat:execute(player, Variant(targetPosition))
                    end,
                    1000 * i
                )
            end
        end,
        500
    )

    return true
end

spell:name("Arrow Rain")
spell:words("exevo holo")
spell:group("attack")
spell:vocation("paladin;true", "royal paladin;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GREAT_FIRE_WAVE)
spell:id(51)
-- spell:cooldown(0 * 1000)
-- spell:groupCooldown(0 * 1000)
-- spell:mana(0)
spell:cooldown(5 * 1000)
spell:groupCooldown(2 * 1000)
spell:mana(500)
spell:needTarget(true)
spell:range(7)
spell:level(2000)
spell:soul(0)
spell:isAggressive(true)
spell:needLearn(false)
spell:register()
