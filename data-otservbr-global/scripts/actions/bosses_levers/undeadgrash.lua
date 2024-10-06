local config = {
	boss = {
		name = "Undead Grash",
		position = Position(31766, 33587, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(31768, 33642, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31769, 33642, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31770, 33642, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31771, 33642, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31772, 33642, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31767, 33643, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31768, 33643, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31769, 33643, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31770, 33643, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31771, 33643, 8), teleport = Position(31759, 33596, 8) },
		{ pos = Position(31772, 33643, 8), teleport = Position(31759, 33596, 8) },
	},
	specPos = {
		from = Position(31748, 33575, 8),
		to = Position(31791, 33601, 8),
	},
	exit = Position(31770, 33645, 8),
	exitTeleporter = Position(31755, 33597, 8),
}

local lever = BossLever(config)
lever:position(Position(31767, 33642, 8))
lever:register()
