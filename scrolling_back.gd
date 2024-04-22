extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(handle_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x -= delta * GameManager.SCROLL_SPEED


func handle_death() -> void:
	set_process(false)
