extends Node2D

const DIE_BULLET = preload("res://scenes/die_bullet.tscn")
@onready var weapon_comp := %ShootingWeaponComponent
@onready var muzzle : Marker2D = $Marker2D
@export var can_shoot := false
@export var collision_shape : CollisionShape2D

func _ready() -> void:
	weapon_comp.bullet = DIE_BULLET
	weapon_comp.arm = get_parent().arm
	weapon_comp.player = get_parent().player
	weapon_comp.muzzle = muzzle
	
func _process(delta: float) -> void:
	if get_parent().can_fire:
		weapon_comp.can_shoot = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.switch_weapon("dice_launcher")
		self.queue_free()
	pass # Replace with function body.
