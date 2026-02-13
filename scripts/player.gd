extends CharacterBody2D
@export var speed = 100
@export var dash_speed = 300

@onready var health_component : HealthComponent = %HealthComponent
@onready var damage_component : DamageComponent = %DamageComponent
@onready var is_dashing := false

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	self.velocity = input_direction * speed
	if Input.is_action_just_pressed("dash"):
		speed += dash_speed
		await get_tree().create_timer(0.25).timeout
		speed -= dash_speed
	
	
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
