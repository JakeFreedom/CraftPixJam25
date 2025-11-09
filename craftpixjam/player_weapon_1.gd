extends Node2D
@onready var weapon: Sprite2D = $Sprite2D

var speed: float = 300
var direction: Vector2 = Vector2.DOWN #I think we can just pass in the 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Rotation based on player direction
	if direction == Vector2.LEFT:
		weapon.rotate(deg_to_rad(-135.0))
	if direction == Vector2.DOWN:
		weapon.rotate(deg_to_rad(135.0))
	if direction == Vector2.RIGHT:
		weapon.rotate(deg_to_rad(45.0))
	if direction == Vector2.UP:
		weapon.rotate(deg_to_rad(-45.0))
		
	get_tree().create_timer(1.5, true, true,false).timeout.connect(RemoveFromScene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	weapon.global_position += direction * speed * delta
	pass
	
func RemoveFromScene() -> void:
	call_deferred("queue_free")
