local config = {
    teleportId = 25047,
    days = {
        ["Sunday"] = {Position(32354, 32219, 7), Position(32117, 32687, 4)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(32122, 32686, 4),
    bossName     = 'Ferumbras',
    spawnTime    = '20:00:00'
}

local FerumbrasRespawn = GlobalEvent("FerumbrasRespawn")
function FerumbrasRespawn.onTime(interval)
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
            Game.broadcastMessage(config.bossName .. ' A teleport has appeared in Thais center. Ferumbras is waiting for his revenge', MESSAGE_GAME_HIGHLIGHT)
        end, 5000)
        addEvent(
            function()
                item:remove()
            end,
            30 * 60 * 1000 -- 30 minutes
        )
    end
    return true
end

--FerumbrasRespawn:time(config.spawnTime)
--FerumbrasRespawn:register()
