extends Node2D

var options = false

func _ready() -> void:
	$OptionsScreen.hide()
	options = false

func _on_start_button_pressed() -> void:
	if !options:
		get_tree().change_scene_to_file("res://scenes/test.tscn")

func _on_options_button_pressed() -> void:
	if !options:
		options = true
		$OptionsScreen.show()

func _on_quit_button_pressed() -> void:
	if !options:
		get_tree().quit()

func _on_back_button_pressed() -> void:
	if options:
		$OptionsScreen.hide()
		options = false
