extends RigidBody2D

@onready var damage_component : DamageComponent = %DamageComponent

@export var damage_amount := 20

func _ready() -> void:
	$SFXEnemyShoot.play()

	$Timer.one_shot = true
	$Timer.wait_time = 5
	$Timer.start()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
		self.queue_free()
	else:
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
