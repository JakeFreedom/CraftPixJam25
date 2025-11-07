extends Area2D

var marketInsideScene = load("res://Market/market_inside_view.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(EnterMarket)



func EnterMarket(otherBody: Node2D) -> void:
	GlobalVars.playerLoadPosition=Vector2(4,107)
	get_tree().call_deferred("change_scene_to_packed",marketInsideScene)
	call_deferred("queue_free")
