local config = {
    teleportId = 25057,
    days = {
        ["Monday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Tuesday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Wednesday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Thursday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Friday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Saturday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
        ["Sunday"] = {Position(32354, 32219, 7), Position(32228, 31188, 14)}, -- Morshabaal - monday-Segunda, tuesday-Terça, wednesday-Quarta, thursday-Quinta, friday-Sexta, saturday-Sabado and sunday-Domingo
    },
    bossPosition = Position(32228, 31164, 15),
    bossName     = 'Ghazbaran',
    spawnTime    = '17:30:00'
}

local GhazbaranRespawn = GlobalEvent("GhazbaranRespawn")
function GhazbaranRespawn.onTime(interval)
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
            Game.broadcastMessage(config.bossName .. ' A teleport has appeared in Thais center. Ghazbaran is waiting for his revenge', MESSAGE_GAME_HIGHLIGHT)
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

GhazbaranRespawn:time(config.spawnTime)
GhazbaranRespawn:register()
