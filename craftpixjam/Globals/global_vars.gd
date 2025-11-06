extends Node2D

var playerState: Player
var playerScene = preload("res://Player/player.tscn")
# Called when the node enters the scene tree for the first time.
var villageScene = load("res://Village.tscn")

var playerLoadPosition: Vector2 = Vector2.ZERO
var playerFacingDirection: int = 1


#Dialog Globals
var SEEN_IN_KEEPER: bool = false #DiaJornin Inn Keeper(obviously)
var SEEN_MIRA: bool = false #NPC on the pathway
var SEEN_BREAHLEY: bool = false #Market NPC
var HAVE_SWORD: bool = false
var BEEN_TO_BARCLAY: bool = false
var BEEN_TO_FOREST: bool = false


func _ready() -> void:
	var player = playerScene.instantiate()
	add_child(player)
	pass # Replace with function body.

	
func SetPlayer(player: Player) -> void:
	playerState = player
func GetPlayer() -> Player:
	return playerState
	
func LoadVillageScene()-> void:
	get_tree().change_scene_to_packed(villageScene)
