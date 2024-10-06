local config = {
	boss = {
		name = "Sub Phys",
		position = Position(32075, 33580, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(32076, 33635, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32077, 33635, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32078, 33635, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32079, 33635, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32080, 33635, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32075, 33636, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32076, 33636, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32077, 33636, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32078, 33636, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32079, 33636, 8), teleport = Position(32066, 33588, 8) },
		{ pos = Position(32080, 33636, 8), teleport = Position(32066, 33588, 8) },
	},
	specPos = {
		from = Position(32054, 33564, 8),
		to = Position(32100, 33598, 8),
	},
	exit = Position(32077, 33638, 8),
	exitTeleporter = Position(32062, 33590, 8),
}

local lever = BossLever(config)
lever:position(Position(32075, 33635, 8))
lever:register()
