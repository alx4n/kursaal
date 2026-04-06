extends Node2D

@export var collision_shape : CollisionShape2D
@export var weapon_comp : MeleeWeaponComponent

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.switch_weapon("hatchet")
		self.queue_free()
	pass # Replace with function body.

func _process(delta: float) -> void:
	if weapon_comp:
		weapon_comp.anim_player = $AnimationPlayer
	pass
