local config = {
    teleportId = 25047,
    days = {
        ["Saturday"] = {Position(32354, 32219, 7), Position(33524, 32377, 11)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(33540, 32383, 12),
    bossName     = 'Gaz\'haragoth',
    spawnTime    = '18:00:00'
}

local GazRespawn = GlobalEvent("GazRespawn")
function GazRespawn.onTime(interval)
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
            Game.broadcastMessage(config.bossName .. ' A teleport has appeared in Thais center. Gaz\'haragoth is waiting for his revenge', MESSAGE_GAME_HIGHLIGHT)
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

GazRespawn:time(config.spawnTime)
GazRespawn:register()
