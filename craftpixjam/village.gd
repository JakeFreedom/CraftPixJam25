extends Node2D

var dialogScene = preload("res://dialog.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_tree().get_first_node_in_group("Player") as Player
	if GlobalVars.playerLoadPosition != Vector2.ZERO:
		player.global_position = GlobalVars.playerLoadPosition



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var dialog = dialogScene.instantiate()
		dialog.dialogText = "Welcome, world!"
		dialog.z_index = 10
		get_tree().get_first_node_in_group("Player").get_node("DialogControl").add_child(dialog)
		get_tree().paused = true
		
