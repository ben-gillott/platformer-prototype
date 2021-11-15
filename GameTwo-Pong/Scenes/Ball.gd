extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 200

func _ready():
	velocity.x = -speed
	
func _physics_process(delta):
	var direction = velocity.normalized()
	var col = move_and_collide(velocity * delta)
	
	if col != null: 
		#Bounce
		#bounce the prior direction of the ball over the surface normal
		direction = direction.bounce(col.normal)
		print(direction)
	
		velocity = direction * speed
		print(velocity)
