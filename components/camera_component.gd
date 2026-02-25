class_name CameraComponent extends Camera2D

@export var parent : Node2D
@onready var scene : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(0, 0)
	if parent.get_parent() == Node2D:
		scene = parent.get_parent()
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if parent == null:
		reparent(scene, true)
		if scene.camera_component:
			self.position = scene.camera_component.position
