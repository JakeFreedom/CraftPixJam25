extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(ExitLibrary)




func ExitLibrary(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition = Vector2(-365, -217)
	GlobalVars.call_deferred("LoadVillageScene")
	call_deferred("queue_free")
