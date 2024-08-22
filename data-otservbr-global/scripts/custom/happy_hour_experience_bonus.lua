local lootWars = GlobalEvent("happyHourExperienceBonus")
function lootWars.onTime(interval)
    local weekDay = os.date("*t").wday
    if weekDay == 1 or weekDay == 7 then
        return
    end
    
    for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendTextMessage(MESSAGE_ADMINISTRATOR, "THE HAPPY HOUR DOUBLE XP EVENT IS ON! GRAB YOUR WEAPONS AND BE READY TO HUNT!")
	end
end
lootWars:time("20:00:00")
lootWars:register()