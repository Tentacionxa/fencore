if not Karin then Karin = {} end

function Karin.firstLetterUpper(self, str)
    local words = str:split(" ")
    for i, word in ipairs(words) do
        words[i] = word:gsub("^%l", string.upper)
    end
    return table.concat(words, " ")
end

function Karin.setExhaustion(self, player, value, time)
    player:setStorageValue(value, time + os.time())
end

function Karin.getExhaustion(self, player, value)
    local storage = player:getStorageValue(value)
    if not storage or storage <= os.time() then
        return 0
    end

    return storage - os.time()
end

function Karin.hasExhaustion(self, player, value)
    return self:getExhaustion(player, value) > 0 and true or false
end

function Karin:handleExhaustion(player, value, delay)
    if self:hasExhaustion(player, value) then
        return true
    else
        self:setExhaustion(player, value, delay)
        return false
    end
end

function Karin:sendNearSound(pos, sound, range)
    addEvent(function ()
        local range = range or 7
        for _, players in pairs(self:getPlayersPosRangeXY(pos, range, range, false)) do
            players:sendSingleSoundEffect(sound)
        end
    end, 10)
end

function Karin:isPlayerInPosRangeXY(player, pos,rangeX,rangeY, multifloor)
    for w,p in pairs(Game.getSpectators(pos, multifloor, true, rangeX, rangeX, rangeY, rangeY)) do
        if p:getId() == player:getId() then
            return true
        end
    end
    return false
end

function Karin:getMonstersPosRangeXY(pos,rangeX,rangeY, master)
    local monsters = {}
    for w,p in pairs(Game.getSpectators(pos, false, false, rangeX, rangeX, rangeY, rangeY)) do
        if p:isMonster() and (not master and not p:getMaster() or master) then
            table.insert(monsters, p)
        end
    end
    return monsters
end

function Karin:getIdMonstersPosRangeXY(pos,rangeX,rangeY, master)
    local monsters = {}
    for w,p in pairs(Game.getSpectators(pos, false, false, rangeX, rangeX, rangeY, rangeY)) do
        if p:isMonster() and (not master and not p:getMaster() or master) then
            monsters[p:getId()] = p
        end
    end
    return monsters
end

function Karin:getPlayersPosRangeXY(pos,rangeX,rangeY, multifloor)
    local players = {}
    for w,p in pairs(Game.getSpectators(pos, multifloor, true, rangeX, rangeX, rangeY, rangeY)) do
        table.insert(players, p)
    end
    return players
end

function Karin:minimalTimers(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds / 60)
    seconds = seconds - minutes * 60

    if days > 0 then
        return string.format("%d days, %d hours",days,hours)
    elseif hours > 0 then
        return string.format("%d hours, %d minutes",hours,minutes)
    elseif minutes > 0 then
        return string.format("%d minutes",minutes)
    elseif seconds > 1 then
        return string.format("%d seconds",seconds)
    elseif seconds > 0 then
        return string.format("%d second",seconds)
    else
        return '0 seconds'
    end
end

function Karin:minimalTimersBR(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds / 60)
    seconds = seconds - minutes * 60

    if days > 0 then
        return string.format("%d dias, %d horas",days,hours)
    elseif hours > 0 then
        return string.format("%d horas, %d minutos",hours,minutes)
    elseif minutes > 0 then
        return string.format("%d minutos",minutes)
    elseif seconds > 1 then
        return string.format("%d segundos",seconds)
    elseif seconds > 0 then
        return string.format("%d segundo",seconds)
    else
        return '0 segundos'
    end
end

function Karin:completeTimers(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds / 60)
    seconds = seconds - minutes * 60

    if days > 0 then
        return string.format("%d days, %d hours, %d minutes and %d seconds",days,hours,minutes,seconds)
    elseif hours > 0 then
        return string.format("%d hours, %d minutes and %d seconds",hours,minutes,seconds)
    elseif minutes > 0 then
        return string.format("%d minutes and %d seconds",minutes,seconds)
    elseif seconds > 0 then
        return string.format("%d seconds",seconds)
    end
