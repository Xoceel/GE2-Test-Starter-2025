extends RigidBody3D

@export var spin_props = false
@export var prop_speed = 25

@onready var drone_prop: Node3D = $Props/DroneProp
@onready var drone_prop_2: Node3D = $Props/DroneProp2
@onready var drone_prop_3: Node3D = $Props/DroneProp3
@onready var drone_prop_4: Node3D = $Props/DroneProp4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spin_props:
		drone_prop.rotate_y(deg_to_rad(prop_speed))
		drone_prop_2.rotate_y(deg_to_rad(prop_speed))
		drone_prop_3.rotate_y(deg_to_rad(prop_speed))
		drone_prop_4.rotate_y(deg_to_rad(prop_speed))
