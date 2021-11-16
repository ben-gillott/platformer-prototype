extends Node2D

var margin = 10
var AISpeed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	$Paddle.speed = AISpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ballPosY = get_parent().get_node("Ball").global_position.y
	var aiPosY = $Paddle.global_position.y
	
	if(aiPosY > ballPosY + margin):
		$Paddle.moveUp()
	elif(aiPosY < ballPosY - margin):
		$Paddle.moveDown()
	else:
		$Paddle.stopMoving()