end

function Karin:isBadTileToDamage(tile)
    return (tile == nil or tile:getGround() == nil or tile:hasProperty(TILESTATE_NONE) or Item(tile:getThing()) and not isMoveable(tile:getThing()) or tile:hasFlag(TILESTATE_PROTECTIONZONE) or (tile:getTopVisibleThing() and tile:getTopVisibleThing():isTeleport()))
end

function Karin:isBadTileWithoutPZ(tile)
    return (tile == nil or tile:getGround() == nil or tile:hasProperty(TILESTATE_NONE) or Item(tile:getThing()) and not isMoveable(tile:getThing()) or tile:getTopCreature() or (tile:getTopVisibleThing() and tile:getTopVisibleThing():isTeleport()))
end

function Karin:isBadTile(tile)
    return (tile == nil or tile:getGround() == nil or tile:hasProperty(TILESTATE_NONE) or Item(tile:getThing()) and not isMoveable(tile:getThing()) or tile:getTopCreature() or tile:hasFlag(TILESTATE_PROTECTIONZONE) or (tile:getTopVisibleThing() and tile:getTopVisibleThing():isTeleport()))
end

function Karin:getFreePosition(originalPos, range, withoutPZ)
    local limitRun = 0
	local rangeY = range
	if type(range) == 'table' then
		rangeY = range[2]
		range = range[1]
	end
    while true do
        -- Generate a random position within the range
		
        local x = originalPos.x + math.random(-range, range)
        local y = originalPos.y + math.random(-rangeY, rangeY)
        local pos = Position(x, y, originalPos.z)

        -- Check if the position is valid
        local tile = pos:getTile()
        if not withoutPZ and not Karin:isBadTile(tile) or (withoutPZ and not Karin:isBadTileWithoutPZ(tile)) then
            return pos
        end

        -- Increment the counter and break if it reaches the limit
        limitRun = limitRun + 1
        if limitRun >= 20 then
            break
        end
    end

    -- If no free position was found, return the original position
    return originalPos
end

function Karin:getFreePositionToDamage(originalPos, range)
    local limitRun = 0
    while true do
        -- Generate a random position within the range
        local x = originalPos.x + math.random(-range, range)
        local y = originalPos.y + math.random(-range, range)
        local pos = Position(x, y, originalPos.z)

        -- Check if the position is valid
        local tile = pos:getTile()
        if not Karin:isBadTileToDamage(tile) then
            return pos
        end

        -- Increment the counter and break if it reaches the limit
        limitRun = limitRun + 1
        if limitRun >= 10 then
            break
        end
    end

    -- If no free position was found, return the original position
    return originalPos
end

function Karin.clearBossRoom(centerPosition, rangeX, rangeY, exitPosition)
    local spectators = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
    for i = 1, #spectators do
        spectator = spectators[i]
        if spectator:isPlayer() then
            spectator:teleportTo(exitPosition)
            exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
        end

        if spectator:isMonster() then
            spectator:remove()
        end
    end
end

function Karin:isPositionInSameArea(pos, pos1, xRange, yRange)
    local xDiff = math.abs(pos.x - pos1.x)
    local yDiff = math.abs(pos.y - pos1.y)
    return xDiff <= xRange and yDiff <= yRange
