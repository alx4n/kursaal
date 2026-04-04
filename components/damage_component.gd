class_name DamageComponent extends Node

@export var damage_type: damage_types
@export var damage_num_label : PackedScene = preload("res://scenes/damage_number.tscn")

# signal damage_dealt(damage_amount: int, body: Node2D)

enum damage_types {
	REGULAR,
	POISON,
	CRITICAL
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func deal_damage(damage_amount: int, body: Node2D) -> void:
	if body.has_node("Components/HealthComponent"):
		if "invincible" in body:
			if body.invincible == true:
				damage_amount = 0
		body.health_component.take_damage(damage_amount)
		if damage_amount > 0:
			var damage_num = damage_num_label.instantiate()
			damage_num.text = str(damage_amount)
			damage_num.global_position = body.global_position + Vector2(0, -80)
			get_tree().root.add_child(damage_num)
		
