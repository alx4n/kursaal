extends Area2D

@onready var damage_comp := %DamageComponent

@export var shot_damage = 10

const speed: int = 100

func _process(delta: float) -> void:
	position += transform.x * speed * delta 
	
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	damage_comp.deal_damage(shot_damage, body)
	pass # Replace with function body.