end
-- Karin:rainDamageByPosRangeXYGroundFallEffectMinMaxDMGCombatType(player:getPosition(), 3, 3, CONST_ME_HITAREA, CONST_ANI_POWERBOLT, 10, 100, COMBAT_PHYSICALDAMAGE)
function Karin:rainDamageByPosRangeXYGroundFallEffectMinMaxDMGCombatType(pos, xRange, yRange, groundEffect, fallEffect, min, max, combat, dropItem)
    local numberOfEffects = math.floor((xRange * 2 + 1) * (yRange * 2 + 1) / 2)  -- Computa a base no intervalo fornecido

    local function sendEffect()
        local position = Karin:getFreePositionToDamage(pos, math.max(xRange, yRange))
        if not position then
            return
        end

        local fromPosition = Position(position.x - xRange, position.y - yRange, position.z)
        local tile = Tile(position)
        if tile then
            if fallEffect then
                fromPosition:sendDistanceEffect(position, fallEffect)
            end
            
            position:sendMagicEffect(groundEffect)

            if dropItem then
                Game.createItem(dropItem, 1, position)
            end

            local creature = tile:getTopCreature()
            if creature then
                if creature:isPlayer() or creature:getMaster() then
                    doTargetCombatHealth(0, creature, combat, -min, -max, CONST_ME_NONE)
                end
            end
        end
    end

    for i = 1, numberOfEffects do
        addEvent(sendEffect, i * 150)
    end

    local sound = function (pos, type)
        self:sendNearSound(pos, type)
    end

    local soundType
    if combat == COMBAT_DEATHDAMAGE then
        soundType = SOUND_EFFECT_TYPE_SPELL_SUDDENDEATH_RUNE
    elseif combat == COMBAT_ICEDAMAGE then
        soundType = SOUND_EFFECT_TYPE_SPELL_ULTIMATE_ICE_STRIKE
    elseif fallEffect == CONST_ANI_POWERBOLT then
        soundType = SOUND_EFFECT_TYPE_DIST_ATK_CROSSBOW_SHOT
    end    
    

    if soundType then
        sound(pos, soundType)
        for i = 1, 5 do
            addEvent(function ()
                sound(pos, soundType)
            end, i * 900)
        end
    end
end


function Karin:getPositionsInRange(pos, xRange, yRange)
    local positions = {}
    local xRangeSq = xRange * xRange
    local yRangeSq = yRange * yRange
    local maxDistanceSq = xRangeSq + yRangeSq

    for dx = -xRange, xRange do
        for dy = -yRange, yRange do
            local distanceSq = dx*dx + dy*dy
            if distanceSq <= maxDistanceSq then
                local x = pos.x + dx
                local y = pos.y + dy
                table.insert(positions, { x = x, y = y, z = pos.z })
            end
        end
    end

    return positions
end

function Karin:getTilesFromPosition(pos, xRange, yRange)
    local positions = {}  -- Inicializa uma tabela para armazenar as posições

    -- Itera sobre as coordenadas x e y dentro dos ranges especificados
    for x = pos.x, pos.x + xRange do
        for y = pos.y, pos.y + yRange do
            table.insert(positions, { x = x, y = y, z = pos.z })  -- Insere a posição na tabela
        end
    end

    return positions  -- Retorna a tabela de posições
end

function Karin:getAllPositionsByPositionAndRangeXYUPRIGHT(pos, xRange, yRange)
    local positions = {}
    -- Iterate over the x coordinates within the x range
    for x = pos.x, pos.x + xRange do

        -- Iterate over the y coordinates within the y range
        for y = pos.y, pos.y + yRange do

            -- Iterate over the z coordinates within the x range
            for z = pos.z - xRange, pos.z + xRange do

                -- Calculate the distance between the current position and the given position
                local dx = x - pos.x
                local dy = y - pos.y
                local dz = z - pos.z
                local distance = math.sqrt(dx*dx + dy*dy + dz*dz)

                -- If the distance is less than or equal to the specified range, add the position to the list
                if distance <= math.sqrt(xRange*xRange + yRange*yRange) then
                    table.insert(positions, { x = x, y = y, z = z })
                end
            end
        end
    end

    return positions
end

