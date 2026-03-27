extends CharacterBody2D
class_name Arm

var mouse_delta: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())
