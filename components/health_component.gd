class_name HealthComponent extends Node

signal health_changed(current: int, max: int, amount: int)
signal died

@export var _max_health : int
var current_health: int
var is_dead := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = _max_health
	is_dead = false
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	if current_health <= 0:
		is_dead = true
		died.emit()
	if current_health > _max_health:
		current_health = _max_health
	
func heal(amount: int) -> void:
	current_health += amount
	health_changed.emit(current_health, _max_health, amount)

func take_damage(damage: int) -> void:
	current_health -= damage
	health_changed.emit(current_health, _max_health, -damage)
	
func set_max_health(max_health: int) -> void:
	self._max_health = max_health
