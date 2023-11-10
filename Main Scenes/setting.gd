extends Node2D

const DEFAULT_PATH = "res://Global/DefaultSetting.txt"
const SAVED_PATH = "res://Global/SavedSetting.txt"

func _ready():
	get_node("KeepBallSpeed").button_pressed = Game.keepSpeedBetweenRounds
	get_node("PlayerSpeed").placeholder_text = str(Game.playerSpeed)
	get_node("DashSpeed").placeholder_text = str(Game.dashSpeed)
	get_node("BallInitialSpeed").placeholder_text = str(Game.ballInitialSpeed)
	get_node("BallAcceleration").placeholder_text = str(Game.ballAcceleration)

func _on_keep_ball_speed_toggled(button_pressed):
	if button_pressed:
		Game.keepSpeedBetweenRounds = true
	else:
		Game.keepSpeedBetweenRounds = false

func _on_player_speed_text_changed():
	Game.playerSpeed = int(get_node("PlayerSpeed").text)

func _on_dash_speed_text_changed():
	Game.dashSpeed = int(get_node("DashSpeed").text)

func _on_ball_initial_speed_text_changed():
	Game.ballInitialSpeed = int(get_node("BallInitialSpeed").text)

func _on_ball_acceleration_text_changed():
	Game.ballAcceleration = int(get_node("BallAcceleration").text)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Main Scenes/menu.tscn")


func saveSetting():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
