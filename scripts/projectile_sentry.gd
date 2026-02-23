extends RigidBody2D

@export var damage_amount = 10

@onready var damage_component : DamageComponent = %DamageComponent

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
		self.queue_free()
