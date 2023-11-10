extends Node

const SAVED_PATH = "res://Global/SavedSetting.bin"
const DEFAULT_PATH = "res://Global/DefaultSetting.bin"

func saveSetting():
	var file = FileAccess.open(SAVED_PATH, FileAccess.WRITE)
	var data : Dictionary = {
		"keepSpeedBetweenRounds" : Game.keepSpeedBetweenRounds,
		"playerSpeed" : Game.playerSpeed,
		"dashSpeed" : Game.dashSpeed,
		"ballInitialSpeed" : Game.ballInitialSpeed,
		"ballAccelerationSpeed" : Game.ballAcceleration,
		"dashTimes" : Game.dashTimes,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)

func loadSetting(filePath: String = SAVED_PATH):
	var file = FileAccess.open(filePath,FileAccess.READ)
	if FileAccess.file_exists(filePath):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.keepSpeedBetweenRounds = current_line["keepSpeedBetweenRounds"]
				Game.playerSpeed = current_line["playerSpeed"]
				Game.dashSpeed = current_line["dashSpeed"]
				Game.ballInitialSpeed = current_line["ballInitialSpeed"]
				Game.ballAcceleration = current_line["ballAccelerationSpeed"]
				Game.dashTimes = current_line["dashTimes"]

func loadDefaultSetting():
	loadSetting(DEFAULT_PATH)
