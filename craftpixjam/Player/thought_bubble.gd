extends Node2D

var thoughtText: String = ""
var beginFade: bool = false
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false;
	self.modulate.a = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if beginFade:
		self.modulate.a += delta
		pass
	
	
func SetBubbleText(text: String, textSize: int = 14) -> void:
	get_tree().create_timer(3.0, true, true, false).timeout.connect(HideThoughtBubble)
	beginFade = true
	visible = true
	label.text = text	
	label.label_settings.font_size = textSize

func HideThoughtBubble()-> void:
	beginFade = false
	visible = false
	modulate.a = 0
