extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hurtbox: Area2D = $Hurtbox
@onready var hitbox: Area2D = $Hitbox
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var strength: int = 1
@export var speed: int = 500
@export var regen: int = 1
@export var health: int = 10
@export var chaos: int = 4
var is_dead: bool = false
var input_vector: Vector2 = Vector2.ZERO
var screen_size
var frame_counter: int = 0

func _on_hurtbox_area_entered(area: Area2D) -> void:
	health -= 1
	animation_tree.set("parameters/StateMachine/MoveState/State/blend_position", 0)
	if health == 0:
		animation_tree.set("parameters/StateMachine/MoveState/State/2/blend_position", 1)
		is_dead = true
		return
	
	animation_tree.set("parameters/StateMachine/MoveState/State/2/blend_position", -1)

func _physics_process(delta: float) -> void:
	frame_counter += 1
	if is_dead:
		return
	animation_tree.set("parameters/StateMachine/MoveState/State/2/blend_position", 0)
	animation_tree.set("parameters/StateMachine/MoveState/State/blend_position", 0)

	screen_size = get_viewport_rect().size
	velocity = Vector2.ZERO
	input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	
	animation_tree.set("parameters/StateMachine/MoveState/State/blend_position", input_vector.x)

	velocity = input_vector * speed
	move_and_slide()
