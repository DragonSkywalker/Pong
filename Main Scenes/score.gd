extends Label

var score = 3

func _process(_delta):
	text = str(score)

func _on_minus_pressed():
	if score > 1:
		score -= 1
	else: 
		score = 10000


func _on_plus_pressed():
	if score < 10000:
		score += 1
	else:
		score = 1


func _on_continue_pressed():
	Game.maxScore = score
	get_tree().change_scene_to_file("res://Main Scenes/field.tscn")
