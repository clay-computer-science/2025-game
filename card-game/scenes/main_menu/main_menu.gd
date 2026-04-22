extends Node2D

# Menus
@onready var main_buttons: VBoxContainer = $CenterContainer/MainButtons
@onready var settings_menu: VBoxContainer = $CenterContainer/SettingsMenu
@onready var credits_menu: VBoxContainer = $CenterContainer/CreditsMenu
# Buttons and Sliders
@onready var credits: Button = $CenterContainer/MainButtons/Credits
@onready var settings: Button = $CenterContainer/MainButtons/Settings
@onready var play: Button =  $CenterContainer/MainButtons/Play
@onready var fullscreen: CheckBox = $CenterContainer/SettingsMenu/Fullscreen
@onready var main_vol_slider: HSlider = $CenterContainer/SettingsMenu/MainVolSlider
@onready var music_vol_slider: HSlider = $CenterContainer/SettingsMenu/MusicVolSlider
@onready var sfx_vol_slider: HSlider = $CenterContainer/SettingsMenu/SfxVolSlider
@onready var back: Button = $CenterContainer/CreditsMenu/Back


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play.grab_focus()
	fullscreen.button_pressed = (
		true if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN 
		else false
	)
	main_vol_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	music_vol_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx_vol_slider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _on_play_pressed() -> void:
	#TODO: Change scene to game scene when implemented
	#get_tree().change_scene_to_file("res://scenes/scene_name.tscn")
	print("play button pressed")


func _on_settings_pressed() -> void:
	fullscreen.grab_focus()
	main_buttons.visible = false
	settings_menu.visible = true


func _on_credits_pressed() -> void:
	back.grab_focus()
	main_buttons.visible = false
	credits_menu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main_buttons.visible = true
	if settings_menu.visible:
		settings_menu.visible = false
		settings.grab_focus()
	if credits_menu.visible:
		credits_menu.visible = false
		credits.grab_focus()


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
