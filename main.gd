extends Node2D

@export var pipes_scene: PackedScene

@onready var spawn_upper: Marker2D = $SpawnUpper
@onready var spawn_lower: Marker2D = $SpawnLower
@onready var spawn_timer: Timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	
	var y_pos = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	
	new_pipes.position = Vector2(spawn_lower.position.x, y_pos)
	
	add_child(new_pipes)
	
func stop_pipes() -> void:
	spawn_timer.stop()

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_died() -> void:
	stop_pipes()