function Karin:getAllPositionsByPositionAndRangeXYDOWNRIGHT(pos, xRange, yRange)
    local positions = {}
    -- Iterate over the x coordinates within the x range
    for x = pos.x, pos.x + xRange do

        -- Iterate over the y coordinates within the y range
        for y = pos.y + yRange, pos.y, -1 do

            -- Iterate over the z coordinates within the x range
            for z = pos.z - xRange, pos.z + xRange do

                -- Calculate the distance between the current position and the given position
                local dx = x - pos.x
                local dy = y - pos.y
                local dz = z - pos.z
                local distance = math.sqrt(dx*dx + dy*dy + dz*dz)

                -- If the distance is less than or equal to the specified range, add the position to the list
                if distance <= math.sqrt(xRange*xRange + yRange*yRange) then
                    table.insert(positions, { x = x, y = y, z = z })
                end
            end
        end
    end

    return positions
end

function Karin:getAllPositionsByPositionAndRange(pos, range)
    local positions = {}
    local xRange = range
    local yRange = range
    local zRange = range

    for x = pos.x - xRange, pos.x + xRange do
        for y = pos.y - yRange, pos.y + yRange do
            table.insert(positions, Position(x, y, pos.z))
        end
    end

    return positions
end

function Karin:debugTable(data)
    print('-------')
    for key, value in pairs(data) do
        print(key)
        print(value)
    end
    print('----X---')
end


function Karin:searchContainer(player, container, itemId, customId)
    local containers = {}
    local items = {}
    local avaliable = {}
    local contagem = 0

    if container.uid > 0 then
        if Container(container.uid) then
            table.insert(containers, container.uid)
        elseif not (id) or id == container.itemid then
            table.insert(items, container)
        end
    end
    
    while #containers > 0 do
        for k = (getContainerSize(containers[1]) - 1), 0, -1 do
            local tmp = getContainerItem(containers[1], k)
            
            if Container(tmp.uid) then
                if customId then
                    local item = Item(tmp.uid)
                    if item then
                        if item:getCustomAttribute('customId') and item:getCustomAttribute('customId') == customId then
                            table.insert(containers, tmp.uid)
                        end
                    end
                else
                    table.insert(containers, tmp.uid)
                end
            elseif not (id) or id == tmp.itemid then
                if customId then
                    local item = Item(tmp.uid)
                    if item then
                        if item:getCustomAttribute('customId') and item:getCustomAttribute('customId') == customId then
                            table.insert(avaliable, tmp.itemid)
                        end
                    end
                else
                     table.insert(avaliable, tmp.itemid)
                end
            end
        end
        table.remove(containers, 1)
    end

    if not itemId then
        return avaliable
    else
        for i = 1, #avaliable do
            if avaliable[i] == itemId then
                contagem = contagem + 1
            end
        end
        return contagem
    end
end

function Position:sendAnimatedText(message)
    local specs = Game.getSpectators(self, false, true, 9, 9, 8, 8)
    if #specs > 0 then
        for i = 1, #specs do
            local player = specs[i]
            player:say(message, TALKTYPE_MONSTER_SAY, false, player, self)
        end
    end
end

function Karin:convertTableToString(table)
    local str = ''
    for id, data in pairs(table) do
        if data.amount then
            str = str .. id .. ':' .. data.amount .. ';'
        else
            str = str .. data[1] .. ':' .. data[2] .. ';'
        end
    end
    return str
end

function Karin:convertStringToTable(str)
    local table = {}
    for id, amount in str:gmatch('(%d+):(%d+);') do
        table[tonumber(id)] = { amount = tonumber(amount) }
    end
    return table
end


function Karin:removePlayersFromBossRoom(config)
    if not config.range then
        config.range = 14
    end
    local spectators = Karin:getPlayersPosRangeXY(config.roomCenterPosition, config.range, config.range, false)
    for i = 1, #spectators do
        spectator = spectators[i]
        if spectator:isPlayer() and table.contains(config.players, spectator:getId()) then
            spectator:teleportTo(config.exitPosition)
            config.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
        end
    end
end
