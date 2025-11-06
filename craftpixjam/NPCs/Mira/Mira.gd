extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"


var direction : Vector2 = Vector2.UP
var directionTimer: Timer

const SPEED = 50.0
const JUMP_VELOCITY = -400.0

var dialogFile = "res://NPCs/JSON Files/mira.json"
var NPCID: int = 1

func _ready() -> void:
	directionTimer = Timer.new()
	directionTimer.wait_time = 35.0
	directionTimer.timeout.connect(ChangeDirection)
	directionTimer.autostart = true
	add_child(directionTimer)
	directionTimer.start()
	animation_player.play("WalkUp")
	ShowHideSprites()

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()
	
	
func ChangeDirection() -> void:
	print("change directions")
	print(direction)
	direction = Vector2.DOWN if direction==Vector2.UP else Vector2.UP 
	print(direction)
	directionTimer.start()
	PlayAnimation()
	ShowHideSprites()
	pass	
func PlayAnimation() -> void:
	if direction == Vector2.UP:
		animation_player.play("WalkUp")
	else:
		animation_player.play("WalkDown")
		
func ShowHideSprites() -> void:
	get_node("Idle").visible = false
	if direction == Vector2.UP:
		get_node("WalkDown").visible = false
		get_node("WalkUp").visible = true
	else:
		get_node("WalkDown").visible = true
		get_node("WalkUp").visible = false
