local table = {
  
        -- [1,5] = VOCATION ID
        -- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},
        [{0}] = {
            [20] = {items = {{itemid = 3043, count = 5}}, storage = 40100, msg = "You won 5 crystal coins for reaching level 20!"},
            [40] = {items = {{itemid = 3043, count = 10}}, storage = 40101, msg = "You won 10 crystal coins for reaching level 40!"},
            [60] = {items = {{itemid = 3043, count = 15}}, storage = 40102, msg = "You won 15 crystal coins for reaching level 60!"},
            [80] = {items = {{itemid = 3043, count = 15}}, storage = 40103, msg = "You won 15 crystal coins for reaching level 80!"},
                 [100] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 15 crystal coins for reaching level 100!"},
               [120] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 20 crystal coins for reaching level 120!"},
               [140] = {items = {{itemid = 3043, count = 20}}, storage = 40106, msg = "You won 20 crystal coins for reaching level 140!"},
               [160] = {items = {{itemid = 3043, count = 20}}, storage = 40107, msg = "You won 20 crystal coins for reaching level 160!"},
               [180] = {items = {{itemid = 3043, count = 20}}, storage = 40108, msg = "You won 20 crystal coins for reaching level 180!"},
               [200] = {items = {{itemid = 3043, count = 30}}, storage = 40109, msg = "You won 30 crystal coins for reaching level 200!"},
               [220] = {items = {{itemid = 3043, count = 30}}, storage = 40110, msg = "You won 30 crystal coins for reaching level 220!"},
               [240] = {items = {{itemid = 3043, count = 30}}, storage = 40111, msg = "You won 30 crystal coins for reaching level 240!"},
               [260] = {items = {{itemid = 3043, count = 30}}, storage = 40112, msg = "You won 30 crystal coins for reaching level 260!"},
               [280] = {items = {{itemid = 3043, count = 30}}, storage = 40113, msg = "You won 30 crystal coins for reaching level 280!"},
               [300] = {items = {{itemid = 3043, count = 30}}, storage = 40114, msg = "You won 30 crystal coins for reaching level 300!"},
               [320] = {items = {{itemid = 3043, count = 30}}, storage = 40115, msg = "You won 30 crystal coins for reaching level 320!"},
               [340] = {items = {{itemid = 3043, count = 30}}, storage = 42116, msg = "You won 30 crystal coins for reaching level 340!"},
               [400] = {items = {{itemid = 37317, count = 4}}, storage = 42135, msg = "You won x4 casino coins for reaching level 400!"},
               [500] = {items = {{itemid = 8149, count = 1}}, storage = 42118, msg = "You won Prey Card Encyclopedia for reaching level 500!"},
               [600] = {items = {{itemid = 8149, count = 1}}, storage = 42119, msg = "You won Prey Card Encyclopedia for reaching level 600!"},
               [700] = {items = {{itemid = 37317, count = 6}}, storage = 42136, msg = "You won x6 casino coins for reaching level 700!"},
               [800] = {items = {{itemid = 8149, count = 1}}, storage = 42120, msg = "You won Prey Card Encyclopedia for reaching level 800!"},
               [900] = {items = {{itemid = 8149, count = 1}}, storage = 42121, msg = "You won Prey Card Encyclopedia for reaching level 900!"},
               [1000] = {items = {{itemid = 3043, count = 500}}, storage = 42123, msg = "You won x500 crystal coins for reaching level 1000!"},
              [1100] = {items = {{itemid = 943, count = 20}}, storage = 42145, msg = "You won x20 Holy Soil for reaching level 1100!"},
              [1200] = {items = {{itemid = 3043, count = 500}}, storage = 42124, msg = "You won x500 crystal coins for reaching level 1200!"},
              [1300] = {items = {{itemid = 36725, count = 2}}, storage = 42150, msg = "You won x2 Stamina Extension for reaching level 1300!"},
              [1500] = {items = {{itemid = 3043, count = 500}}, storage = 42125, msg = "You won x500 crystal coins for reaching level 1500!"},
              [1800] = {items = {{itemid = 3043, count = 500}}, storage = 42126, msg = "You won x500 crystal coins for reaching level 1800!"},
              [2000] = {items = {{itemid = 3043, count = 500}}, storage = 62127, msg = "You won x500 crystal coins for reaching level 2000!"},
              [2100] = {items = {{itemid = 3043, count = 500}}, storage = 42128, msg = "You won x500 crystal coins for reaching level 2100!"},
              [2200] = {items = {{itemid = 3043, count = 500}}, storage = 42140, msg = "You won x500 crystal coins for reaching level 2200!"},
              [2500] = {items = {{itemid = 3043, count = 500}}, storage = 42129, msg = "You won x500 crystal coins for reaching level 2500!"},
              [2700] = {items = {{itemid =3043, count = 500}}, storage = 42156, msg = "You won x500 crystal coins for reaching level 2700!"},
              [3000] = {items  = {{itemid = 3043, count = 500}}, storage = 42157, msg = "You won x500 crystal coins for reaching level 3000!"},
              [3300] = {items = {{itemid = 3043, count = 500}}, storage = 31421, msg = "You won x500 crystal coins for reaching level 3300!"},
              [3500] = {items = {{itemid = 3043, count = 600}}, storage = 31422, msg = "You won x600 crystal coins for reaching level 3500!"},
              [3800] = {items = {{itemid = 3043, count = 600}}, storage = 31423, msg = "You won x600 crystal coins for reaching level 3800!"},
              [4000] = {items = {{itemid = 3043, count = 600}}, storage = 31424, msg = "You won x600 crystal coins for reaching level 4000!"},
              [4300] = {items = {{itemid = 3043, count = 800}}, storage = 31425, msg = "You won x800 crystal coins for reaching level 4300!"},
              [4500] = {items = {{itemid = 3043, count = 800}}, storage = 31426, msg = "You won x800 crystal coins for reaching level 4500!"},
              [5000] = {items = {{itemid = 3043, count = 800}}, storage = 46157, msg = "You won x800 crystal coins for reaching level 5000!"},
              [5300] = {items = {{itemid = 3043, count = 800}}, storage = 58167, msg = "You won x800 crystal coins for reaching level 5300!"},
              [5500] = {items = {{itemid = 3043, count = 1500}}, storage = 63431, msg = "You won x1500 crystal coins for reaching level 5500!"},
              [6000] = {items = {{itemid = 3043, count = 1500}}, storage = 61542, msg = "You won x1500 crystal coins for reaching level 6000!"},
              [6300] = {items = {{itemid = 3043, count = 1500}}, storage = 75432, msg = "You won x1500 crystal coins for reaching level 6300!"},
              [6500] = {items = {{itemid = 3043, count = 1500}}, storage = 61223, msg = "You won x1500 crystal coins for reaching level 6500!"},
              [7000] = {items = {{itemid = 3043, count = 1500}}, storage = 61424, msg = "You won x1500 crystal coins for reaching level 7000!"},
              [7300] = {items = {{itemid = 3043, count = 1500}}, storage = 68451, msg = "You won x1500 crystal coins for reaching level 7300!"},
              [7500] = {items = {{itemid = 3043, count = 1500}}, storage = 61425, msg = "You won x1500 crystal coins for reaching level 7500!"},
              [8000] = {items = {{itemid = 3043, count = 1500}}, storage = 61426, msg = "You won x1500 crystal coins for reaching level 8000!"}
          },
   [{1, 2, 3, 4, 5, 6, 7, 8}] = {
     [20] = {items = {{itemid = 3043, count = 5}}, storage = 40100, msg = "You won 5 crystal coins for reaching level 20!"},
     [40] = {items = {{itemid = 3043, count = 10}}, storage = 40101, msg = "You won 10 crystal coins for reaching level 40!"},
     [60] = {items = {{itemid = 3043, count = 15}}, storage = 40102, msg = "You won 15 crystal coins for reaching level 60!"},
     [80] = {items = {{itemid = 3043, count = 15}}, storage = 40103, msg = "You won 15 crystal coins for reaching level 80!"},
	      [100] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 15 crystal coins for reaching level 100!"},
        [120] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 20 crystal coins for reaching level 120!"},
        [140] = {items = {{itemid = 3043, count = 20}}, storage = 40106, msg = "You won 20 crystal coins for reaching level 140!"},
        [160] = {items = {{itemid = 3043, count = 20}}, storage = 40107, msg = "You won 20 crystal coins for reaching level 160!"},
        [180] = {items = {{itemid = 3043, count = 20}}, storage = 40108, msg = "You won 20 crystal coins for reaching level 180!"},
        [200] = {items = {{itemid = 3043, count = 30}}, storage = 40109, msg = "You won 30 crystal coins for reaching level 200!"},
        [220] = {items = {{itemid = 3043, count = 30}}, storage = 40110, msg = "You won 30 crystal coins for reaching level 220!"},
        [240] = {items = {{itemid = 3043, count = 30}}, storage = 40111, msg = "You won 30 crystal coins for reaching level 240!"},
        [260] = {items = {{itemid = 3043, count = 30}}, storage = 40112, msg = "You won 30 crystal coins for reaching level 260!"},
        [280] = {items = {{itemid = 3043, count = 30}}, storage = 40113, msg = "You won 30 crystal coins for reaching level 280!"},
        [300] = {items = {{itemid = 3043, count = 30}}, storage = 40114, msg = "You won 30 crystal coins for reaching level 300!"},
        [320] = {items = {{itemid = 3043, count = 30}}, storage = 40115, msg = "You won 30 crystal coins for reaching level 320!"},
        [340] = {items = {{itemid = 3043, count = 30}}, storage = 42116, msg = "You won 30 crystal coins for reaching level 340!"},
        [400] = {items = {{itemid = 37317, count = 4}}, storage = 42135, msg = "You won x4 casino coins for reaching level 400!"},
        [500] = {items = {{itemid = 8149, count = 1}}, storage = 42118, msg = "You won Prey Card Encyclopedia for reaching level 500!"},
        [600] = {items = {{itemid = 8149, count = 1}}, storage = 42119, msg = "You won Prey Card Encyclopedia for reaching level 600!"},
        [700] = {items = {{itemid = 37317, count = 6}}, storage = 42136, msg = "You won x6 casino coins for reaching level 700!"},
        [800] = {items = {{itemid = 8149, count = 1}}, storage = 42120, msg = "You won Prey Card Encyclopedia for reaching level 800!"},
        [900] = {items = {{itemid = 8149, count = 1}}, storage = 42121, msg = "You won Prey Card Encyclopedia for reaching level 900!"},
        [1000] = {items = {{itemid = 3043, count = 500}}, storage = 42123, msg = "You won x500 crystal coins for reaching level 1000!"},
       [1100] = {items = {{itemid = 943, count = 20}}, storage = 42145, msg = "You won x20 Holy Soil for reaching level 1100!"},
       [1200] = {items = {{itemid = 3043, count = 500}}, storage = 42124, msg = "You won x500 crystal coins for reaching level 1200!"},
       [1300] = {items = {{itemid = 36725, count = 2}}, storage = 42150, msg = "You won x2 Stamina Extension for reaching level 1300!"},
       [1500] = {items = {{itemid = 3043, count = 500}}, storage = 42125, msg = "You won x500 crystal coins for reaching level 1500!"},
       [1800] = {items = {{itemid = 3043, count = 500}}, storage = 42126, msg = "You won x500 crystal coins for reaching level 1800!"},
       [2000] = {items = {{itemid = 3043, count = 500}}, storage = 62127, msg = "You won x500 crystal coins for reaching level 2000!"},
       [2100] = {items = {{itemid = 3043, count = 500}}, storage = 42128, msg = "You won x500 crystal coins for reaching level 2100!"},
       [2200] = {items = {{itemid = 3043, count = 500}}, storage = 42140, msg = "You won x500 crystal coins for reaching level 2200!"},
       [2500] = {items = {{itemid = 3043, count = 500}}, storage = 42129, msg = "You won x500 crystal coins for reaching level 2500!"},
       [2700] = {items = {{itemid =3043, count = 500}}, storage = 42156, msg = "You won x500 crystal coins for reaching level 2700!"},
       [3000] = {items  = {{itemid = 3043, count = 500}}, storage = 42157, msg = "You won x500 crystal coins for reaching level 3000!"},
       [3300] = {items = {{itemid = 3043, count = 500}}, storage = 31421, msg = "You won x500 crystal coins for reaching level 3300!"},
       [3500] = {items = {{itemid = 3043, count = 600}}, storage = 31422, msg = "You won x600 crystal coins for reaching level 3500!"},
       [3800] = {items = {{itemid = 3043, count = 600}}, storage = 31423, msg = "You won x600 crystal coins for reaching level 3800!"},
       [4000] = {items = {{itemid = 3043, count = 600}}, storage = 31424, msg = "You won x600 crystal coins for reaching level 4000!"},
       [4300] = {items = {{itemid = 3043, count = 800}}, storage = 31425, msg = "You won x800 crystal coins for reaching level 4300!"},
       [4500] = {items = {{itemid = 3043, count = 800}}, storage = 31426, msg = "You won x800 crystal coins for reaching level 4500!"},
       [5000] = {items = {{itemid = 3043, count = 800}}, storage = 46157, msg = "You won x800 crystal coins for reaching level 5000!"},
       [5300] = {items = {{itemid = 3043, count = 800}}, storage = 58167, msg = "You won x800 crystal coins for reaching level 5300!"},
       [5500] = {items = {{itemid = 3043, count = 1500}}, storage = 63431, msg = "You won x1500 crystal coins for reaching level 5500!"},
       [6000] = {items = {{itemid = 3043, count = 1500}}, storage = 61542, msg = "You won x1500 crystal coins for reaching level 6000!"},
       [6300] = {items = {{itemid = 3043, count = 1500}}, storage = 75432, msg = "You won x1500 crystal coins for reaching level 6300!"},
       [6500] = {items = {{itemid = 3043, count = 1500}}, storage = 61223, msg = "You won x1500 crystal coins for reaching level 6500!"},
       [7000] = {items = {{itemid = 3043, count = 1500}}, storage = 61424, msg = "You won x1500 crystal coins for reaching level 7000!"},
       [7300] = {items = {{itemid = 3043, count = 1500}}, storage = 68451, msg = "You won x1500 crystal coins for reaching level 7300!"},
       [7500] = {items = {{itemid = 3043, count = 1500}}, storage = 61425, msg = "You won x1500 crystal coins for reaching level 7500!"},
       [8000] = {items = {{itemid = 3043, count = 1500}}, storage = 61426, msg = "You won x1500 crystal coins for reaching level 8000!"}

 
   

   }
}

local rewardLevel = CreatureEvent("RewardLevel")

function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        return true
    end

    for voc, x in pairs(table) do
        if isInArray(voc, player:getVocation():getId()) then
            for level, z in pairs(x) do
                if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                    for v = 1, #z.items do
                        local count = z.items[v].count
                        
                        -- Use player:addItemStoreInbox with the false parameter for batch processing
                        while count > 0 do
                            local addCount = math.min(count, 100)  -- Batch in chunks of 100
                            player:addItemStoreInbox(z.items[v].itemid, addCount,1,self)
                            count = count - addCount
                        end
                    end
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
                    player:setStorageValue(z.storage, 1)
                end
            end

            player:save()
            return true
        end
    end
end

rewardLevel:register()
