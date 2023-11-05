extends Node2D

var ball = preload("res://Objects/ball.tscn")

func _process(delta):
	if not get_node("Objects/Ball"):
		var ballTemp = ball.instantiate()
		ballTemp.position = Vector2(576, 324)
		get_node("Objects").add_child(ballTemp)
	if Input.is_action_pressed("ui_accept"):
		get_node("Objects/Ball").hasStarted = true
	if Game.player1Score >= Game.maxScore:
		Game.winner = 1
		get_tree().change_scene_to_file("res://Main Scenes/game_result.tscn")
	elif Game.player2Score >= Game.maxScore:
		Game.winner = 2
		get_tree().change_scene_to_file("res://Main Scenes/game_result.tscn")


func _on_back_pressed():
	Game.player1Score = 0
	Game.player2Score = 0
	get_tree().change_scene_to_file("res://Main Scenes/menu.tscn")


func _on_player_1_death_box_body_entered(body):
	if body.name == "Ball":
		Game.player2Score += 1
		body.queue_free()


func _on_player_2_death_box_body_entered(body):
	if body.name == "Ball":
		Game.player1Score += 1
		body.queue_free()
		
