extends Control

@onready var play_button: TextureButton = $VBoxContainer/PlayButton
@onready var settings_button: TextureButton = $VBoxContainer/SettingsButton
@onready var quit_button: TextureButton = $VBoxContainer/QuitButton


func _ready():
	play_button.pressed.connect(on_play_pressed)
	settings_button.pressed.connect(on_settings_pressed)
	quit_button.pressed.connect(on_quit_pressed)

func on_play_pressed():
	print("Play button pressed!")  # Replace with scene transition logic

func on_settings_pressed():
	print("Settings button pressed!")  # Open settings menu

func on_quit_pressed():
	get_tree().quit()  # Quit the game
