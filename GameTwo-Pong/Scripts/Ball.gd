extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 400
var randomness = .2

func serve(dir):
	velocity.x = dir * speed

func _physics_process(delta):
	var direction = velocity.normalized()
	var col = move_and_collide(velocity * delta)
	
	if col != null: 
		#Bounce
		var randomDiff = Vector2(0, rand_range(randomness, -randomness))
		direction = direction.bounce(col.normal) + randomDiff
		velocity = direction * speed
	
	#Check for goal
	var screenSize = get_viewport_rect().size
	if position.x > screenSize.x:
		get_parent()._p2Scored()
	elif position.x < 0:
		get_parent()._p1Scored()
