extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 100

func _ready():
	velocity.x = -speed
	
func _physics_process(delta):
	var col = move_and_collide(velocity * delta)
	if col != null:
		print(str(col))
