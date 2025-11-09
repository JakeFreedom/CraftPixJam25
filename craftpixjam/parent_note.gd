extends Node2D

@onready var close_note: Button = $TileMapLayer/CloseNote

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_note.pressed.connect(func(): call_deferred("queue_free"))
