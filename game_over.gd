extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var space_label: Label = $SpaceLabel
@onready var timer: Timer = $Timer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(handle_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if space_label.visible and Input.is_action_just_pressed("fly"):
		ScoreManager.set_score(0)
		GameManager.load_menu_scene()


func handle_death() -> void:
	show()
	timer.start()
	game_over_sound.play()
	
func _on_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()
