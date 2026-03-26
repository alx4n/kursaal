extends Node2D

const DIE_BULLET = preload("res://scenes/die_bullet.tscn")
@onready var weapon_comp := %ShootingWeaponComponent
@onready var muzzle : Marker2D = $Marker2D
@export var can_shoot := false

func _ready() -> void:
	weapon_comp.bullet = DIE_BULLET
	weapon_comp.arm = get_parent().arm
	weapon_comp.player = get_parent().player
	weapon_comp.muzzle = muzzle
	
func _process(delta: float) -> void:
	if get_parent().can_fire:
		weapon_comp.can_shoot = true
