extends Area2D

@export var shot_speed = 150
const speed : int = 100

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	position += transform.x * speed * delta
