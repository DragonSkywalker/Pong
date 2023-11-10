extends Node2D

const DEFAULT_PATH = "res://Global/DefaultSetting.bin"
const SAVED_PATH = "res://Global/SavedSetting.bin"

func _ready():
	reload()

func reload():
	get_node("KeepBallSpeed").button_pressed = Game.keepSpeedBetweenRounds
	get_node("PlayerSpeed").text = str(Game.playerSpeed)
	get_node("DashSpeed").text = str(Game.dashSpeed)
	get_node("BallInitialSpeed").text = str(Game.ballInitialSpeed)
	get_node("BallAcceleration").text = str(Game.ballAcceleration)

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


func _on_save_pressed():
	Utils.saveSetting()
	reload()

func _on_default_pressed():
	Utils.loadDefaultSetting()
	reload()

func _on_load_pressed():
	Utils.loadSetting()
	reload()
