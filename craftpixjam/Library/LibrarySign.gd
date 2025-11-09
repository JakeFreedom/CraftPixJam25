extends StaticBody2D

@export var SignText: String = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_event.connect(_on_StaticBody2D_input_event) #make sure you have pickable enabled if you want to use this signal
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_StaticBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#Show speach bubble on Sparrow
			var p = get_tree().get_first_node_in_group("Player")
			p.get_node("ThoughtBubble").SetBubbleText(SignText)
