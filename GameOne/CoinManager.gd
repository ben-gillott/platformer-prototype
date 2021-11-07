extends Node2D

#onready var coin = $Coin
var score = 0

var coin = preload("res://Coin.tscn")

func _updateScoreUI(var newScore):
	var ScoreUINode = get_parent().get_node("ScoreCounter/UI/Control/RichTextLabel")
	ScoreUINode.text = str(newScore)
	
func _spawnCoin():
	#var coinClone = Area2D.new()
	#add_child(coinClone)
	var coin_instance = coin.instance()
	#get_tree().get_root().get_node("Game").add_child(coin_instance)
	coin_instance.position = Vector2(510.0, 10.0)
	call_deferred("add_child", coin_instance)

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawnCoin()
	pass

var timer = 0; 
var spawnRate = 2;

func _process(delta):
	timer += delta
	if timer > spawnRate:
		timer = 0
		_spawnCoin()

#When the player hits a coin
func _on_Player_area_entered(area):
	score += 1
	print(score)
	_updateScoreUI(score)
	area.queue_free()

