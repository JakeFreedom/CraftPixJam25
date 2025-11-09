class_name NPC
extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"


var dialogFile = "res://NPCs/JSON Files/innkeeper.json"
var NPCID: int = 2

const SPEED = 20.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.LEFT
var directionTimer


func _ready() -> void:
	directionTimer = Timer.new()
	directionTimer.wait_time = 3.0
	directionTimer.autostart = true
	directionTimer.timeout.connect(ChangeDirection)
	add_child(directionTimer)
	directionTimer.start()
	
	get_node("WalkLeft").visible = true
	PlayAnimation()
	get_node("FaceDown").visible = false
	

func ChangeDirection() -> void:
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
	PlayAnimation()
	directionTimer.start()
func _physics_process(delta: float) -> void:
	if direction == Vector2.LEFT:
		velocity = direction * SPEED	
		move_and_slide()	
	if direction == Vector2.RIGHT:
		velocity = direction * SPEED
		move_and_slide()
		#CheckCollisions()

func PlayAnimation() -> void:
	if direction == Vector2.LEFT:
		animation_player.play("WalkLeft")
		get_node("WalkLeft").visible = true
		get_node("WalkRight").visible = false
		
	if direction == Vector2.RIGHT:
		animation_player.play("WalkRight")
		get_node("WalkLeft").visible = false
		get_node("WalkRight").visible = true


#func CheckCollisions() -> void:
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i) as KinematicCollision2D
		#print(collision)
