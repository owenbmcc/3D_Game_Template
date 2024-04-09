extends Area3D

@export_file var level_to_load

var player_entered = false
signal update_console

func _unhandled_input(_event):
	if Input.is_action_just_pressed("portal"):
		get_tree().change_scene_to_file(level_to_load)

func _on_body_entered(_body):
	player_entered = true
	if not global.has_special_key:
		emit_signal("update_console", "You need to find the special key")
	else:
		emit_signal("update_console", "Press G to go to the next level")

func _on_body_exited(_body):
	player_entered = false
	emit_signal("update_console", "")
