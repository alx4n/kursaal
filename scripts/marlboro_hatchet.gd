extends Node2D

@export var collision_shape : CollisionShape2D
@export var weapon_comp : MeleeWeaponComponent

@onready var weapon_name = "hatchet"

var area_entered : bool = false
signal player_entered(body: Player)
signal pick_up

func _on_area_2d_body_entered(body: Node2D) -> void:
	area_entered = true
	if body.is_in_group("player"):
		player_entered.emit(body)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if weapon_comp:
		weapon_comp.anim_player = $AnimationPlayer
	if Input.is_action_just_pressed("pick_up"):
		pick_up.emit()
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	area_entered = false
	pass # Replace with function body.


func _on_player_entered(body: Player) -> void:
	await pick_up
	if area_entered:
		body.switch_weapon("hatchet")
		self.queue_free()
	pass # Replace with function body.
