extends Node2D

@onready var camera_component : CameraComponent = %CameraComponent
@onready var canvas_layer : CanvasLayer = $CanvasLayer

func _process(delta: float) -> void:
	if $Player:
		camera_component.position = $Player.position


func _on_room_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		for enemy in get_tree().get_nodes_in_group("enemy"):
			enemy.start_chasing()
