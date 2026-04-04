class_name ShootingWeaponComponent extends Node


const MOUSE_SENSITIVITY = .01
var mouse_delta: Vector2

@onready var bullet = preload("res://scenes/bullet.tscn")
@onready var damage_component : DamageComponent = %DamageComponent

@export var muzzle: Marker2D
@export var arm : Arm
@export var player : Player
@export var damage_amount := 15
@export var can_shoot := false
@export var anim_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_shoot && Input.is_action_just_pressed("attack"):
		if anim_player:
			anim_player.play("shoot")
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = muzzle.global_position
		if arm:
			bullet_instance.rotation = arm.rotation
		#for upgrade in player.upgrades:
			#upgrade.apply_upgrade(bullet_instance)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		damage_component.deal_damage(damage_amount, body)
	pass # Replace with function body.
