extends CharacterBody2D

var speed = 120
@export var damage_amount: int
@onready var health_component: HealthComponent = %HealthComponent
@onready var damage_component: DamageComponent = %DamageComponent
var collider
enum States {IDLE, CHASING}
var state = States.CHASING

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

func _on_attack_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("YEOWCH!")
		state = States.IDLE
		$AttackCooldown.start()

func _on_attack_cooldown_timeout() -> void:
	state = States.CHASING
