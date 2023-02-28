extends Area

var is_collected = false
signal collected

func _on_Apple_body_entered(body):
	if not is_collected:
		is_collected = true
		emit_signal("collected")
		queue_free()
