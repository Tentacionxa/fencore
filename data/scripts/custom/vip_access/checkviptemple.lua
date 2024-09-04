
-- Deixar vipSystemEnabled = true no config.lua
-- Colocar em canary/data-otservbr-global/scripts/movements/teleport/teleport_vip.lua
-- Só entrar no remere's colocar um teleport, tirar as coords dele e colocar essa Action Id: 34534

local coords = {
    viplocation = { -- Lugar q vai teleportar se for vip
        x = 32369,
        y = 32241,
        z = 7
    
    }
}

local tpvip = MoveEvent()

function tpvip.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    if player:isVip() then
        local msg = "Welcome to the Vip Zone."
        player:sendTextMessage(MESSAGE_STATUS, msg)

else
        local msg = "You are not a Vip member, Be Gone!"
		player:sendTextMessage(MESSAGE_STATUS, msg)
       player:teleportTo(coords.viplocation)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end

tpvip:type("stepin")
tpvip:uid(65000, 65001)
tpvip:register()