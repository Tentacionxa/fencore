local globalevent = GlobalEvent("staffvip")

local staffEffect = 40
local vipEffect = 50

function globalevent.onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        local position = player:getPosition()
        if player:getGroup():getAccess() and not player:isInGhostMode() then
            player:say("STAFF", TALKTYPE_MONSTER_SAY)
            position:sendMagicEffect(staffEffect)
        elseif player:isVip() then
            player:say("VIP", TALKTYPE_MONSTER_SAY)
            position:sendMagicEffect(vipEffect)
        end
    elseif player:getGroup() == 2 then
        player:say("Tutor", TALKTYPE_MONSTER_SAY)
        position:sendMagicEffect(staffEffect)
    end

    return true
end

globalevent:interval(10000)
globalevent:register()