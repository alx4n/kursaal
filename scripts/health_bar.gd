extends TextureProgressBar

var full_color : Color = "#00ff00"
var empty_color : Color = "#ff0000"

func _process(delta: float) -> void:
	var curr_value = value / 100.0
	self.tint_progress = lerp(empty_color, full_color, curr_value)
	pass
