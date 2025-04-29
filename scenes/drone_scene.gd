extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var camera_follow_pos: Node3D = $DroneBody/CameraFollowPos
@onready var drone: RigidBody3D = $Drone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(camera_follow_pos.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera.global_position = lerp(camera.position, Vector3(0,0,0), 1)
	camera.look_at(drone.global_position)
	if Input.is_action_pressed("up"):
		position.x += 1
