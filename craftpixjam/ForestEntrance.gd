extends Area2D


var forestScene = load("res://forest.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(EnterForest)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func EnterForest(otherBody: Node2D) -> void:
	if otherBody is Player:
		if GlobalVars.HAVE_SWORD:
			GlobalVars.playerLoadPosition = Vector2(12,188)
			get_tree().call_deferred("change_scene_to_packed", forestScene)
			call_deferred("queue_free")
		else:
			var p = get_tree().get_first_node_in_group("Player")
			p.get_node("ThoughtBubble").SetBubbleText("Maybe a sword would be a good idea.", 10)
