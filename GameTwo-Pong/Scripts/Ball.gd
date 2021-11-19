extends KinematicBody2D


var velocity = Vector2.ZERO
var baseSpeed = 400
var tempSpeed = 400
var speedIncrease = 70

var randomness = .2
var serveRandomness = .4
var waitTime = .5

func serve(xDir):
	tempSpeed = baseSpeed
	velocity = Vector2.ZERO
	
	yield(get_tree().create_timer(waitTime), "timeout")
	
	var yDir = rand_range(serveRandomness, -serveRandomness)
	var direction = Vector2(xDir, yDir)
	velocity = direction * tempSpeed

func _physics_process(delta):
	var direction = velocity.normalized()
	var col = move_and_collide(velocity * delta)
	
	if col != null: 
		#playsound
		_hitFX()
		
		tempSpeed = tempSpeed + speedIncrease
		#Bounce
		var randomDiff = Vector2(0, rand_range(randomness, -randomness))
		direction = direction.bounce(col.normal) + randomDiff
		velocity = direction * tempSpeed
	
	#Check for goal
	var screenSize = get_viewport_rect().size
	if position.x > screenSize.x:
		_scoreFX()
		get_parent()._p2Scored()
	elif position.x < 0:
		_scoreFX()
		get_parent()._p1Scored()

func _hitFX():
	get_parent().get_node("Music").get_node("Hit").play()
	$HitParticles.emitting = true
	
func _scoreFX():
	get_parent().get_node("Music").get_node("Score").play()
	get_parent().get_node("Camera").goalShake()
