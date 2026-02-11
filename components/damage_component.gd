class_name DamageComponent extends Node

@export var damage_type: damage_types

signal damage_dealt(damage_amount: int, body: Node2D)

enum damage_types {
	REGULAR,
	POISON,
	CRITICAL
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func deal_damage(damage_amount: int, body: Node2D) -> void:
	damage_dealt.emit(damage_amount, body)
