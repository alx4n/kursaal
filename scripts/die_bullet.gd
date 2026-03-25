extends Bullet

func _ready() -> void:
	shot_damage = randi_range(1, 6)
	speed = 750
