extends RigidBody2D

@export var damage_amount := 20

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		print("OOF!")
		self.queue_free()
