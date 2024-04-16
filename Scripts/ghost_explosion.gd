extends Node3D

func _ready():
	# start particles
	$GPUParticles3D.emitting = true
	
	# remove particle instance after playing
	await $GPUParticles3D.finished
	queue_free()
