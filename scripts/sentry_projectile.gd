extends RigidBody2D

@onready var damage_component : DamageComponent = %DamageComponent

@export var damage_amount := 20

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
		self.queue_free()
