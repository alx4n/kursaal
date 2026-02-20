class_name Bullet
extends Area2D

@export var speed := 10

func _process(delta: float) -> void:
	position += transform.x * speed * delta 
	
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
