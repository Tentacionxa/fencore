local zombieArenaCommand = TalkAction("!zombiearena")
function zombieArenaCommand.onSay(player, words, param)
   
    if not player:getGroup():getAccess() then
        return true
    end

    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end

    if zombieArena:openEvent() then
        zombieArena:autoStart()
    end

    return true
end

--zombieArenaCommand:separator(" ")
--zombieArenaCommand:groupType("god")
--zombieArenaCommand:register()