local config = {
	-- Window Config
		mainTitleMsg = "Crafting System", -- Main window title
		mainMsg = "Welcome to the Griish crafting system. Please choose a vocation to begin.", -- Main window message
	 
		craftTitle = "Crafting System: ", -- Title of the crafting screen after player picks of vocation
		craftMsg = "Here is a list of all items that can be crafted for the ", -- Message on the crafting screen after player picks of vocation
	-- End Window Config
	 
	-- Player Notifications Config
		needItems = "You do not have all the required items to make ", -- This is the message the player recieves if he does not have all required items
	 
	-- Crafting Config
		system = {
		[1] = {vocation = "Master Sorcerer", -- This is the category can be anything.
				items = {
					[1] = {item = "Legendary Castle Box", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
							itemID = 46042, -- item to be made
							reqItems = { -- items and the amounts in order to craft.
									[1] = {item = 43962, count = 1}, -- putrefactive figurine
									[2] = {item = 43968, count = 1}, -- bakragores amalgamation
									[3] = {item = 43854, count = 1}, -- tainted heart
									[4] = {item = 3063, count = 1}, -- gold ring
									[5] = {item = 7395, count = 1}, -- orc trophy
									[6] = {item = 32621, count = 1}, -- ring of souls
									[7] = {item = 3012, count = 1}, -- wolf tooth chain
									[8] = {item = 3006, count = 1}, -- ring of the sky
									[9] = {item = 7401, count = 1},-- minotaur trophy
									[10] = {item = 46628, count = 1}, -- amber crussher
									[11] = {item = 9667, count = 1}, -- boggy dreads
									[12] = {item = 43884, count = 1, ignoreEquipped = true}, -- sanguine boots
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 39151, count = 1, ignoreEquipped = true}, -- arcanomancer regalia
									[15] = {item = 39152, count = 1, ignoreEquipped = true}, -- arcanomancer folio
									[16] = {item = 34095, count = 1, ignoreEquipped = true},-- soulmantle
											[17] = {item = 43779, count = 1},-- unstable darklight matter.
													[18] = {item = 43849, count = 20},-- rotten roots.
														[19] = {item = 43850, count = 50},-- dark obsidian splinter.
												[20] = {item = 10315, count = 50},-- sulphurous stone
											[21] = {item = 16124, count = 50},-- blue crystal splinter
								},
							},
	 
					[2] = {item = "Sorcerer's Chest",
							itemID = 46083,
							reqItems = {
									[1] = {item = 22516, count = 50}, -- Silver Tokens
									[2] = {item = 9646, count = 20}, -- book of prayers
									[3] = {item = 8090, count = 1, ignoreEquipped = true}, -- Spellbook of Dark mysteries
									[4] = {item = 20207, count = 5}, -- pool of chitinous glue
									[5] = {item = 10320, count = 40}, -- book of necromantic rituals
									[6] = {item = 3598, count = 50}, -- cookie
										[7] = {item = 48250, count = 100}, -- cookie
										[8] = {item = 6393, count = 1}, -- cream cake
										[9] = {item = 48252, count = 100}, -- brigadeiros
										[10] = {item = 43851, count = 100}, -- darklight matter
											[11] = {item = 7451, count = 1}, -- shadow sceptre
												[12] = {item = 43850, count = 100}, -- dark obsidian splinter
													[13] = {item = 43882, count = 1, ignoreEquipped = true}, -- sanguine coil
														[14] = {item = 11490, count = 100}, -- quara pincers
														[15] = {item = 13990, count = 1}, -- necklace of the deep
															[16] = {item = 48413, count = 1}, -- amber sickle
																	[17] = {item = 48510, count = 100}, -- demon roots
													
								},
							},
					},
				},
	 
		[2] = {vocation= "Elder Druid", 
				items = {
					[1] = {item = "Bronze Castle Box",
							itemID = 46041,
							reqItems = {
								[1] = {item = 43887, count = 1, ignoreEquipped = true}, --sanguine galoshes
									[2] = {item = 34096, count = 1, ignoreEquipped = true}, -- soulshroud
									[3] = {item = 34093, count = 1, ignoreEquipped = true}, -- soulstrider 
									[4] = {item = 39153, count = 1, ignoreEquipped = true}, -- arboreal crown
									[5] = {item = 39154, count = 1, ignoreEquipped = true}, -- arboreal tome
									[6] = {item = 16126, count = 2}, -- red crystal fragment
									[7] = {item = 16138, count = 100},-- crystalline spikes
									[8] = {item = 676, count = 1}, -- small enchanted ruby
									[9] = {item = 9302, count = 1}, -- sacred tree amulet
									[10] = {item = 32630, count = 1}, -- spooky hood.
									[11] = {item = 32617, count = 1, ignoreEquipped = true},-- fabulous legs
											[12] = {item = 32618, count = 1}, -- soulful legs
									[13] = {item = 32703, count = 1}, -- death toll
									[14] = {item = 24392, count = 1},-- gemmed figurine
										[15] = {item = 32773, count = 1},-- ivory comb
											[16] = {item = 33926, count = 1},-- Spite's spirit
													[17] = {item = 43849, count = 20},-- rotten roots.
														[18] = {item = 43850, count = 50},-- dark obsidian splinter.
												[19] = {item = 10315, count = 50},-- sulphurous stone
											[20] = {item = 16124, count = 50},-- blue crystal splinter
							},
						},
	 
					[2] = {item = "Druid's Chest",
							itemID = 46084,
							reqItems = {
								[1] = {item = 34018, count = 1}, -- figurine of malice
									[2] = {item = 33920, count = 1}, -- Malice's horn
									[3] = {item = 33921, count = 1}, -- Malice's spine
									[4] = {item = 3063, count = 1}, -- gold ring
									[5] = {item = 33924, count = 1}, -- Greed's arm
									[6] = {item = 30053, count = 1}, -- dragon figurine
									[7] = {item = 34075, count = 1}, -- skull of a beast
									[8] = {item = 3006, count = 1}, -- ring of the sky
									[9] = {item = 7401, count = 1},-- minotaur trophy
									[10] = {item = 46628, count = 1}, -- amber crussher
									[11] = {item = 9667, count = 1}, -- boggy dreads
									[12] = {item = 43884, count = 1}, -- sanguine boots
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 39151, count = 1, ignoreEquipped = true}, -- arcanomancer regalia
									[15] = {item = 39152, count = 1, ignoreEquipped = true}, -- arcanomancer folio
									[16] = {item = 48413, count = 1},--  amber sickle
										[17] = {item = 43885, count = 1, ignoreEquipped = true},-- sanguine rod
											[18] = {item = 43779, count = 1},-- unstable darklight matter.
													[19] = {item = 43849, count = 20},-- rotten roots.
														[20] = {item = 43850, count = 50},-- dark obsidian splinter.
												[21] = {item = 10315, count = 50},-- sulphurous stone
											[22] = {item = 16124, count = 50},-- blue crystal splinter
							},
						},
	 
					},
				},
	 
			[3] = {vocation = "Royal Paladin", 
					items = {
						[1] = {item = "Silver Castle Box",
								itemID = 46040,
								reqItems = {
									[1] = {item = 34018, count = 1}, -- figurine of malice
									[2] = {item = 33920, count = 1}, -- Malice's horn
									[3] = {item = 33921, count = 1}, -- Malice's spine
									[4] = {item = 3063, count = 1}, -- gold ring
									[5] = {item = 33924, count = 1}, -- Greed's arm
									[6] = {item = 30053, count = 1}, -- dragon figurine
									[7] = {item = 34075, count = 1}, -- skull of a beast
									[8] = {item = 3006, count = 1}, -- ring of the sky
									[9] = {item = 7401, count = 1},-- minotaur trophy
									[10] = {item = 46628, count = 1}, -- amber crussher
									[11] = {item = 9667, count = 1}, -- boggy dreads
									[12] = {item = 43884, count = 1}, -- sanguine boots
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 39151, count = 1, ignoreEquipped = true}, -- arcanomancer regalia
									[15] = {item = 39152, count = 1, ignoreEquipped = true}, -- arcanomancer folio
									[16] = {item = 48413, count = 1},--  amber sickle
										[17] = {item = 43885, count = 1, ignoreEquipped = true},-- sanguine rod
											[18] = {item = 43779, count = 1},-- unstable darklight matter.
													[19] = {item = 43849, count = 20},-- rotten roots.
														[20] = {item = 43850, count = 50},-- dark obsidian splinter.
												[21] = {item = 10315, count = 50},-- sulphurous stone
											[22] = {item = 16124, count = 50},-- blue crystal splinter
								},
							},
	 
						[2] = {item = "Paladin's Chest",
								itemID = 46086,
								reqItems = {
								[1] = {item = 34088, count = 1, ignoreEquipped = true}, -- soulbleeder
									[2] = {item = 43881, count = 1, ignoreEquipped = true}, -- sanguine greaves
									[3] = {item = 39149, count = 1, ignoreEquipped = true}, --alicorn headguard
									[4] = {item = 34098, count = 1, ignoreEquipped = true}, -- pair of soulstalkers 
									[5] = {item = 34094, count = 1}, -- soulshell
									[6] = {item = 10300, count = 1}, -- carniphila's seeds
									[7] = {item = 19110, count = 1}, -- dowser
									[8] = {item = 21197, count = 1}, -- slimy leaf tentacles
									[9] = {item = 3740, count = 1},-- shadow herbs
									[10] = {item = 44753, count = 1}, -- herald's insignia
									[11] = {item = 44751, count = 1}, -- gold-scaled sentinel
									[12] = {item = 44745, count = 50}, -- mega dragon hearts.
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 3350, count = 1, ignoreEquipped = true}, -- bow
									[15] = {item = 44624, count = 1, ignoreEquipped = true}, -- mystical dragon robe
									[16] = {item = 22866, count = 1, ignoreEquipped = true},--  rift bow
										[17] = {item = 8027, count = 1, ignoreEquipped = true},-- composite hornbow
											[18] = {item = 43779, count = 1},-- unstable darklight matter.
													[19] = {item = 43849, count = 20},-- rotten roots.
														[20] = {item = 5479, count = 100},-- cat's paw.
												[21] = {item = 5944, count = 100},-- soul orbs
											[22] = {item = 5954, count = 100},-- demon horns
								},
							},
	 
						
						},
					},
	 
			[4] = {vocation = "Elite Knight",
					items = {
						[1] = {item = "Golden Castle Box",
								itemID = 46039,
								reqItems = {
								[1] = {item = 3278, count = 1, ignoreEquipped = true}, -- magic longsword
									[2] = {item = 3288, count = 1, ignoreEquipped = true}, -- magic sword
									[3] = {item = 43870, count = 1, ignoreEquipped = true}, --sanguine razor
									[4] = {item = 43866, count = 1, ignoreEquipped = true}, -- sanguine cudgel
									[5] = {item = 34097, count = 1, ignoreEquipped = true}, -- pair of soulwalkers
									[6] = {item = 34099, count = 1, ignoreEquipped = true}, -- soulbastion
									[7] = {item = 39148, count = 1, ignoreEquipped = true}, -- spiritthorn helmet
									[8] = {item = 39147, count = 1, ignoreEquipped = true}, -- spiritthorn armor
									[9] = {item = 5914, count = 100},-- yellow piece of cloth
									[10] = {item = 5910, count = 100}, -- green piece of cloth
									[11] = {item = 6553, count = 1, ignoreEquipped = true}, -- ruthless axe
									[12] = {item = 44745, count = 50}, -- mega dragon hearts.
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 3350, count = 1, ignoreEquipped = true}, -- bow
									[15] = {item = 44624, count = 1, ignoreEquipped = true}, -- mystical dragon robe
									[16] = {item = 5925, count = 1},-- hardened bone
										[17] = {item = 43874, count = 1, ignoreEquipped = true},-- sanguine battleaxe
											[18] = {item = 7413, count = 1, ignoreEquipped = true},-- titan axe
													[19] = {item = 43849, count = 20},-- rotten roots.
														[20] = {item = 5479, count = 100},-- cat's paw.
												[21] = {item = 5944, count = 100},-- soul orbs
											[22] = {item = 6499, count = 100},-- demonic essence
								},
							},
	 
						[2] = {item = "Knight's Chest",
								itemID = 46085,
								reqItems = {
									[1] = {item = 3370, count = 5, ignoreEquipped = true}, -- knight armor
									[2] = {item = 3389, count = 2, ignoreEquipped = true}, -- demon legs
									[3] = {item = 3420, count = 2, ignoreEquipped = true}, --demon shield
									[4] = {item = 27650, count = 1, ignoreEquipped = true}, -- gnome shield
									[5] = {item = 11688, count = 2, ignoreEquipped = true}, -- shield of corruption
									[6] = {item = 6131, count = 3, ignoreEquipped = true}, -- tortoise shield
									[7] = {item = 45641, count = 5}, -- candy necklace
									[8] = {item = 39147, count = 1, ignoreEquipped = true}, -- spiritthorn armor
									[9] = {item = 45643, count = 5},-- biscuit barrier
									[10] = {item = 5910, count = 100}, -- green piece of cloth
									[11] = {item = 6553, count = 1}, -- ruthless axe
									[12] = {item = 44745, count = 50}, -- mega dragon hearts.
									[13] = {item = 5909, count = 50},-- white piece of cloth
											[14] = {item = 3280, count = 1, ignoreEquipped = true}, -- fire sword
									[15] = {item = 3002, count = 1}, -- voodoo doll
									[16] = {item = 16120, count = 50},-- violet crystal shard
										[17] = {item = 43968, count = 1},-- Bakragore's amalgamation
											[18] = {item = 23503, count = 100},-- sparkion tails
													[19] = {item = 43849, count = 20},-- rotten roots.
														[20] = {item = 5479, count = 100},-- cat's paw.
												[21] = {item = 23535, count = 100},-- energy bars
											[22] = {item = 6499, count = 100},-- demonic essence
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
	
	simpleCraftingSystem:id(46307, 46306)
	simpleCraftingSystem:register()