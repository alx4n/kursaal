extends Node2D


@onready var pNumber = $playerNumber


func _ready() -> void:
	pNumber.text = str(randi_range(1,10))
