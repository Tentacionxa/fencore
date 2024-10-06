local config = {
	boss = {
		name = "Sub Devis",
		position = Position(31904, 33593, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(31900, 33641, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31901, 33641, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31902, 33641, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31903, 33641, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31904, 33641, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31899, 33642, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31900, 33642, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31901, 33642, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31902, 33642, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31903, 33642, 8), teleport = Position(31903, 33596, 8) },
		{ pos = Position(31904, 33642, 8), teleport = Position(31903, 33596, 8) },
	},
	specPos = {
		from = Position(31883, 33577, 8),
		to = Position(31928, 33609, 8),
	},
	exit = Position(31902, 33644, 8),
	exitTeleporter = Position(31892, 33602, 8),
}

local lever = BossLever(config)
lever:position(Position(31899, 33641, 8))
lever:register()
