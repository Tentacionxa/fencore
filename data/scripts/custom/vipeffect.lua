local globalevent = GlobalEvent("staffvip")

local staffEffect = 40
local vipEffect = 50

function globalevent.onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        local position = player:getPosition()
        if player:getGroup():getId() == 2 or player:getGroup():getId() == 3 then
            player:say("TUTOR", TALKTYPE_MONSTER_SAY)
        elseif player:getGroup():getId() == 4 or player:getGroup():getId() == 4 or player:getGroup():getId() == 4 then
            player:say("Streamer", TALKTYPE_MONSTER_SAY)
                elseif player:isVip() then
            player:say("VIP", TALKTYPE_MONSTER_SAY)
        end
    end
    return true
end

globalevent:interval(10000)
globalevent:register()
