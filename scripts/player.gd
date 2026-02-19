extends CharacterBody2D
@export var speed = 300
@export var dash_speed = 300

@onready var health_component : HealthComponent = %HealthComponent
@onready var damage_component : DamageComponent = %DamageComponent
@onready var health_bar : ProgressBar = $CanvasLayer/HealthBar
@onready var is_dashing := false

var invincible = false

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
	
func _ready() -> void:
	health_component.set_max_health(100)
	health_bar.value = health_component.current_health

func _on_health_component_died() -> void:
	if self.get_parent().has_node("CanvasLayer"):
		health_bar.reparent(self.get_parent().get_node("CanvasLayer"), false)
	self.queue_free()
	pass # Replace with function body.

# Changes value of health bar, if damage is taken, play invicibility frames
func _on_health_component_health_changed(current: int, _max_health: int, amount: int) -> void:
	health_bar.value = current
	if amount < 0:
		$AnimationPlayer.play("damage_taken")
		invincible = true
		print(invincible)
		await get_tree().create_timer(3.0).timeout
		invincible = false
		
	pass # Replace with function body.
