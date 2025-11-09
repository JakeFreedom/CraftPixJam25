extends Area2D

var innInsideScene = preload("res://Inn/inn_inside_view.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(EnterInn)
	pass # Replace with function body.


	
func EnterInn(otherBody: Node2D) -> void:
	#Need to set here where the player will be place in the inn
	GlobalVars.playerLoadPosition = Vector2(26.25, 86.25)#<--This is where player will be placed in the inn
	get_tree().call_deferred("change_scene_to_packed",innInsideScene)
	call_deferred("queue_free")
