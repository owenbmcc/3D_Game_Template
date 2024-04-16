extends Area3D

@export var player_respawn_position : Node3D

var is_activated : bool = false

func _on_body_entered(_body):
	if not is_activated:
		is_activated = true
		
		# change player respawn point
		player_respawn_position.position = position
		$AudioStreamPlayer3D.play()
		$AnimationPlayer.play("activated")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("idle")
