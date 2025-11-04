extends Node2D

var playerState: Player
var playerScene = preload("res://Player/player.tscn")
# Called when the node enters the scene tree for the first time.


var playerLoadPosition: Vector2 = Vector2.ZERO
var playerFacingDirection: int = 1

func _ready() -> void:
	var player = playerScene.instantiate()
	add_child(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func SetPlayer(player: Player) -> void:
	playerState = player
func GetPlayer() -> Player:
	return playerState
