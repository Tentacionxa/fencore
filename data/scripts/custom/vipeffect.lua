local globalevent = GlobalEvent("staffvip")

local staffEffect = 40
local vipEffect = 50

function globalevent.onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        local position = player:getPosition()
        if player:getGroup():getAccess() > 1 and not player:isInGhostMode() then
            player:say("STAFF", TALKTYPE_MONSTER_SAY)
            position:sendMagicEffect(staffEffect)
        elseif player:isVip() then
            player:say("VIP", TALKTYPE_MONSTER_SAY)
            position:sendMagicEffect(vipEffect)
        end
    end
    return true
end

globalevent:interval(10000)
globalevent:register()