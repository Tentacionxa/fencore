local zombieArenaStart = GlobalEvent("Zombie Arena")
function zombieArenaStart.onTime(interval)

    if zombieArena:openEvent() then
        zombieArena:autoStart()
    end 
    return true
end

zombieArenaStart:time("16:00")
zombieArenaStart:register()
