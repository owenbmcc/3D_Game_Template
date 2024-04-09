extends Control

@export_file var dialog_file
@export var dialog_name : String
@export_file var next_scene

func _ready():
	DialogueManager.show_example_dialogue_balloon(load(dialog_file), dialog_name)
	DialogueManager.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_ended(_dialogue):
	get_tree().change_scene_to_file(next_scene)
