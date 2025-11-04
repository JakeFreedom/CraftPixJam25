extends Control
@onready var btn_yes: Button = $PanelContainer/HBoxContainer/VBoxContainer/btnYes
@onready var btn_no: Button = $PanelContainer/HBoxContainer/VBoxContainer/btnNo
@onready var dialogMessageBox: RichTextLabel = $PanelContainer/HBoxContainer/VBoxContainer/RichTextLabel


#Pre load the scene
var insideHouseScene = preload("res://House/MainHouse.tscn")

@export var dialogMessage: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index = 3
	var p = get_tree().get_first_node_in_group("Player") as Player
	self.global_position = p.global_position
	self.global_position.y -= 50
	self.global_position.x -= 25
	get_tree().paused = true
	btn_yes.pressed.connect(btnYes_onPressed)
	btn_no.pressed.connect(btnNo_onPressed)
	
	dialogMessageBox.text = dialogMessage
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func btnYes_onPressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_packed(insideHouseScene)
	call_deferred("queue_free")
func btnNo_onPressed() -> void:
	call_deferred("queue_free")
	get_tree().paused = false
