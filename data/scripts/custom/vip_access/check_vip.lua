
-- Deixar vipSystemEnabled = true no config.lua
-- Colocar em canary/data-otservbr-global/scripts/movements/teleport/teleport_vip.lua
-- Só entrar no remere's colocar um teleport, tirar as coords dele e colocar essa Action Id: 34534

local coords = {
    viplocation = { -- Lugar q vai teleportar se for vip
        x = 33455,
        y = 32488,
        z = 10
       
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
        player:teleportTo(Position(32369, 32241, 7))
		fromPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
    end
    return true
end

tpvip:type("stepin")
tpvip:uid(12011, 12012, 51422, 56443, 54633, 31633, 51321, 48420, 59867, 37654, 45535, 44562, 31654, 27654, 32451, 56098, 53312, 56097, 56323, 56431, 56099, 26453, 15612, 12013, 12014, 12015, 12016, 12017, 12018, 12019, 14601, 14602, 12020, 12021, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12030, 12031, 12032, 12033, 12034, 12056, 12057, 12058, 12059, 12060, 12061, 12062, 12063, 12064, 12065, 12066, 12067, 12068, 12069, 12070, 12071, 12072, 12073, 12074, 12075, 12076, 12077, 12078, 12079, 12080, 12081, 12082, 12083, 12084, 12085, 12086, 12087, 12088, 12089, 12090, 12091, 12092, 12093, 12094, 12095, 12096, 12097, 12098, 12099, 12100, 12101, 12102, 12103, 12104, 12055, 12105, 12106, 12107, 12108, 12109, 12110, 12111, 12112, 12113, 12114, 12115, 12116,  12117, 12118, 12119, 12120,12121, 12123, 12124, 12125, 12126, 12127, 12128, 12129, 12130, 12131, 12132, 12133, 12134, 12135, 12136, 12137, 12138, 13567, 13568, 13569, 13570, 13571, 13572, 13573, 13574, 13575, 13576, 13577, 13578, 12380, 12381, 12382, 12383, 12384, 12385, 12386, 12387, 12388, 12389, 12390, 12391, 12392, 12393, 12394, 12395, 12396, 12397, 12398, 12399, 12400, 12401, 23156,23157, 23158, 23159, 23160, 23161, 23162, 23163, 23164, 23165, 23166, 23167, 23168, 23169, 23170, 23171, 23172, 23173, 23174, 23175, 12155,12156, 12157, 12158, 12159, 12160, 12161, 12162, 12163, 12164, 12165, 12166, 12167, 12168, 56211, 12169, 12170, 12171, 12172, 12173, 12174, 12175, 12176, 12177, 12178, 12179, 12180, 12181, 45231, 13623, 13624)
tpvip:register()
