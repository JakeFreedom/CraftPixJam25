extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(ExitInn)
	pass # Replace with function body.


func ExitInn(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition = Vector2(-24,-447)
	GlobalVars.LoadVillageScene()
	
	call_deferred("queue_free")
