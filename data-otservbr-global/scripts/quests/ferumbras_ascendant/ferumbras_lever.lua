local config = {
	boss = {
		name = "ferumbras mortal shell",
		position = Position(33392, 31473, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33269, 31477, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31477, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31477, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33269, 31478, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31478, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31478, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33269, 31479, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31479, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31479, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31479, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33269, 31480, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31480, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31480, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31480, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33269, 31481, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33270, 31481, 14), teleport = Position(33392, 31479, 14) },
		{ pos = Position(33271, 31481, 14), teleport = Position(33392, 31479, 14) },

	},
	monsters = {
		{ name = "rift invader", pos = Position(33393, 31476, 14) },
		{ name = "rift invader", pos = Position(33394, 31476, 14) },
		{ name = "rift invader", pos = Position(33395, 31476, 14) },
		{ name = "rift invader", pos = Position(33389, 31476, 14) },
		{ name = "rift invader", pos = Position(33389, 31471, 14) },
		{ name = "rift invader", pos = Position(33394, 31471, 14) },
		{ name = "rift invader", pos = Position(33395, 31471, 14) },
		{ name = "rift invader", pos = Position(33396, 31471, 14) },
		{ name = "rift invader", pos = Position(33392, 31475, 14) },
	},
	specPos = {
		from = Position(33379, 31460, 14),
		to = Position(33405, 31485, 14),
	},
	exit = Position(33266, 31479, 14),
}

local lever = BossLever(config)
lever:position(Position(33270, 31476, 14))
lever:register()