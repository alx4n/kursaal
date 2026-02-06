extends Sprite2D

const MOUSE_SENSITIVITY = .01
var mouse_delta: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())
		mouse_delta = event.relative

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_delta > Vector2(0.1, 0.1):
		self.frame = 1
		await get_tree().create_timer(0.5).timeout
		self.frame = 0
	pass
