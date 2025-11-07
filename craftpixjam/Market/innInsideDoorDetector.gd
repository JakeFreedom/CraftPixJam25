extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(ExitMarket)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func ExitMarket(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition = Vector2(361,312)
	GlobalVars.call_deferred("LoadVillageScene")
	call_deferred("queue_free")
