extends Area3D

@onready var hand = $"../Hand"
@onready var camera = $".."

var pull_speed = 2
var throw_speed = 8

var pickup_object = null
var is_picked = false

func _physics_process(_delta):
	# check that we have an object picked up
	if pickup_object and is_picked:
		# get the distance between object and hand
		var obj_pos = pickup_object.global_transform.origin
		var hand_pos = hand.global_transform.origin
		# get the direction of that distance
		var dir = (hand_pos - obj_pos).normalized() * pull_speed
		# move the object in that direction
		pickup_object.set_linear_velocity(dir)

# detect user input
func _unhandled_input(_event):
	# if user hits "f" or pickup button
	if Input.is_action_just_pressed("pickup"):
		# if object detected
		if pickup_object:
			# if object already picked up
			if is_picked:
				# drop object
				pickup_object = null
				is_picked = false
			else:
				# pick up object
				is_picked = true
	
	# detect user clicked throw
	if Input.is_action_just_pressed("throw"):
		# get direction of camera
		var dir = -camera.global_transform.basis.z.normalized()
		# add an upward direction
		dir = dir + Vector3(0, 1, 0)
		# apply force in direction with throw_speed
		pickup_object.apply_impulse(dir * throw_speed)
		# remove object
		pickup_object = null
		is_picked = false

func _on_body_entered(body):
	# first check if an object is picked up
	if pickup_object and is_picked:
		# if so, end function here
		return
	pickup_object = body
