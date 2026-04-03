extends Node2D
var intlist = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21] 
@onready var playerNumber = $Area2D/playerNumber
@onready var dealerNumber = $Area2D/dealerNumber
var playerTotal = 0
var dealerTotal = 0
var rng = RandomNumberGenerator.new()
var in_game = false

func _ready() -> void:
	
	pass

func start_round():
	in_game = true
	rng.randomize()
	
	playerTotal = drawCard()
	dealerTotal = drawCard()
	
	updateUI()

func drawCard():
		return intlist[rng.randi_range(0,intlist.size() - 1)]
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		start_round()
	
	

func _process(delta: float) -> void:
	if not in_game:
		return
		
	if Input.is_action_just_pressed("interact"):
		playerHit()
		
	if Input.is_action_just_pressed("stand"):
		dealerTurn()
		
func playerHit():
	playerTotal += drawCard()
	updateUI()
	if playerTotal > 21:
		print("bust")
		in_game = false
		
func dealerTurn():
	while dealerTotal < 17:
		dealerTotal += drawCard()
	
	updateUI()
	checkWinner()
	in_game = false
	

func checkWinner():
	if dealerTotal > 21 or playerTotal > dealerTotal:
		print("player wins")
	elif playerTotal < dealerTotal:
		print("Dealer wins")
	else:
		print("push")
		

func updateUI():
	playerNumber.text = str(playerTotal)
	dealerNumber.text = str(dealerTotal)
	
	
	
	

	

	
