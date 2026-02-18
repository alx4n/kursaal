extends CharacterBody2D

@export var projectile_scene : Resource
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent
@onready var health_bar : ProgressBar = $ProgressBar

var projectile_speed = 250

func _ready() -> void:
	$ProjectileTimer.start()
	health_component.set_max_health(100)

func _on_projectile_timer_timeout() -> void:
	if get_tree().get_first_node_in_group("player") != null:
		var player_dir = (get_tree().get_first_node_in_group("player").position - self.position).normalized()
		var new_projectile = projectile_scene.instantiate()
		get_tree().get_root().add_child(new_projectile)
		new_projectile.global_position = self.global_position
		new_projectile.linear_velocity = Vector2(player_dir.x * projectile_speed, player_dir.y * projectile_speed)

func _on_health_component_died() -> void:
	self.queue_free()
	pass # Replace with function body.


func _on_health_component_health_changed(current: int, max: int, amount: int) -> void:
	health_bar.value = current
	pass # Replace with function body.
