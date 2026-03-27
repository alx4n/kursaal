extends Node2D

@onready var camera_component : CameraComponent = %CameraComponent
@onready var canvas_layer : CanvasLayer = $CanvasLayer

func _process(delta: float) -> void:
	if $Player:
		camera_component.position = $Player.position
