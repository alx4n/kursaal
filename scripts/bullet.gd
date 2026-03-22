class_name Bullet
extends Area2D

@onready var damage_comp := %DamageComponent

@export var shot_damage = 10

var speed: int = 100


func _ready() -> void:
	$SFXShoot.play()


func _process(delta: float) -> void:
	position += transform.x * speed * delta 
	
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		damage_comp.deal_damage(shot_damage, body)
		self.queue_free()
	if body.is_in_group("walls"):
		self.queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
