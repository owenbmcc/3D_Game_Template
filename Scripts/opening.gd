extends Control

@export_file var dialog
@export_file var next_scene
@export var dialog_name : String

func _ready():
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	DialogueManager.show_example_dialogue_balloon(load(dialog), dialog_name)

func _on_dialogue_ended(_resource):
	get_tree().change_scene_to_file(next_scene)
