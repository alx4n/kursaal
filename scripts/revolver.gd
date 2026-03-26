extends Node2D

const COIN_BULLET = preload("res://scenes/coin_bullet.tscn")

@onready var weapon_comp := %ShootingWeaponComponent
@onready var muzzle : Marker2D = $Marker2D

@export var can_shoot := false

func _ready() -> void:
	weapon_comp.bullet = COIN_BULLET
	if get_parent() && get_parent() == Player:
		weapon_comp.arm = get_parent().arm
		weapon_comp.player = get_parent().player
		weapon_comp.muzzle = muzzle
		if get_parent().can_fire:
			can_shoot = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.switch_weapon("coin_revolver")
		self.queue_free()
	pass # Replace with function body.
