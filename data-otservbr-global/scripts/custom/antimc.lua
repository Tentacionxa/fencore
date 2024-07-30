local config = {
    max = 3,
    maxVip = 3,
    text = "Only 3 (FREE) & 3 (VIP) characters allowed per IP.",
    group_id = 1,  -- it apply the limit to players with a group less than or equal to the id
    milliseconds_before_kick_to_read_popup = 6500 -- 9000 = 9 seconds
}
local accepted_ip_list = {}  -- here put the Ip you whant to be allowed to use Mc/Magebomb..
function delayedKickPlayerMCLimit(cid)
    doRemoveCreature(cid)
end
local antimc = CreatureEvent("AntiMC")
function antimc.onLogin(player)
    if player:getGroup():getId() <= config.group_id then
        if isInArray(accepted_ip_list, Game.convertIpToString(player:getIp())) == false then
                if #getPlayersByIPAddress(player:getIp()) > config.max then
                    addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())               
                end
            else
                if #getPlayersByIPAddress(player:getIp()) > config.maxVip then
                    addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())               
                end    
            end
        end
            return true
    end
antimc:register()
