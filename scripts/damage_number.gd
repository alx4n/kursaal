class_name DamageNumber extends Label

func _ready() -> void:
	var tween : Tween = get_tree().create_tween();
	tween.set_parallel(true)
	tween.tween_property(self, "scale", Vector2(1.3, 1.3), 0.2)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.5).set_delay(0.4)
	tween.tween_property(self, "position:y", self.global_position.y - 80, 2.0).set_delay(0.4)
	
	await tween.finished
	
	self.queue_free()
