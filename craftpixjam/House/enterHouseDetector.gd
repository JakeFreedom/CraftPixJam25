extends Area2D

@export var EnterBuildingDialog: PackedScene
#Pre load the scene
var insideHouseScene = preload("res://House/MainHouse.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(EnterHouse)
	pass # Replace with function body.


func EnterHouse(otherBody: Node2D) -> void:
	#Need to do a neat shader to transition. Like an old school screne/checker board disolve
	#GlobalVars.SetPlayer(otherBody)
	var dialog = EnterBuildingDialog.instantiate()
	dialog.dialogMessage = "Would you like to enter the house?"
	add_child(dialog)
	
	#GlobalVars.playerLoadPosition = Vector2(251, 0)
	#call_deferred("ChangeToInsideHouseScene")
	
func ChangeToInsideHouseScene() -> void:
	#get_tree().change_scene_to_packed(insideHouseScene)
	pass
	
