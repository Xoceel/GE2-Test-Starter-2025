extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var drone: RigidBody3D = $Drone
@onready var camera_follow_pos: Node3D = $Drone/CameraFollowPos

var speed = 30
var lift = Vector3(0,5,0)
var force = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera.global_position = lerp(camera.position, camera_follow_pos.global_position, 1.0)
	camera.look_at(drone.global_position)
	if Input.is_action_pressed("up"):
		force += lift
	
