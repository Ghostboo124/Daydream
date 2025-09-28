extends Node2D

var enemy_scenes = [
	preload("res://sprites/orc.tscn"),
	preload("res://sprites/dino.tscn")
]

@onready var player = $"../Player"
var current_enemy: Area2D = null

func _ready():
	print("Spawner ready, attempting to spawn enemy")
	spawn_enemy()

func spawn_enemy():
	if player.is_dead or current_enemy:
		return
	var scene = enemy_scenes[randi() % enemy_scenes.size()]
	var enemy = scene.instantiate()
	# Spawn near the player's position
	enemy.position = player.position + Vector2(randf_range(-100, 100), randf_range(-100, 100))
	get_parent().add_child(enemy)
	current_enemy = enemy
	enemy.connect("died", Callable(self, "_on_enemy_died"))
	print("Spawning enemy at:", enemy.position, "Player at:", player.position)
