extends CharacterBody2D


const SPEED = 20.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.LEFT
var directionTimer
func _ready() -> void:
	directionTimer = Timer.new()
	directionTimer.wait_time = 3.0
	directionTimer.autostart = true
	directionTimer.start()
	directionTimer.timeout.connect(ChangeDirection)
	add_child(directionTimer)

func ChangeDirection() -> void:
	print("Change")
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT

	directionTimer.start()
func _physics_process(delta: float) -> void:
	print(direction)
	if direction == Vector2.LEFT:
		velocity = direction * SPEED	
		move_and_slide()	
	if direction == Vector2.RIGHT:
		velocity = direction * SPEED
		move_and_slide()
