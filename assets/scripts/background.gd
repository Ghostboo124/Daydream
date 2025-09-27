extends Node2D

# Loads Config
var config := utils._load_config()

# Scroll Speed
var scroll_speed: float = config.get_value("background", "scroll_speed", 0)

# Loads Background
@onready var bg: Sprite2D = $sprite
@onready var hitbox: StaticBody2D = $hitbox

# Gets Width & Height
var base_x: float = bg.global_position.x

var width: float = bg.texture.get_width()
var height: float = bg.texture.get_height()

# Update Func
func _process(delta: float) -> void:
	bg.global_position.x -= scroll_speed
	
	if bg.global_position.x <= -width:
		bg.global_position.x = width
	
	hitbox.global_position.x = bg.global_position.x
