class_name PhysicsWeapon extends Area2D

@onready var weapon : Node2D
@onready var damage_component : DamageComponent = %DamageComponent
@onready var shooting_comp := %ShootingWeaponComponent
@onready var melee_comp := %MeleeWeaponComponent
@onready var muzzle : Marker2D = $Marker2D
@onready var weapons_dict = {
	"dice_launcher" : ["shooting", preload("res://scenes/dice_launcher.tscn"), preload("res://scenes/die_bullet.tscn")],
	"coin_revolver" : ["shooting", preload("res://scenes/revolver.tscn"), preload("res://scenes/coin_bullet.tscn")],
	"hatchet" : ["melee", preload("res://scenes/marlboro_hatchet.tscn")],
	"card_launcher" : ["shooting", preload("res://scenes/card_launcher.tscn"), preload("res://scenes/card_bullet.tscn")]
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
		melee_comp.player = player
		shooting_comp.muzzle = muzzle
	
func _process(delta: float) -> void:
	shooting_comp.can_shoot = can_fire
	
func equip_weapon(key: String):
	var new_weapon = weapons_dict[key][1].instantiate()
	new_weapon.collision_shape.disabled = true
	if weapons_dict[key][0] == "shooting":
		new_weapon.weapon_comp = shooting_comp
		melee_comp.process_mode = Node.PROCESS_MODE_DISABLED
		shooting_comp.process_mode = Node.PROCESS_MODE_INHERIT
		shooting_comp.bullet = weapons_dict[key][2]
		can_fire = true
	elif weapons_dict[key][0] == "melee":
		shooting_comp.process_mode = Node.PROCESS_MODE_DISABLED
		melee_comp.process_mode = Node.PROCESS_MODE_INHERIT
		new_weapon.weapon_comp = melee_comp
		can_fire = false
	if weapon:
		drop_weapon()
		weapon.queue_free()
	add_child(new_weapon)
	weapon = new_weapon

func drop_weapon() -> void:
	var current_weapon = weapons_dict[weapon.weapon_name][1].instantiate()
	current_weapon.global_scale = Vector2(0.25, 0.25)
	current_weapon.global_position = player.global_position
	get_tree().root.add_child(current_weapon)
	
