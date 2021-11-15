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
	#Todo update score UI
	print("P1:" + str(p1Score) + "-P2:" + str(p2Score))
	
	#Reset ball and paddles
	$Ball.position = ballStartPos
	$Player1.get_child(0).position = paddle1StartPos
	$Player2.get_child(0).position = paddle2StartPos
	
	#TODO: Apply random force to ball
	#TODO: wait a second before sending the ball off
	$Ball.serve(1)

func _p1Scored():
	p1Score += 1
	_startRound()
	
func _p2Scored():
	p2Score += 1
	_startRound()
