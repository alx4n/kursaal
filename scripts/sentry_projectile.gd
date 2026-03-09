extends Area2D

@onready var damage_component : DamageComponent = %DamageComponent

@export var damage_amount := 20
const speed: int = 150

func _process(delta: float) -> void:
	position += transform.x * speed * delta 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _ready() -> void:
	$SFXEnemyShoot.play()

	$Timer.one_shot = true
	$Timer.wait_time = 5
	$Timer.start()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		damage_component.deal_damage(damage_amount, body)
		self.queue_free()



	
	
