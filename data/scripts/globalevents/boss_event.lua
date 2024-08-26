local config = {
    teleportId = 25053,
    days = {
        ["Monday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Tuesday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Wednesday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Thursday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Friday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Saturday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Sunday"] = {Position(32356, 32219, 7), Position(33119, 31699, 7)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(33117, 31699, 7),
    bossName     = 'Orshabaal',
    spawnTime    = '12:00:00'
}

local OrshabaalRespawn = GlobalEvent("OrshabaalRespawn")
function OrshabaalRespawn.onTime(interval)
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
        addEvent(
            function()
                item:remove()
            end,
            30 * 60 * 1000 -- 30 minutes
        )
    end
    return true
end

OrshabaalRespawn:time(config.spawnTime)
OrshabaalRespawn:register()
