extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var camera_follow_pos: Node3D = $Drone/CameraFollowPos
const DRONE = preload("res://scenes/drone.tscn")
var speed = 30
var drone
var lift = Vector3(0,5,0)
var force = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drone = DRONE.instantiate()
	drone.global_position = Vector3(0, 1, 0)
	add_child(drone)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var follow_point = drone.global_position - Vector3(0, -5, 5)
	
	camera.global_position = lerp(camera.position, follow_point, 1.0)
	camera.look_at(drone.global_position)
	
	if Input.is_action_pressed("left"):
		drone.rotate_y(deg_to_rad(1.2))
	if Input.is_action_pressed("right"):
		drone.rotate_y(deg_to_rad(-1.2))
	if Input.is_action_pressed("up"):
		drone.global_position.y += 50 * delta
	#if Input.is_action_pressed("up"):
		#force += lift
	#
	#velocit
