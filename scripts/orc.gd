extends Area2D

signal died

@onready var hitbox: Area2D = $Hitbox
@onready var player: CharacterBody2D = $"../Player"

@export var health: int = 10
@export var speed: int = 500

func die():
	emit_signal("died")
	queue_free()

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area == hitbox:
		return
	health -= 1
	if health <= 0:
		die()

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.y += gravity * (speed / 25) * delta
	position += velocity
	
	if player and not player.is_dead:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta
