
-- Deixar vipSystemEnabled = true no config.lua
-- Colocar em canary/data-otservbr-global/scripts/movements/teleport/teleport_vip.lua
-- Só entrar no remere's colocar um teleport, tirar as coords dele e colocar essa Action Id: 34534

local coords = {
    viplocation = { -- Lugar q vai teleportar se for vip
        x = 32566,
        y = 32448,
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
        player:teleportTo(coords.viplocation)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        local msg = "You are not a Vip member, Be Gone!"
		player:sendTextMessage(MESSAGE_STATUS, msg)
        player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
    end
    return true
end

tpvip:type("stepin")
tpvip:uid(12011, 12012, 12013, 12014, 12015, 12016, 12017, 12018, 12019, 12020, 12021, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12030, 12031, 12032, 12033, 12034, 12056, 12057, 12058, 12059, 12060)
tpvip:register()