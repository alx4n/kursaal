extends CharacterBody2D
class_name Arm

var deadzone: float = 0.5

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())
	if event is InputEventJoypadMotion:
		var joy_vector = Vector2(Input.get_joy_axis(0, JOY_AXIS_RIGHT_X), Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y))
		if joy_vector.length() >= deadzone:
			var joy_angle = atan2(joy_vector.y, joy_vector.x)
			self.rotation = joy_angle
