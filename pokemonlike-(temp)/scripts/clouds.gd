extends Node2D

@export var speed: float = 50  # Default speed

var sizes = {
	"small": {"scale": Vector2(0.6, 0.6), "speed": 100},  # Fastest
	"medium": {"scale": Vector2(0.8, 0.8), "speed": 70},  # Medium speed
	"large": {"scale": Vector2(1.2, 1.2), "speed": 40}  # Slowest
}

func _ready():
	choose_random_size()

func _process(delta):
	position.x += speed * delta  # Move right

	# If offscreen on the right, despawn
	if position.x > get_viewport_rect().size.x + 200:
		queue_free()

func choose_random_size():
	var size_keys = sizes.keys()
	var chosen_size = size_keys[randi() % size_keys.size()]  # Randomly select small, medium, or large
	scale = sizes[chosen_size]["scale"]  # Apply size scaling
	speed = sizes[chosen_size]["speed"]  # Apply correct speed
