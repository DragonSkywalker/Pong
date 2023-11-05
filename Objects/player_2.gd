extends CharacterBody2D

var dashLeft = Game.dashTimes
var dashing = false
var dashDirection = 0

func _physics_process(delta):
	var direction = Input.get_axis("player2_up", "player2_down")
	if dashing:
		velocity.y = dashDirection * Game.dashSpeed
	else:
		if direction:
			velocity.y = direction * Game.playerSpeed
		else:
			velocity.y = move_toward(velocity.x, 0, Game.playerSpeed)
		if Input.is_action_just_pressed("player2_dash") and dashLeft > 0 and get_node("../Ball").hasStarted:
			dashDirection = Input.get_axis("player2_up", "player2_down")
			if dashDirection:
				dashing = true
				dashLeft -= 1
				get_node("Timer").start()

	move_and_slide()

func _on_timer_timeout():
	dashDirection = 0
	dashing = false
