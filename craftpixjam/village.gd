extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_tree().get_first_node_in_group("Player") as Player
	if GlobalVars.playerLoadPosition != Vector2.ZERO:
		player.global_position = GlobalVars.playerLoadPosition
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
