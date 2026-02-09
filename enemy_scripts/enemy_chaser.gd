extends CharacterBody2D

var speed = 150

func _physics_process(_delta: float) -> void:
	var player_dir = get_tree().get_first_node_in_group("player").position - self.position
	self.velocity = player_dir.normalized() * speed
	move_and_slide()
