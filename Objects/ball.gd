extends CharacterBody2D

var direction: Vector2
var hasStarted = false

func _ready():
	if not Game.keepSpeedBetweenRounds:
		Game.ballSpeed = Game.ballInitialSpeed
	
	var rng2 = RandomNumberGenerator.new()
	direction.y = rng2.randi_range(0, 1) * 2 - 1

func _physics_process(delta):
	if hasStarted: 
		velocity = direction * Game.ballSpeed * delta
		
		var collision = move_and_collide(velocity)
		
		if collision:
			if collision.get_collider().is_class("CharacterBody2D"):
				direction.x *= -1
				if Game.ballSpeed <= 2000:
					Game.ballSpeed += Game.ballAcceleration
			else:
				direction.y *= -1
	else:
		if Game.lastLoser == 1:
			position = get_node("../Player1").position + Vector2(30, 0)
			direction.x = 1
			
		elif Game.lastLoser == 2:
			position = get_node("../Player2").position + Vector2(-30, 0)
			direction.x = -1
		else:
			var rng = RandomNumberGenerator.new()
			Game.lastLoser = rng.randi_range(0, 1) * 2 - 1
