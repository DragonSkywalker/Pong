extends CharacterBody2D

var direction: Vector2
var hasStarted = false
var rng = RandomNumberGenerator.new()
const initDistanceFromPlayer = Vector2(40, 0)

func _ready():
	if not Game.keepSpeedBetweenRounds:
		Game.ballSpeed = Game.ballInitialSpeed
	
	direction.y = rng.randi_range(0, 1) * 2 - 1
	direction.y *= rng.randf_range(0.8, 1.2)

func _physics_process(delta):
	if hasStarted: 
		if not direction.is_normalized():
			direction = direction.normalized()
		get_node("Fire").visible = true
		get_node("Fire").rotation = direction.angle()
		
		velocity = direction * Game.ballSpeed * delta
		
		var collision = move_and_collide(velocity)
		
		if collision:
			if collision.get_collider().is_class("CharacterBody2D"):
				direction.x = sign(direction.x) * -1
				direction.y = sign(direction.y) * rng.randf_range(0.8, 1.2)
				if Game.ballSpeed <= 2000:
					Game.ballSpeed += Game.ballAcceleration
			else:
				direction.y *= -1
	else:
		if Game.lastLoser == 1:
			position = get_node("../Player1").position + initDistanceFromPlayer
			direction.x = 1
		elif Game.lastLoser == 2:
			position = get_node("../Player2").position - initDistanceFromPlayer
			direction.x = -1
		else:
			Game.lastLoser = rng.randi_range(1, 2)

func rotateFormula(v: Vector2):
#	return (-v.x + 2) * v.y * PI / 4
	pass
