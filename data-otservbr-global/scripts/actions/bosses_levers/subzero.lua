local config = {
	boss = {
		name = "Sub Zero",
		position = Position(32263, 33584, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(32259, 33640, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32260, 33640, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32261, 33640, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32262, 33640, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32263, 33640, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32258, 33641, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32259, 33641, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32260, 33641, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32261, 33641, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32262, 33641, 8), teleport = Position(32255, 33590, 8) },
		{ pos = Position(32263, 33641, 8), teleport = Position(32255, 33590, 8) },
	},
	specPos = {
		from = Position(32248, 33572, 8),
		to = Position(32287, 33598, 8),
	},
	exit = Position(32260, 33643, 8),
	exitTeleporter = Position(32252, 33593, 8),
}

local lever = BossLever(config)
lever:position(Position(32258, 33640, 8))
lever:register()
