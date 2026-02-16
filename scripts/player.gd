extends CharacterBody2D
@export var speed = 300

@onready var health_component : HealthComponent = %HealthComponent

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed

func _ready() -> void:
	health_component.set_max_health(100)
	# $Camera2D/HealthBar.value = health_component.current_health

func _physics_process(_delta: float) -> void:
	getInput()
	move_and_slide()

func _on_health_component_health_changed(current: int, _max: int) -> void:
	# $Camera2D/HealthBar.value = current
	pass
