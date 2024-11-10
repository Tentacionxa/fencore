local config = {
    -- Window Config
        mainTitleMsg = "Crafting System", -- Main window title
        mainMsg = "Welcome to the Angelics crafting system. Please choose a vocation to begin.", -- Main window message
     
        craftTitle = "Crafting System: ", -- Title of the crafting screen after player picks of vocation
        craftMsg = "Here is a list of all items that can be crafted for the ", -- Message on the crafting screen after player picks of vocation
    -- End Window Config
     
    -- Player Notifications Config
        needItems = "You do not have all the required items to make ", -- This is the message the player recieves if he does not have all required items
     
    -- Crafting Config
        system = {
        [1] = {vocation = "Master Sorcerer", -- This is the category can be anything.
                items = {
                    [1] = {item = "sorcerer's box", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                            itemID = 46111, -- item to be made
                            reqItems = { -- items and the amounts in order to craft.
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46292, count = 100}, -- ratmiral bag
                                    [9] = {item = 34095, count = 10},-- soulmantle
                                    [10] = {item = 34092, count = 10}, -- soulshanks
                                },
                            },
                    [2] = {item = "master box", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                            itemID = 46113, -- item to be made
                            reqItems = { -- items and the amounts in order to craft.
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46092, count = 100}, -- fera bag
                                    [9] = {item = 34095, count = 10},-- soulmantle
                                    [10] = {item = 34092, count = 10}, -- soulshanks
                                },
                            },		
                    },
                },
     
        [2] = {vocation= "Elder Druid", 
                items = {
                    [1] = {item = "druid's box",
                            itemID = 46114,
                            reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46293, count = 100}, -- scarlett bag
                                    [9] = {item = 34096, count = 10},-- soulshroud
                                    [10] = {item = 34093, count = 10}, -- soulstrider
                            },
                        },
                    [2] = {item = "elder brox",
                            itemID = 49393,
                            reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46092, count = 100}, -- fera bag
                                    [9] = {item = 34096, count = 10},-- soulshroud
                                    [10] = {item = 34093, count = 10}, -- soulstrider
                            },
                        },	
                    },
                },
     
            [3] = {vocation = "Royal Paladin", 
                    items = {
                        [1] = {item = "paladin's box",
                                itemID = 46110,
                                reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 34094, count = 10}, -- soulshell
                                    [9] = {item = 34098, count = 10},-- pair of soulstalkers
                                    [10] = {item = 46291, count = 100}, -- lion bag
                                },
                            },
                        [2] = {item = "royal box",
                                itemID = 46112,
                                reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 34094, count = 10}, -- soulshell
                                    [9] = {item = 34098, count = 10},-- pair of soulstalkers
                                    [10] = {item = 46094, count = 100}, -- tenebris bag
                                },
                            },
                        },
                    },
     
            [4] = {vocation = "Elite Knight",
                    items = {
                        [1] = {item = "knight's box",
                                itemID = 46108,
                                reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46290, count = 100}, -- falcon bag
                                    [9] = {item = 34097, count = 10},-- pair of soulwalkers
                                    [10] = {item = 34099, count = 10}, -- soulbastion
                                },
                            },
                        [2] = {item = "elite box",
                                itemID = 46109,
                                reqItems = {
                                    [1] = {item = 49282, count = 15}, -- Seraphim Hammer
                                    [2] = {item = 49283, count = 15}, -- Seraphim Axe
                                    [3] = {item = 49284, count = 15}, -- Seraphim Sword
                                    [4] = {item = 49285, count = 15}, -- Seraphim Rod
                                    [5] = {item = 49286, count = 15}, -- Seraphim Wand
                                    [6] = {item = 49287, count = 15}, -- Seraphim Bow
                                    [7] = {item = 49288, count = 15}, -- Seraphim Crossbow
                                    [8] = {item = 46312, count = 100}, -- supreme mistery bag
                                    [9] = {item = 34097, count = 10},-- pair of soulwalkers
                                    [10] = {item = 34099, count = 10}, -- soulbastion
                                },
                            },
                        },
                    },
                },
            }
     
    local simpleCraftingSystem = Action()
    function simpleCraftingSystem.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
        player:sendMainCraftWindow(config)
        return true
    end
    
    simpleCraftingSystem:id(46288)
    simpleCraftingSystem:register()