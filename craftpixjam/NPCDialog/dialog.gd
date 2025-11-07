extends Control
@onready var dialog_text_npc: Label = $DialogTextNPC
@onready var dialog_text_player: Label = $DialogTextPlayer
@onready var npcSprite: Sprite2D = $NPC
@onready var npc_name: Label = $NPCName


#We need to hand this script
#1) The NPCs JSON File
#2) The Sprite so we can display that


var dialogText: String = ""
var dialogJsonFile: String = ""
var npcID: int = -1
var npcName: String = ""
var responses: Dictionary
var parsed_data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#dialog_text_npc.text = dialogText
	LoadJsonFile()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = false
		call_deferred("queue_free")
		
	for r in responses:
		#print(responses[r])
		if Input.is_key_pressed(r):
			#Print NPC text
			dialog_text_npc.text = ""
			dialog_text_npc.text = responses[r] 
	
		
		
func LoadJsonFile() -> void:
	dialog_text_player.text = ""
	#Get the json file contents based on the NPC ID -- If this will work, otherwise we will just have individual json files
	var file = FileAccess.open(dialogJsonFile, FileAccess.READ)
	var json_string = file.get_as_text()
	#print(json_string)
	file.close()
	parsed_data = JSON.parse_string(json_string)
	#print(parsed_data.size())
	
	for i in parsed_data["NPC"]:
		if i["NPCID"] == str(npcID):
			#Get initial speach
			LoadInitialSpeach(i["InitialSpeach"])
			npcSprite.texture = load(i["SPRITE"])
			npc_name.text = i["NAME"]
			for x in i["Questions"]:
				responses[(int(x["KEY_ID"]))] = x["RESPONSE"]
				dialog_text_player.text += x["QUESTIONID"] +") " + x["QUESTION"] + "\n"
				#print(responses)
	dialog_text_player.text += "ESC) Goodbye!"

func LoadInitialSpeach(intialSpeach: String) -> void:
	dialog_text_npc.text = intialSpeach
