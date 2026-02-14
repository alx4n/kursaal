extends Camera2D

func _ready() -> void:
	events.room_enter.connect(func(room):
		#global_position = room.global_position
		pass
)
