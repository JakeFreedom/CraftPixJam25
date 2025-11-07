class_name Player
extends CharacterBody2D

@export var weaponScene: PackedScene

const SPEED = 225.0
const JUMP_VELOCITY = -400.0
@onready var playerAnimation: AnimationPlayer = $AnimationPlayer
@onready var walk_down: Sprite2D = $WalkDown
@onready var walk_left: Sprite2D = $WalkLeft
@onready var walk_right: Sprite2D = $WalkRight
@onready var walk_up: Sprite2D = $WalkUp

var dialogScene = preload("res://NPCDialog/dialog.tscn")
var direction
var facingDirection: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		facingDirection = direction
		
	if direction:
		set_animation(direction)
		if playerAnimation.is_playing():
			velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y,0, SPEED)
		playerAnimation.stop()

	move_and_slide()

func _process(delta: float) -> void:
	#look for input to cast our sword
	if Input.is_action_just_pressed("cast_sword"):
		var weaponInstance = weaponScene.instantiate()
		weaponInstance.direction = facingDirection
		get_node("WeaponSlot").add_child(weaponInstance)
		pass

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
		
func TriggerDialog(dialogFile: String, npcID: int) -> void:
	get_tree().paused = true
	var dialog = dialogScene.instantiate()
	dialog.dialogJsonFile = dialogFile
	dialog.npcID = npcID
	dialog.z_index = 10
	get_tree().get_first_node_in_group("Player").get_node("DialogControl").add_child(dialog)
	
