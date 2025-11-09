extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(OnHurtBox_Entered)
	pass # Replace with function body.


func OnHurtBox_Entered(otherBody)-> void:
	print(otherBody.name + "Boss")
