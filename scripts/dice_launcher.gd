extends Node2D

const DIE_BULLET = preload("res://scenes/die_bullet.tscn")

@export var weapon_comp : ShootingWeaponComponent

@onready var muzzle : Marker2D = $Marker2D
@onready var weapon_name = "dice_launcher"

@export var collision_shape : CollisionShape2D
@export var weapon : PhysicsWeapon
@export var can_shoot := false
@export var anim_player : AnimationPlayer
	
var area_entered : bool = false
signal player_entered(body: Player)
signal pick_up

func _process(delta: float) -> void:
	if weapon_comp:
		weapon_comp.bullet = DIE_BULLET
		weapon_comp.anim_player = $AnimationPlayer
		if get_parent() && get_parent() == Player:
			weapon_comp.arm = get_parent().arm
			weapon_comp.player = get_parent().player
			weapon_comp.muzzle = muzzle
			if get_parent().can_fire:
				can_shoot = true
	if Input.is_action_just_pressed("pick_up"):
		pick_up.emit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	area_entered = true
	if body.is_in_group("player"):
		player_entered.emit(body)
	pass # Replace with function body.

func _on_area_2d_body_exited(body: Node2D) -> void:
	area_entered = false
	pass # Replace with function body.


func _on_player_entered(body: Player) -> void:
	await pick_up
	if area_entered:
		body.switch_weapon("dice_launcher")
		self.queue_free()
	pass # Replace with function body.
