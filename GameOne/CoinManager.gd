extends Node2D

onready var coin = $Coin
var score = 0


func _spawnCoin():
	var coinClone = coin.new()
	add_child(coinClone)
	#TODO, change to its own scene and duplicate that

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawnCoin()

func _process(delta):
	pass

#When the player hits a coin
func _on_Player_area_entered(area):
	if area.name == "Coin":
		score += 1
		print(score)
