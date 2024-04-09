extends CharacterBody3D

@export_file var dialogue_file
@export var dialog_name: String

var player : CharacterBody3D

func _ready():
	DialogueManager.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_detector_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(load(dialogue_file), dialog_name)
	player = body # get a reference to the player
	player.is_talking = true # pauses player movement

func _on_dialogue_ended(_dialog):
	player.is_talking = false # re-enables player movement

