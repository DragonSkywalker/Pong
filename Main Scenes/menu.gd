extends Node2D

func _ready():
	if Game.firstTimeLoad:
		Utils.loadSetting()
		Game.firstTimeLoad = false

func _on_play_pressed():
	Game.ballSpeed = Game.ballInitialSpeed
	get_tree().change_scene_to_file("res://Main Scenes/score_selection.tscn")
	
	
func _on_setting_pressed():
	get_tree().change_scene_to_file("res://Main Scenes/setting.tscn")


func _on_quit_pressed():
	get_tree().quit()

