extends Node2D

const cloud_scene = preload("res://scenes/clouds.tscn")
@export var spawn_rate: float = 2.0  # Time between spawns
@export var spawn_y_range: Vector2 = Vector2(50, 300)  # Cloud height range
@export var initial_clouds: int = 3  # Number of clouds to pre-spawn

func _ready():
	spawn_initial_clouds()  # Spawns clouds at the beginning
	start_spawning()  # Start normal spawning process

func spawn_initial_clouds():
	for i in range(initial_clouds):
		spawn_cloud(true)  # Call with instant placement

func start_spawning():
	var timer = Timer.new()
	timer.wait_time = spawn_rate
	timer.autostart = true
	timer.timeout.connect(spawn_cloud.bind(false))  # Normal spawning
	add_child(timer)

func spawn_cloud(instant = false):
	var cloud = cloud_scene.instantiate()
	cloud.position = Vector2(
		-100 if !instant else randf_range(0, get_viewport_rect().size.x),  # Offscreen left normally, but random for instant clouds
		randf_range(spawn_y_range.x, spawn_y_range.y)
	)
	add_child(cloud)
