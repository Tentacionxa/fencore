local config = {
	boss = {
		name = "Night Shadow",
		position = Position(31699, 33588, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(31699, 33642, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31700, 33642, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31701, 33642, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31702, 33642, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31703, 33642, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31698, 33643, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31699, 33643, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31700, 33643, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31701, 33643, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31702, 33643, 8), teleport = Position(31692, 33595, 8) },
		{ pos = Position(31703, 33643, 8), teleport = Position(31692, 33595, 8) },
	},
	specPos = {
		from = Position(31683, 33577, 8),
		to = Position(31715, 33598, 8),
	},
	exit = Position(31700, 33645, 8),
	exitTeleporter = Position(31686, 33597, 8),
}

local lever = BossLever(config)
lever:position(Position(31698, 33642, 8))
lever:register()
