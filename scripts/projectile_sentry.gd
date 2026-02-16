extends RigidBody2D

@export var damage_amount = 10

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.health_component.take_damage(damage_amount)
		self.queue_free()
