local spell = Spell("instant")

local combat = Combat()
combat:setArea(createCombatArea(AREA_SQUARE1X1))
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level / 5) + (skill + 2 * attack) * 3.3
    local max = (level / 5) + (skill + 2 * attack) * 5.1
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    min = min * math.min(levelScalingFactor, 2.4)
    max = max * math.min(levelScalingFactor, 2.4)

    -- Increase damage by 25%
    return -min * 1.44 * 1.25, -max * 2.16 * 1.25
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function spell.onCastSpell(player, var)
    local playerPosition = player:getPosition()
    local target = Creature(var:getNumber())
    if not target then
        return false
    end
    local targetPosition = target:getPosition()
    local flyPos = Position(playerPosition.x - 2, playerPosition.y - 15, playerPosition.z)

    -- Reduced primary visual effect loop
    for i = 0, 10 do -- Reduced from 20 iterations
        addEvent(
            function()
                doSendDistanceShoot(playerPosition, flyPos, CONST_ANI_WHIRLWINDSWORD)
            end,
            40 * i -- Slightly increased interval to reduce visual load
        )
    end

    -- Optimized animation loop
    addEvent(
        function()
            for i = 0, 15 do -- Reduced from 30 iterations
                addEvent(
                    function()
                        local hitPosition = targetPosition:getRandomPosition(2, 2)
                        doSendDistanceShoot(flyPos, hitPosition, CONST_ANI_WHIRLWINDSWORD)
                        addEvent(
                            function()
                                hitPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
                            end,
                            300 -- Increased delay to reduce frequent effects
                        )
                    end,
                    400 * i -- Increased interval
                )
            end
        end,
        1000
    )

    -- Reduced damage execution loop
    for i = 1, 3 do -- Reduced from 5 iterations
        addEvent(
            function()
                combat:execute(player, Variant(targetPosition))
            end,
            800 * i -- Increased interval for better spread
        )
    end

    return true
end

spell:name("Enhanced Berserk")
spell:words("exori hex")
spell:group("attack")
spell:vocation("knight;true", "elite knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIERCE_BERSERK)
spell:id(106)
spell:cooldown(6 * 1000)
spell:groupCooldown(0 * 1000)
spell:mana(500)
spell:needTarget(true)
spell:range(7)
spell:level(2000)
spell:soul(0)
spell:isAggressive(true)
spell:needLearn(false)
spell:register()
