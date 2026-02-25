extends CharacterBody2D

@export var projectile_scene : Resource
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent
@onready var health_bar : ProgressBar = $ProgressBar

var projectile_speed = 250

func _ready() -> void:
	$ProjectileTimer.start()
	health_component.set_max_health(300)
	pass
	
func _process(_delta: float) -> void:
	#if get_tree().get_first_node_in_group("player") != null:
	pass


func _on_health_component_died() -> void:
	self.queue_free()
	pass # Replace with function body.


func _on_health_component_health_changed(current: int, _max: int, _amount: int) -> void:
	health_bar.value = current
	pass # Replace with function body.


func _on_projectile_timer_timeout() -> void:
	for i in 12:
		var new_projectile = projectile_scene.instantiate()
		new_projectile.rotation = i * 100.0
		get_tree().get_root().add_child(new_projectile)
		new_projectile.global_position = self.global_position
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
