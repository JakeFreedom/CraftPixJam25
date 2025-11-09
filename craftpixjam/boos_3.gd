extends CharacterBody2D


const SPEED = 25.0
const JUMP_VELOCITY = -400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("WalkLeft")

func _physics_process(delta: float) -> void:
	velocity = Vector2.LEFT * SPEED

	move_and_slide()
	
