extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 500
export (int) var jump_speed = -500
export (int) var gravity = 500
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.50

var velocity = Vector2.ZERO

func get_input():
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
	if Input.is_action_pressed("walk_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
	if position.y > 600:
		var Manager = get_parent().get_node("CoinManager")
		Manager._endOfTheGame()
		queue_free()



