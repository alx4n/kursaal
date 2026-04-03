extends Node2D






func _on_door_1_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Rooms/Room2.tscn")
	
	


func _on_door_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Rooms/bossRoom.tscn")
