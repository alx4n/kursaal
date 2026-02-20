extends Sprite2D

const MOUSE_SENSITIVITY = .01
var mouse_delta: Vector2
const BULLET = preload("res://scenes/bullet.tscn")

@onready var muzzle: Marker2D = $Marker2D
@onready var player : Player = get_owner()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.look_at(get_global_mouse_position())
		mouse_delta = event.relative
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
			var bullet_instance = BULLET.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = muzzle.global_position
			bullet_instance.rotation = rotation
			
			for upgrade in player.upgrades:
				upgrade.apply_upgrade(bullet_instance)
	
	
