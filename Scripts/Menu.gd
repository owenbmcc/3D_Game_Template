extends Control

# what level to load next
export (String, FILE, '*.tscn') var load_level
export var is_menu_scene = true

func _ready():
	if not is_menu_scene:
		visible = false
		$CenterContainer/VBoxContainer/Start.visible = false

# processes input from mouse and keyboard
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Start_pressed():
	if ResourceLoader.exists(load_level):
		get_tree().change_scene(load_level)


func _on_Quit_pressed():
	get_tree().quit()
