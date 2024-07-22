local config = {
    teleportId = 25047,
    days = {
        ["Sunday"] = {Position(32325, 31787, 6), Position(31934, 32001, 8)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(31961, 32000, 8),
    bossName     = 'Morshabaal',
    spawnTime    = '18:00:00'
}

local MorshabaalRespawn = GlobalEvent("Morshabaal")
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
            Game.broadcastMessage(config.bossName .. ' A teleport has appeared in Carlin center. Morshabaal is waiting for his revenge', MESSAGE_GAME_HIGHLIGHT)
        end, 5000)
    end
    return true
end

MorshabaalRespawn:time(config.spawnTime)
MorshabaalRespawn:register()
