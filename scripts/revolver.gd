extends Node2D

const COIN_BULLET = preload("res://scenes/coin_bullet.tscn")
@onready var weapon_comp := %ShootingWeaponComponent
@onready var muzzle : Marker2D = $Marker2D

func _ready() -> void:
	weapon_comp.bullet = COIN_BULLET
	weapon_comp.arm = get_parent().arm
	weapon_comp.player = get_parent().player
	weapon_comp.muzzle = muzzle
