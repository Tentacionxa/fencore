local config = {
    teleportId = 25047,
    days = {
        ["Friday"] = {Position(32372, 32219, 6), Position(32298, 32474, 8)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(32297, 32447, 8),
    bossName     = 'Orshabaal',
    spawnTime    = '18:00:00'
}

local MorshabaalRespawn = GlobalEvent("MorshabaalRespawn")
function MorshabaalRespawn.onTime(interval)
    local day = config.days[os.date("%A")]
    if day then
        local item = Game.createItem(config.teleportId, 1, day[1])
        if item then
            if not item:isTeleport() then
                item:remove()
                return false
            end
            item:setDestination(day[2])
        end
        addEvent(function()
            Game.createMonster(config.bossName, config.bossPosition, false, true)
            Game.broadcastMessage(config.bossName .. ' A teleport has appeared in Thais center. Orshabaal is waiting for his revenge', MESSAGE_GAME_HIGHLIGHT)
        end, 5000)
    end
    return true
end

MorshabaalRespawn:time(config.spawnTime)
MorshabaalRespawn:register()
