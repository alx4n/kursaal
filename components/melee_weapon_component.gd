class_name MeleeWeaponComponent extends Node

@onready var damage_component : DamageComponent = %DamageComponent

@export var player : Player
@export var damage_amount := 15
@export var attack_shape : CollisionPolygon2D
@export var anim_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack_shape.disabled = true
	pass # Replace with function body.
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		attack_shape.disabled = false
		anim_player.play("melee attack")
	elif Input.is_action_just_released("attack"):
		attack_shape.disabled = true
		#for upgrade in player.upgrades:
			#upgrade.apply_upgrade(bullet_instance)
	pass

func _on_melee_attack_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		damage_component.deal_damage(damage_amount, body)
	pass # Replace with function body.
