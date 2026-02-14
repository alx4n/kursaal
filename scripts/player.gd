extends CharacterBody2D
@export var speed = 100

@onready var health_component : HealthComponent = %HealthComponent

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed

	
	
func _physics_process(delta: float) -> void:
	getInput()
	move_and_slide()
	
func _process(_delta: float) -> void:
	health_component.set_max_health(100)
	pass
