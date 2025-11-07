extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(ExamineTable)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func ExamineTable(otherBody: Node2D) -> void:
	if otherBody is Player:
		print("Check if we have seen Breahley")
