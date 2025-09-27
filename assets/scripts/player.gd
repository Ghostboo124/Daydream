extends Area2D

@export var strength: int = 1
@export var speed: int = 1
@export var regen: int = 1
@export var health: int = 10
@export var chaos: int = 4
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
