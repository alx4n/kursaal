extends Area2D

@onready var damage_component : DamageComponent = $DamageComponent
@export var damage_amount:= 10






	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
