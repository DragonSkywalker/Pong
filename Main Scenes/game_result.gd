extends Node2D


func _on_main_menu_pressed():
	Game.winner = 0
	Game.player1Score = 0
	Game.player2Score = 0
	Game.lastLoser = 0
	get_tree().change_scene_to_file("res://Main Scenes/menu.tscn")
