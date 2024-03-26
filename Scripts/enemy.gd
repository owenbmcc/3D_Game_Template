extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@export var speed = 3
@export var patrol_locations : Array[Marker3D]

func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed
	velocity = new_velocity
	look_at(current_location + new_velocity)
	
	move_and_slide()
	
	
	

func update_target_location(target_location):
	nav_agent.set_target_position(target_location)
