extends Label


func _ready():
	text = "Player " + str(Game.winner) + " wins!"
