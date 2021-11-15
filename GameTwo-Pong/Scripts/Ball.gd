extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 400
var randomness = .1

func _ready():
	velocity.x = -speed
	
func _physics_process(delta):
	var direction = velocity.normalized()
	var col = move_and_collide(velocity * delta)
	
	if col != null: 
		#Bounce
		var randomDiff = Vector2(0, rand_range(randomness, -randomness))
		direction = direction.bounce(col.normal) + randomDiff
		velocity = direction * speed
