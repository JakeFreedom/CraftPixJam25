extends Node2D

var boss3: PackedScene = load("res://boos_3.tscn")

#Spawn Timer
var spawnTimer: Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnTimer = Timer.new()
	spawnTimer.wait_time = 10
	spawnTimer.autostart = true
	spawnTimer.timeout.connect(SpawnBoss)
	pass # Replace with function body.


func SpawnBoss() -> void:
	pass
