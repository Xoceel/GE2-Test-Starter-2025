extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var camera_follow_pos: Node3D = $Drone/CameraFollowPos
const DRONE = preload("res://scenes/drone.tscn")
var speed = 30
var drone
var lift = Vector3(0,5,0)
var force = Vector3.ZERO
var lift_force = 40
var follow_point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drone = DRONE.instantiate()
	drone.global_position = Vector3(0, 1, 0)
	add_child(drone)
	follow_point = Node3D.new()
	follow_point.position = drone.position - Vector3(0, -5, 5)
	drone.add_child(follow_point)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	camera.global_position = lerp(camera.position, follow_point.global_position, 0.08)
	camera.look_at(drone.global_position)
	
	if Input.is_anything_pressed():
		drone.spin_props = true
	else:
		drone.spin_props = false
	
	if Input.is_action_pressed("left"):
		drone.rotate_y(deg_to_rad(1.2))
	if Input.is_action_pressed("right"):
		drone.rotate_y(deg_to_rad(-1.2))
	if Input.is_action_pressed("up"):
		drone.global_position.y += lift_force * delta
	if Input.is_action_pressed("forward"):
		drone.global_rotation.x = deg_to_rad(-5)
	if Input.is_action_pressed("forward"):
		drone.global_rotation.x = deg_to_rad(5)
	#if Input.is_action_pressed("up"):
		#force += lift
	#
	#velocit
