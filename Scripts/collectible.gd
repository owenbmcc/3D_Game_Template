extends Area3D

var is_collected = false

func _on_body_entered(_body):
	# when player enters
	# increment apple count by 1
	global.apple_count = global.apple_count + 1
	#print("apple count", global.apple_count)
	queue_free() # remove object from scene
