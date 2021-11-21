extends Node2D

var margin = 0
var AISpeed = 350

# Called when the node enters the scene tree for the first time.
func _ready():
	$Paddle.speed = AISpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ballPosY = get_parent().get_node("Ball").global_position.y
	var aiPosY = $Paddle.global_position.y
	
	#Manually lerp towards target position
	#var newYval = lerp(aiPosY, ballPosY, AISpeed * delta)
	#$Paddle.position.y = newYval
	
	#if(aiPosY > ballPosY + margin):
	#	$Paddle.moveUp()
	#elif(aiPosY < ballPosY - margin):
	#	$Paddle.moveDown()
	#else:
	#	$Paddle.stopMoving()



