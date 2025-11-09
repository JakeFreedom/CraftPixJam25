extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(doorDetector_onEntered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func doorDetector_onEntered(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition = Vector2(152,200)
	GlobalVars.call_deferred("LoadVillageScene")
	call_deferred("queue_free")
