extends Control

@export_file var start_level_scene

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_start_pressed():
	get_tree().change_scene_to_file(start_level_scene)

func _on_quit_pressed():
	get_tree().quit()

func _on_check_button_toggled(toggled_on):
	global.head_bob_activated = toggled_on
