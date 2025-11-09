extends Node2D

var goblinScene: PackedScene = load("res://goblin_npc.tscn")
var spawnTimer: Timer
var instanceMaxIndex: int = 15
var instanceIndex: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnTimer = Timer.new()
	spawnTimer.wait_time = 15
	spawnTimer.timeout.connect(SpawnGoblin)
	spawnTimer.start()
	spawnTimer.autostart = true
	add_child(spawnTimer)
	pass # Replace with function body.


func SpawnGoblin() -> void:
	print("Spawn")
	var goblin = goblinScene.instantiate()
	var direction = randi_range(-1, 1)
	goblin.StartDirection = Vector2(-1,0) if direction < 1 else Vector2(1,0)
	add_child(goblin)
	if instanceIndex < instanceMaxIndex:
		instanceMaxIndex+= 1
		spawnTimer.start()
