extends CharacterBody2D

@export var speed = 300
@onready var health_component : HealthComponent = %HealthComponent
var is_dead = false

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed

func _ready() -> void:
	health_component.set_max_health(100)
	$Camera2D/HealthBar.value = health_component._max_health

func _physics_process(_delta: float) -> void:
	if !is_dead:
		getInput()
		move_and_slide()

func _on_health_component_health_changed(current: int, _max: int) -> void:
	$Camera2D/HealthBar.value = current

func _on_health_component_died() -> void:
	$PlayerIcon.queue_free()
	$Weapon.queue_free()
	$CollisionShape2D.queue_free()
	is_dead = true
