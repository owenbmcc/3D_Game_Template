extends Area3D

@export var level_respawn_point : Node3D

func _on_body_entered(_body):
	level_respawn_point.position = position
	$AnimationPlayer.play("activated")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("idle")
