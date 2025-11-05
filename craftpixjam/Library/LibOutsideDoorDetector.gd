extends Area2D


var libraryInside = load("res://Library/library_inside.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(EnterLibrary)
	
func EnterLibrary(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition = Vector2(158, 92)
	get_tree().change_scene_to_packed(libraryInside)
	call_deferred("queue_free")
	
