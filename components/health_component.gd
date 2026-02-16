class_name HealthComponent extends Node

signal health_changed(current: int, max: int)
signal died

@export var _max_health : int
var current_health: int
var is_dead := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = _max_health
	is_dead = false
	pass # Replace with function body.
	
func heal(amount: int) -> void:
	current_health += amount
	health_changed.emit(current_health, _max_health)

func take_damage(damage: int) -> void:
	current_health -= damage
	health_changed.emit(current_health, _max_health)
	if current_health <= 0:
		died.emit()
	
func set_max_health(max_health: int) -> void:
	self._max_health = max_health

func _on_damage_component_damage_dealt(damage_amount: int) -> void:
	take_damage(damage_amount)
	pass # Replace with function body.
