extends CharacterBody2D


const SPEED = 50.0

var direction: Vector2 = Vector2.LEFT

var dialogFile = "res://NPCs/JSON Files/Breahley.json"
var NPCID: int = 3


func _physics_process(delta: float) -> void:


	move_and_slide()
