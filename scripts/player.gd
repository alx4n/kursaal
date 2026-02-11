extends CharacterBody2D
@export var speed = 100

@onready var health_component : HealthComponent = %HealthComponent

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	
	
func _physics_process(_delta: float) -> void:
	getInput()
	move_and_slide()
	
func _process(_delta: float) -> void:
	health_component.set_max_health(100)
	pass


func _on_damage_component_damage_dealt(amount: int, body: Node2D) -> void:
	body.health_component.take_damage(amount)
	pass # Replace with function body.


func _on_health_component_died() -> void:
	self.queue_free()
	pass # Replace with function body.
