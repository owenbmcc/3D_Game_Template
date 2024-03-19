extends Control

@export var start_level_scene: PackedScene

func _on_start_pressed():
	get_tree().change_scene_to_packed(start_level_scene)

func _on_quit_pressed():
	get_tree().quit()


func _on_check_button_toggled(toggled_on):
	global.head_bob_activated = toggled_on
