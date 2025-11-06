extends Control
@onready var dialog_text_npc: Label = $DialogTextNPC
@onready var dialog_text_player: Label = $DialogTextPlayer



var dialogText: String = ""
var dialogJsonFile: String = ""
var npcID: int = 2
var responses: Array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_text_npc.text = dialogText
	LoadJsonFile()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = false
		call_deferred("queue_free")
		pass
		
	for r in responses:
		if Input.is_key_pressed(r):
			print("yes")
		
		
func LoadJsonFile() -> void:
	dialog_text_player.text = ""
	#Get the json file contents based on the NPC ID -- If this will work, otherwise we will just have individual json files
	var file = FileAccess.open("res://NPCs/JSON Files/mira.json", FileAccess.READ)
	var json_string = file.get_as_text()
	print(json_string)
	file.close()
	var parsed_data: Dictionary = JSON.parse_string(json_string)
	print(parsed_data.size())
	
	for i in parsed_data["NPC"]:
		if i["NPCID"] == str(npcID):
			#Get initial speach
			LoadInitialSpeach(i["InitialSpeach"])
			for x in i["Questions"]:
				responses.append(int(x["KEY_ID"]))
				dialog_text_player.text += x["QUESTIONID"] +") " + x["QUESTION"] + "\n"
	pass
	
func LoadInitialSpeach(intialSpeach: String) -> void:
	dialog_text_npc.text = intialSpeach
	pass
