local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local config = {
        interval = 60, -- in seconds,
        messages = {
            "[COMMANDS] !frags - !bless - !aol - !serverinfo - !online - !uptime - !bp - !food - !rewards - !checkvip - !shared - !balance - !withdraw - !task",
            "[RECHARGE COMMANDS] !softboots - !firewalkerboots - !sleepshawl - !pendulet - !turtle - !theurgic - !spirit - !alicorn - !arcanomancer",
            "[GUILD COMMANDS] !outfit - !bc text ",
            "[BUGS] Any bugs, please report them at our Discord Bug Channel - https://discord.gg/HQHPw7fnWc",
            "[HOUSE]: To buy a house go to https://fencore.net/?houses . Choose City->House and Bid for the house. Auction takes 1 day. Make sure to have money in Your bank account.",
            "[SERVER SAVE]: Server save is at 10:00 (CEST).",
            "[RAID EVENT]: 12:00 Orshabaal 14:00 Morgaorth 16:00 Ghazbaran 18:00 Ferumbras",
            }
     }

    Game.broadcastMessage(config.messages[math.random(#config.messages)], SERVER_MOTD) 
    return true
end
AutoBroadCast:interval(config.interval * 1000)
AutoBroadCast:register()