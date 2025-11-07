extends Node2D


var playerScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("/root/GlobalVars/Player/PlayerBody")
	player.global_position = Vector2(252,10)#GlobalVars.playerLoadPosition
	#var player = playerScene.instantiate()
	#add_child(player)
	pass # Replace with function body.
