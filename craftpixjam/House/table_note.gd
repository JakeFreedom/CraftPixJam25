extends Area2D

var parentNoteScene: PackedScene = load("res://parent_note.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(onTableTouch)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func onTableTouch(otherBody: Node2D)-> void:
	if not GlobalVars.HAD_READ_PARENT_NOTE:
		var note = parentNoteScene.instantiate()
		get_tree().get_first_node_in_group("Player").add_child(note)
		GlobalVars.HAD_READ_PARENT_NOTE = true
