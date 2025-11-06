extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(CheckHit)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func CheckHit(otherBody: Node2D) -> void:
	if otherBody is Player:
		#print("The player touched me")
		var parentScript = get_parent()
		otherBody.TriggerDialog(parentScript.dialogFile, parentScript.NPCID)
		#Here we will pop up the dialog where she tells us about Mira
