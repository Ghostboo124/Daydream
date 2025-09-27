extends Node2D

# Loads Config
var config = utils.config

# Defines Variables
var scroll_speed: float = config.get_value("background", "scroll_speed", 4.0)

@onready var bg: Sprite2D = $sprite
@onready var hitbox: StaticBody2D = $hitbox

var base_x: float
var current_x: float

var width: float

func _process(delta: float) -> void:
	current_x -= scroll_speed
	
	if current_x <= -width:
		current_x = width * delta
	
	bg.global_position.x = current_x
	hitbox.global_position.x = current_x 

func _ready() -> void:
	base_x = bg.global_position.x
	current_x = 0
	width = bg.texture.get_width()
