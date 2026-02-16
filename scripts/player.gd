extends CharacterBody2D
@export var speed = 300
@export var dash_speed = 300

@onready var health_component : HealthComponent = %HealthComponent
@onready var damage_component : DamageComponent = %DamageComponent
@onready var is_dashing := false

func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	self.velocity = input_direction * speed
	if Input.is_action_just_pressed("dash"):
		speed += dash_speed
		await get_tree().create_timer(0.275).timeout
		speed -= dash_speed
	
	
func _physics_process(_delta: float) -> void:
	getInput()
	move_and_slide()
	
func _process(_delta: float) -> void:
	health_component.set_max_health(100)
	#if Input.is_action_just_pressed("dash"):
		#damage_component.deal_damage(15, self)
func _ready() -> void:
	health_component.set_max_health(100)
	# $Camera2D/HealthBar.value = health_component.current_health

func _on_health_component_health_changed(current: int, _max: int) -> void:
	# $Camera2D/HealthBar.value = current
	pass


func _on_damage_component_damage_dealt(amount: int, body: Node2D) -> void:
	body.health_component.take_damage(amount)
	pass # Replace with function body.


func _on_health_component_died() -> void:
	self.queue_free()
	pass # Replace with function body.


func _on_health_component_health_changed(current: int, max_health: int, amount: int) -> void:
	if amount < 0:
		$AnimationPlayer.play("damage_taken")
	pass # Replace with function body.
