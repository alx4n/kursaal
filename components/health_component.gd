class_name HealthComponent extends Node

signal died
signal took_damage(amount: int)

@export var max_health : int
var current_health: int
var is_dead := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
	is_dead = false
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	if current_health <= 0:
		died.emit()
	
func take_damage(damage: int) -> void:
	current_health -= damage
	print(took_damage)
	took_damage.emit(damage)
	
func set_max_health(_max_health: int) -> void:
	self.max_health = _max_health

func _on_damage_component_damage_dealt(damage_amount: int) -> void:
	take_damage(damage_amount)
	pass # Replace with function body.
