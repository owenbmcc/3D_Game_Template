extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@export var speed = 3
@export var patrol_locations : Array[Marker3D]

var patrol_index : int = 0
var follow_player : bool = false
var wait_frame : bool = true

func _ready():
	set_patrol_location()
	
func set_patrol_location():
	nav_agent.set_target_position(patrol_locations[patrol_index].global_position)

func _physics_process(delta):
	if wait_frame:
		wait_frame = false
		return
		
	if nav_agent.distance_to_target() < 1 and not follow_player:
		patrol_index = patrol_index + 1
		if patrol_index >= patrol_locations.size():
			patrol_index = 0
		set_patrol_location()
		return
		
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed
	velocity = new_velocity
	look_at(current_location + new_velocity)
	move_and_slide()

func update_target_location(target_location):
	if not follow_player:
		return
	nav_agent.set_target_position(target_location)

func _on_player_detect_body_entered(_body):
	follow_player = true

func _on_player_detect_body_exited(_body):
	follow_player = false
	set_patrol_location()

func _on_hit_box_body_entered(_body):
	queue_free()
