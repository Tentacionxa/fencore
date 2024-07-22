local table = {
  
        -- [1,5] = VOCATION ID
        -- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},

   [{1, 5}] = {
     [20] = {items = {{itemid = 3043, count = 5}}, storage = 40100, msg = "You won 5 crystal coins for reaching level 20!"},
     [40] = {items = {{itemid = 3043, count = 10}}, storage = 40101, msg = "You won 10 crystal coins for reaching level 40!"},
     [60] = {items = {{itemid = 3043, count = 15}}, storage = 40102, msg = "You won 15 crystal coins for reaching level 60!"},
     [80] = {items = {{itemid = 3043, count = 15}}, storage = 40103, msg = "You won 15 crystal coins for reaching level 80!"},
	      [100] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 15 crystal coins for reaching level 100!"},
        [120] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 20 crystal coins for reaching level 120!"},
        [140] = {items = {{itemid = 3043, count = 20}}, storage = 40106, msg = "You won 20 crystal coins for reaching level 140!"},
        [160] = {items = {{itemid = 3043, count = 20}}, storage = 40107, msg = "You won 20 crystal coins for reaching level 160!"},
        [180] = {items = {{itemid = 3043, count = 20}}, storage = 40108, msg = "You won 20 crystal coins for reaching level 180!"},
        [200] = {items = {{itemid = 3043, count = 30}}, storage = 40109, msg = "You won 30 crystal coins for reaching level 200!"}

   },
   [{2, 6}] = {
     [20] = {items = {{itemid = 3043, count = 5}}, storage = 40201, msg = "You won 5 crystal coins for reaching level 20!"},
     [40] = {items = {{itemid = 3043, count = 10}}, storage = 40202, msg = "You won 10 crystal coins for reaching level 40!"},
     [60] = {items = {{itemid = 3043, count = 15}}, storage = 40203, msg = "You won 15 crystal coins for reaching level 60!"},
     [80] = {items = {{itemid = 3043, count = 15}}, storage = 40204, msg = "You won 15 crystal coins for reaching level 80!"},
     [100] = {items = {{itemid = 3043, count = 15}}, storage = 40205, msg = "You won 15 crystal coins for reaching level 100!"},
     [120] = {items = {{itemid = 3043, count = 20}}, storage = 40206, msg = "You won 20 crystal coins for reaching level 120!"},
     [140] = {items = {{itemid = 3043, count = 20}}, storage = 40207, msg = "You won 20 crystal coins for reaching level 140!"},
     [160] = {items = {{itemid = 3043, count = 20}}, storage = 40208, msg = "You won 20 crystal coins for reaching level 160!"},
     [180] = {items = {{itemid = 3043, count = 20}}, storage = 40209, msg = "You won 20 crystal coins for reaching level 180!"},
     [200] = {items = {{itemid = 3043, count = 30}}, storage = 40210, msg = "You won 30 crystal coins for reaching level 200!"}
   },
   [{3, 7}] = {
     [20] = {items = {{itemid = 3043, count = 5}}, storage = 40301, msg = "You won 5 crystal coins for reaching level 20!"},
     [40] = {items = {{itemid = 3043, count = 10}}, storage = 40302, msg = "You won 10 crystal coins for reaching level 40!"},
     [60] = {items = {{itemid = 3043, count = 15}}, storage = 40303, msg = "You won 15 crystal coins for reaching level 60!"},
     [80] = {items = {{itemid = 3043, count = 15}}, storage = 40304, msg = "You won 15 crystal coins for reaching level 80!"},
     [100] = {items = {{itemid = 3043, count = 15}}, storage = 40305, msg = "You won 20 crystal coins for reaching level 100!"},
     [120] = {items = {{itemid = 3043, count = 20}}, storage = 40306, msg = "You won 20 crystal coins for reaching level 120!"},
     [140] = {items = {{itemid = 3043, count = 20}}, storage = 40307, msg = "You won 20 crystal coins for reaching level 140!"},
     [160] = {items = {{itemid = 3043, count = 20}}, storage = 40308, msg = "You won 20 crystal coins for reaching level 160!"},
     [180] = {items = {{itemid = 3043, count = 20}}, storage = 40309, msg = "You won 20 crystal coins for reaching level 180!"},
     [200] = {items = {{itemid = 3043, count = 30}}, storage = 40310, msg = "You won 30 crystal coins for reaching level 200!"}
   
   },
   [{4, 8}] = {
     [20] = {items = {{itemid = 3043, count = 5}}, storage = 40401, msg = "You won 5 crystal coins for reaching level 20!"},
     [40] = {items = {{itemid = 3043, count = 10}}, storage = 40402, msg = "You won 10 crystal coins for reaching level 40!"},
     [60] = {items = {{itemid = 3043, count = 15}}, storage = 40403, msg = "You won 15 crystal coins for reaching level 60!"},
	    [80] = {items = {{itemid = 3043, count = 15}}, storage = 40403, msg = "You won 15 crystal coins for reaching level 80!"},
		   [100] = {items = {{itemid = 3043, count = 15}}, storage = 40404, msg = "You won 15 crystal coins for reaching level 100!"},
       [120] = {items = {{itemid = 3043, count = 20}}, storage = 40405, msg = "You won 20 crystal coins for reaching level 120!"},
       [140] = {items = {{itemid = 3043, count = 20}}, storage = 40406, msg = "You won 20 crystal coins for reaching level 140!"},
       [160] = {items = {{itemid = 3043, count = 20}}, storage = 40407, msg = "You won 20 crystal coins for reaching level 160!"},
       [180] = {items = {{itemid = 3043, count = 20}}, storage = 40408, msg = "You won 20 crystal coins for reaching level 180!"},
       [200] = {items = {{itemid = 3043, count = 30}}, storage = 40409, msg = "You won 30 crystal coins for reaching level 200!"}

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
                			local ret = ", "
                			if v == 1 then
                			ret = ""
                		
                                        end
				        player:addItem(z.items[v].itemid, z.items[v].count)
            				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
            				player:setStorageValue(z.storage, 1)
                		end
                        end
                end
      
   			player:save()

   			return true
   
            end
         end
end

rewardLevel:register()
