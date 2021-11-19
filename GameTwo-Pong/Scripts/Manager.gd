extends Node2D

onready var ballStartPos = $Ball.position
onready var paddle1StartPos = $Player1.get_child(0).position
onready var paddle2StartPos = $Player2.get_child(0).position

var p1Score = 0
var p2Score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_startRound()

func _startRound():
	#Reset ball and paddles
	$Ball.position = ballStartPos
	$Player1.get_child(0).position = paddle1StartPos
	$Player2.get_child(0).position = paddle2StartPos
	

	#serve in random direction	
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randDir = rng.randi_range(1,2)
	if(randDir == 2): #Jeez this is painful to look at
		randDir = -1
	
	$Ball.serve(randDir)

func _p1Scored():
	p1Score += 1
	$Control/P1ScoreLabel.text = str(p1Score)
	_startRound()
	
func _p2Scored():
	p2Score += 1
	$Control/P2ScoreLabel.text = str(p2Score)
	_startRound()
