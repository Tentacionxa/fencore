local config = {
    topCount = 5,
    messageType = MESSAGE_EVENT_ADVANCE,
    interval = 15 * 60 * 1000 -- 15 minutes for each
}

local currentTopType = 1
local topTypes = {
    { 'Level', Player.getLevel },
   -- { 'Magic Level', Player.getMagicLevel },
   -- { 'Sword', Player.getSkillLevel },
   -- { 'Axe', Player.getSkillLevel },
   -- { 'Club', Player.getSkillLevel },
  --  { 'Distance', Player.getSkillLevel },
   -- { 'Shield', Player.getSkillLevel }
    --{ 'Fish', Player.getSkillLevel },
    --{ 'Fist', Player.getSkillLevel }
}

local globalEvent = GlobalEvent("TopLevelOnline")
function globalEvent.onThink(interval)
    local type = topTypes[currentTopType]
    local getSkill = type[2]
    local types = #topTypes
    currentTopType = math.min(types, currentTopType +1)
    if currentTopType == types then
        currentTopType = 1
    end
    local players = Game.getPlayers()
    local count = math.min(config.topCount, #players)
    if count > 0 then
        if count > 1 then
            table.sort(players, function(a, b) return getSkill(a) > getSkill(b) end)
        end
        local description = string.format("- Top %d Online / %s -\n\n", config.topCount, type[1])
        for i = 1, count do
            local p = players[i]
            description = string.format("%s%d) %s - %d%s", description, i, p:getName(), getSkill(p), (i == count and "" or "\n"))
        end
        broadcastMessage(description, config.messageType)
    end
    return true
end
globalEvent:interval(config.interval)
globalEvent:register()
