extends CharacterBody2D

# var SPEED = 200.0
var direction: Vector2
var hasStarted = false
func _ready():
	var rng = RandomNumberGenerator.new()
	var rng2 = RandomNumberGenerator.new()	
	direction.x = rng.randi_range(0, 1)
	direction.y = rng2.randi_range(0, 1)
	if direction.x == 0:
		direction.x = -1
	if direction.y == 0:
		direction.y = -1

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
				
