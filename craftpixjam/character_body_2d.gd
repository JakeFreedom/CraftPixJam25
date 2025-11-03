extends CharacterBody2D


const SPEED = 25.0
const JUMP_VELOCITY = -400.0
@onready var playerAnimation: AnimationPlayer = $AnimationPlayer
@onready var walk_down: Sprite2D = $WalkDown
@onready var walk_left: Sprite2D = $WalkLeft
@onready var walk_right: Sprite2D = $WalkRight
@onready var walk_up: Sprite2D = $WalkUp


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		set_animation(direction)
		if playerAnimation.is_playing():
			velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y,0, SPEED)
		playerAnimation.stop()

	move_and_slide()


func set_animation(direction: Vector2) -> void:
	if direction == Vector2.UP:
		playerAnimation.play("WalkUp")
		walk_up.visible = true;
		walk_down.visible = false;
		walk_left.visible = false;
		walk_right.visible = false;
		pass
		
	if direction == Vector2.DOWN:
		playerAnimation.play("WalkDown")
		walk_up.visible = false;
		walk_down.visible = true;
		walk_left.visible = false;
		walk_right.visible = false;
		pass
	
	if direction == Vector2.LEFT:
		playerAnimation.play("WalkLeft")
		walk_up.visible = false;
		walk_down.visible = false;
		walk_left.visible = true;
		walk_right.visible = false;
		pass
		
	if direction == Vector2.RIGHT:
		playerAnimation.play("WalkRight")
		walk_up.visible = false;
		walk_down.visible = false;
		walk_left.visible = false;
		walk_right.visible = true;
		
