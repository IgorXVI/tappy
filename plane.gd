extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound: AudioStreamPlayer2D = $EngineSound

const GRAVITY: float = 1500.0
const POWER: float = -500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	fly(delta)
		
	if is_on_floor() or is_on_ceiling():
		die()
	
	move_and_slide()
	
func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
	set_physics_process(false)
	
	engine_sound.stop()
	
	animated_sprite_2d.stop()
	
	SignalManager.on_plane_died.emit()
