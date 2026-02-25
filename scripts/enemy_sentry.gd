extends CharacterBody2D

@export var projectile_scene : Resource
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent
@onready var health_bar : ProgressBar = $ProgressBar
@onready var player := get_tree().root.get_node("/root/Dungeon/Player")

var projectile_speed = 250

func _ready() -> void:
	$ProjectileTimer.start()
	health_component.set_max_health(100)
	
func _process(delta: float) -> void:
	if player != null:
		self.look_at(player.position)

func _on_projectile_timer_timeout() -> void:
	if get_tree().get_first_node_in_group("player") != null:
		var new_projectile = projectile_scene.instantiate()
		get_tree().get_root().add_child(new_projectile)
		new_projectile.global_position = self.global_position
		new_projectile.rotation = self.rotation
		$SFX/SFXEnemyShoot.play()

func _on_health_component_died() -> void:
	$SFX/SFXEnemyDeath.play()
	$SFX/SFXEnemyDeath.reparent(self.get_parent().get_node("SFX"), false)
	self.queue_free()

func _on_health_component_health_changed(current: int, _max: int, _amount: int) -> void:
	health_bar.value = current
	$SFX/SFXEnemyHurt.play()
