extends Control

func _ready():
	$CenterContainer2/Console.text = ""

func _on_collectible_item_collected():
	$CenterContainer/AppleCount.text = str(global.apple_count)

func _on_pickup_area_update_console(message):
	$CenterContainer2/Console.text = message

func _on_portal_update_console(message):

	$CenterContainer2/Console.text = message
