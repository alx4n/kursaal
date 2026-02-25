extends CharacterBody2D

var speed = 120
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent
@onready var health_bar: ProgressBar = $ProgressBar

var collider
enum States {IDLE, CHASING}
var state = States.CHASING

func _ready() -> void:
	health_component.set_max_health(100)

func _physics_process(_delta: float) -> void:
	if state == States.CHASING:
		if get_tree().get_first_node_in_group("player") != null:
			var player_dir = get_tree().get_first_node_in_group("player").position - self.position
			$AttackDetector.position = player_dir.normalized()
			self.velocity = player_dir.normalized() * speed
	else:
		self.velocity = Vector2(0,0)
		$AttackDetector.position = self.position
	move_and_slide()
	
func _process(_delta: float) -> void:
	pass

func _on_damage_component_damage_dealt(amount: int, body: Node2D) -> void:
	body.health_component.take_damage(amount)

func _on_health_component_died() -> void:
	$SFX/SFXEnemyDeath.play()
	$SFX/SFXEnemyDeath.reparent(self.get_parent().get_node("SFX"), false)
	self.queue_free()

func _on_attack_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
		state = States.IDLE
		$AttackCooldown.start()

func _on_attack_cooldown_timeout() -> void:
	state = States.CHASING

func _on_health_component_health_changed(current: int, _max: int, _amount: int) -> void:
	health_bar.value = current
	$SFX/SFXEnemyHurt.play()
