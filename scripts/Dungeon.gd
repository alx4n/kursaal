extends Node2D

@onready var camera_component : CameraComponent = %TransitionCamera
@onready var canvas_layer : CanvasLayer = $CanvasLayer
@onready var player : CharacterBody2D = $Player

func _process(_delta: float) -> void:
	if player != null:
		camera_component.position = player.position
