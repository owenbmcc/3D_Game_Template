extends Control

var apple_count = 0

func _on_Apple_collected():
	apple_count = apple_count + 1
	$Label.text = String(apple_count)
