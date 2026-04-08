extends Node2D

var level: int = 1 #subject to change


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CenterContainer/MainButtons/Play.grab_focus()
	$CenterContainer/SettingsMenu/Fullscreen.button_pressed = true if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN else false
	$CenterContainer/SettingsMenu/MainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$CenterContainer/SettingsMenu/MusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	$CenterContainer/SettingsMenu/SfxVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(str("res://scenes/", level, ".tscn")) #subject to change
	print("play button pressed")

func _on_settings_pressed() -> void:
	$CenterContainer/SettingsMenu/Fullscreen.grab_focus()
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/SettingsMenu.visible = true

func _on_credits_pressed() -> void:
	$CenterContainer/CreditsMenu/Back.grab_focus()
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/CreditsMenu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$CenterContainer/MainButtons.visible = true
	if $CenterContainer/SettingsMenu.visible:
		$CenterContainer/SettingsMenu.visible = false
		$CenterContainer/MainButtons/Settings.grab_focus()
	if $CenterContainer/CreditsMenu.visible:
		$CenterContainer/CreditsMenu.visible = false
		$CenterContainer/MainButtons/Credits.grab_focus()

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)


func _on_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)

func _on_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
