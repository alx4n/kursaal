extends Node2D

var options = false
@onready var bgm_bus_index = AudioServer.get_bus_index("BGM")
@onready var sfx_bus_index = AudioServer.get_bus_index("SFX")

func _ready() -> void:
	$OptionsScreen.hide()
	options = false
	var current_bgm_db = AudioServer.get_bus_volume_db(bgm_bus_index)
	var current_sfx_db = AudioServer.get_bus_volume_db(sfx_bus_index)
	$OptionsScreen/BGMVolSlider.value = db_to_linear(current_bgm_db)
	$OptionsScreen/SFXVolSlider.value = db_to_linear(current_sfx_db)
	$StartButton/RoomDarker.hide()
	$StartButton/Highlight.hide()
	$OptionsButton/Highlight.hide()

func _on_start_button_pressed() -> void:
	if !options:
		$SFXButton.play()
		get_tree().change_scene_to_file("res://scenes/test.tscn")

func _on_options_button_pressed() -> void:
	if !options:
		$SFXButton.play()
		options = true
		$OptionsScreen.show()

func _on_quit_button_pressed() -> void:
	if !options:
		$SFXButton.play()
		get_tree().quit()

func _on_back_button_pressed() -> void:
	if options:
		$OptionsScreen.hide()
		options = false
		$SFXButton.play()

func _on_bgm_vol_slider_value_changed(value: float) -> void:
	var db_value = linear_to_db(value)
	AudioServer.set_bus_volume_db(bgm_bus_index, db_value)
	$OptionsScreen/BGMVolSlider/Value.text = str(int(round(value * 100)))

func _on_sfx_vol_slider_value_changed(value: float) -> void:
	var db_value = linear_to_db(value)
	AudioServer.set_bus_volume_db(sfx_bus_index, db_value)
	$OptionsScreen/SFXVolSlider/Value.text = str(int(round(value * 100)))

func _on_start_button_mouse_entered() -> void:
	$StartButton/RoomDarker.show()
	$StartButton/Highlight.show()

func _on_start_button_mouse_exited() -> void:
	$StartButton/RoomDarker.hide()
	$StartButton/Highlight.hide()

func _on_options_button_mouse_entered() -> void:
	$OptionsButton/Highlight.show()

func _on_options_button_mouse_exited() -> void:
	$OptionsButton/Highlight.hide()

func _on_quit_button_mouse_entered() -> void:
	$QuitButton/Highlight.show()

func _on_quit_button_mouse_exited() -> void:
	$QuitButton/Highlight.hide()
