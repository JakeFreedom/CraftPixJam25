extends Node2D


var playerScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("/root/GlobalVars/Player/CharacterBody2D")
	player.global_position = GlobalVars.playerLoadPosition
	#var player = playerScene.instantiate()
	#add_child(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
