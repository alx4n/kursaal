class_name PhysicsWeapon extends Area2D

@onready var weapon : Node2D
@onready var damage_component : DamageComponent = %DamageComponent
@onready var shooting_comp := %ShootingWeaponComponent
@onready var melee_comp := %MeleeWeaponComponent
@onready var muzzle : Marker2D = $Marker2D
@onready var weapons_dict = {
	"dice_launcher" : [preload("res://scenes/dice_launcher.tscn"), preload("res://scenes/die_bullet.tscn")],
	"coin_revolver" : [preload("res://scenes/revolver.tscn"), preload("res://scenes/coin_bullet.tscn")]
}

@export var arm : Arm
@export var player : Player
@export var weapon_name : String
@export var damage_amount := 15

var can_fire := false

func _ready() -> void:
	if weapon_name:
		equip_weapon(weapon_name)
	if player:
		shooting_comp.arm = arm
		shooting_comp.player = player
		shooting_comp.muzzle = muzzle
		shooting_comp.can_shoot = true
	
	
func equip_weapon(key: String):
	var new_weapon = weapons_dict[key][0].instantiate()
	if weapon:
		weapon.queue_free()
	add_child(new_weapon)
	shooting_comp.bullet = weapons_dict[key][1]
	weapon = new_weapon

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("pick_up") && body.is_in_group("player"):
		reparent(body.arm)
	pass # Replace with function body.
