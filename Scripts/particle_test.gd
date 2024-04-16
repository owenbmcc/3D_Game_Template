extends Node3D

func _ready():
	$GPUParticles3D.emitting = true
	await $GPUParticles3D.finished
	queue_free()


