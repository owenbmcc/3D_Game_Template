extends Area

# what level to load next
export (String, FILE, '*.tscn') var load_level

# when player has entered
func _on_Portal_body_entered(_body):
	if ResourceLoader.exists(load_level):
		get_tree().change_scene(load_level)
