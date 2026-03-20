extends Node2D
var intlist = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
@onready var playerNumber = $Area2D/playerNumber
@onready var dealerNumber = $Area2D/dealerNumber



func _on_area_2d_body_entered(body: Node2D) -> void:
	var rng = RandomNumberGenerator.new()
	
	rng.randomize()
	
	var player = rng.randi_range(0,intlist.size()-1)
	var dealer = rng.randi_range(0,intlist.size()-1)
	var randInt = intlist[player]
	var randInt2 = intlist[dealer]
	
	playerNumber.text = str(randInt)
	dealerNumber.text = str(randInt2)
	
