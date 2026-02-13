extends CharacterBody2D

var speed = 150
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent

func _physics_process(_delta: float) -> void:
	var player_dir = get_tree().get_first_node_in_group("player").position - self.position
	self.velocity = player_dir.normalized() * speed
	move_and_slide()
	
func _process(_delta: float) -> void:
	pass
