extends CharacterBody2D

@export var strength: int = 1
@export var speed: int = 500
@export var regen: int = 1
@export var health: int = 10
@export var chaos: int = 4
var screen_size

func _physics_process(delta: float) -> void:
	screen_size = get_viewport_rect().size
	velocity = Vector2.ZERO
	
	var input_vector: Vector2 = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)
	velocity = input_vector * speed
	move_and_slide()
