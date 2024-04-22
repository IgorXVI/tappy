extends Node2D

@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

var _plane_died: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * GameManager.SCROLL_SPEED


func _on_screen_exited() -> void:
	queue_free()


func _on_laiser_body_exited(body: Node2D) -> void:
	if !_plane_died and body.is_in_group(GameManager.GROUP_PLAYER):
		ScoreManager.increment_score()
		score_sound.play()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group(GameManager.GROUP_PLAYER) and body.has_method("die"):
		body.die()

func _on_plane_died() -> void:
	_plane_died = true
	set_process(false)
