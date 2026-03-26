extends Area2D

@onready var weapon : Node2D
@onready var damage_component : DamageComponent = %DamageComponent
@onready var muzzle : Marker2D = $Marker2D
@onready var weapons_dict = {
	"dice_launcher" : preload("res://scenes/dice_launcher.tscn"),
	"coin_revolver" : preload("res://scenes/revolver.tscn")
}

@export var arm : Arm
@export var player : Player
@export var weapon_name : String
@export var damage_amount := 15

var can_fire := false

func _ready() -> void:
	equip_weapon(weapon_name)
	
func equip_weapon(key: String):
	var new_weapon = weapons_dict[key].instantiate()
	
	if weapon:
		weapon.queue_free()
	
	add_child(new_weapon)
	weapon = new_weapon

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("pick_up") && body.is_in_group("player"):
		reparent(body.arm)
	pass # Replace with function body.
