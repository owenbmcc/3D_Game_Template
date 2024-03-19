extends Area3D

var is_collected = false
signal item_collected

func _on_body_entered(body):
	# when player enters
	# increment apple count by 1
	global.apple_count = global.apple_count + 1
	#print("apple count", global.apple_count)
	body.play_pickup_sound()
	emit_signal("item_collected")
	queue_free() # remove object from scene
