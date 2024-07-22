-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 50,
	},
	{
		minlevel = 9,
		maxlevel = 100,
		multiplier = 500,
	},
	{
		minlevel = 101,
		maxlevel = 300,
		multiplier = 400,
	},
	{
		minlevel = 301,
		maxlevel = 400,
		multiplier = 300,
	},
	{
		minlevel = 401,
		multiplier = 100,
	},
}

skillsStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 30,
	},
	{
		minlevel = 9,
		maxlevel = 100,
		multiplier = 30,
	},
	{
		minlevel = 101,
		maxlevel = 300,
		multiplier = 20,
	},
	{
		minlevel = 301,
		maxlevel = 400,
		multiplier = 15,
	},
	{
		minlevel = 401,
		multiplier = 10,
	},
}

magicLevelStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 30,
	},
	{
		minlevel = 9,
		maxlevel = 100,
		multiplier = 30,
	},
	{
		minlevel = 101,
		maxlevel = 200,
		multiplier = 25,
	},
	{
		minlevel = 201,
		maxlevel = 300,
		multiplier = 20,
	},
	{
		minlevel = 301,
		maxlevel = 400,
		multiplier = 15,
	},
	{
		minlevel = 401,
		multiplier = 10,
	},
}
