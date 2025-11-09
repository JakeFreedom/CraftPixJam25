extends CharacterBody2D


@export var StartDirection: Vector2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var walk_left: Sprite2D = $WalkLeft
@onready var walk_right: Sprite2D = $WalkRight

var SPEED: float = 50.0
var walkTimer: Timer = Timer.new()
var direction: Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	walkTimer.wait_time = 35
	walkTimer.timeout.connect(ChangeDirection)
	walkTimer.autostart
	add_child(walkTimer)
	walkTimer.start()
	if StartDirection == Vector2.LEFT:
		walk_left.visible = true
		animation_player.play("WalkLeft")
		direction = Vector2.LEFT
	else:
		walk_right.visible = true
		animation_player.play("WalkRight")
		direction = Vector2.RIGHT



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()
	
	
func ChangeDirection() -> void:
	ChangeAnimation()
	
	walkTimer.start()
	pass
	
func ChangeAnimation() -> void:
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
		walk_left.visible = false
		walk_right.visible = true
		animation_player.play("WalkRight")
	else:
		direction = Vector2.LEFT
		walk_left.visible = true
		walk_right.visible = false
		animation_player.play("WalkLeft")
