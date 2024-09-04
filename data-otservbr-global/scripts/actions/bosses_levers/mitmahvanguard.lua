local config = {
	boss = {
		name = "Mitmah Vanguard",
		position = Position(34068, 31408, 11),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(34048, 31431, 11), teleport = Position(34068, 31415, 11) },
		{ pos = Position(34049, 31431, 11), teleport = Position(34068, 31415, 11) },
		{ pos = Position(34050, 31431, 11), teleport = Position(34068, 31415, 11) },
		{ pos = Position(34051, 31431, 11), teleport = Position(34068, 31415, 11) },
		{ pos = Position(34052, 31431, 11), teleport = Position(34068, 31415, 11) },
	},
	specPos = {
		from = Position(34053, 31397, 11),
		to = Position(34081, 31419, 11),
	},
	exit = Position(34050, 31431, 11),
	exitTeleporter = Position(34068, 31418, 11),
}

local lever = BossLever(config)
lever:position({ x = 34047, y = 31431, z = 11 })
lever:register()
