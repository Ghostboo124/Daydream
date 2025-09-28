extends CharacterBody2D

@export var strength: int = 1
@export var speed: int = 1
@export var regen: int = 1
@export var health: int = 10
@export var chaos: int = 4
var screen_size

#func _ready() -> void:
	#screen_size = get_viewport_rect().size
	#var velocity: Vector2 = Vector2.ZERO # The players movement vector
	#if Input.is_action_pressed("right"):
		#velocity.x += 1
	#if Input.is_action_pressed("left"):
		#velocity.x -= 1
	#if Input.is_action_pressed("up"):
		#velocity.y += 1
	#if Input.is_action_pressed("down"):
		#velocity.y -= 1
	#
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		#$AnimatedSprite

func _physics_process(delta: float) -> void:
	var velocity: Vector2 = Vector2.RIGHT.normalized() * speed
	move_and_slide()
