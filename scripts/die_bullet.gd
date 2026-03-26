extends Bullet

func _ready() -> void:
	shot_damage = randi_range(1, 6)
	$Sprite2D.frame = shot_damage - 1
	speed = 1000
