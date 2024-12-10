extends Node


var level_completion : Dictionary = {
	1: {
		"is_completed": false,
		"puzzle_points": 0
	},
	2: {
		"is_completed": false,
		"puzzle_points": 0
	},
	3: {
		"is_completed": false,
		"puzzle_points": 0
	},
	4: {
		"is_completed": false,
		"puzzle_points": 0
	},
	5: {
		"is_completed": false,
		"puzzle_points": 0
	},
	6: {
		"is_completed": false,
		"puzzle_points": 0
	},
	7: {
		"is_completed": false,
		"puzzle_points": 0
	},
	8: {
		"is_completed": false,
		"puzzle_points": 0
	},
	9: {
		"is_completed": false,
		"puzzle_points": 0
	},
	10: {
		"is_completed": false,
		"puzzle_points": 0
	},
	11: {
		"is_completed": false,
		"puzzle_points": 0
	},
	12: {
		"is_completed": false,
		"puzzle_points": 0
	}
}


func mark_level_complete(level_number: int, points: int):
	if level_number in level_completion:
		level_completion[level_number]["is_completed"] = true
		level_completion[level_number]["puzzle_points"] = points
		print("Level", level_number, "completed with", points, "points.")


enum post_cutscene_action { GO_TO_MAP, START_PUZZLE }
