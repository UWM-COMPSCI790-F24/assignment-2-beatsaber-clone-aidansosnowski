extends Node3D

@export var cube_scene: PackedScene
@export var spawn_interval: float = 2.0
@export var cube_speed: float = 10.0
@export var spawn_distance: float = 50.0
@export var left_position: float = -6.0 
@export var min_y: float = -1.0
@export var max_y: float = 3.0 

@onready var player = get_parent().get_node("BlueCubeTarget")

func _ready():
	_spawn_cubes()


func _spawn_cubes():
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.timeout.connect(Callable(self, "_on_spawn_cube"))
	add_child(spawn_timer)
	spawn_timer.start()


func _on_spawn_cube():
	var cube_instance = cube_scene.instantiate()

	var spawn_y = randf_range(min_y, max_y)
	var spawn_position = player.global_transform.origin + Vector3(left_position, spawn_y, -spawn_distance)
	cube_instance.global_transform.origin = spawn_position

	get_parent().add_child(cube_instance)

	cube_instance.set("speed", cube_speed)
	cube_instance.set("target", player)
