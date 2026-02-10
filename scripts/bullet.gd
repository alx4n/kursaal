extends RigidBody2D

const speed: int = 300

func _process(delta: float) -> void:
	position += transform.x * speed * delta 
	
