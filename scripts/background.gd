extends Node2D

# Defines Sprite & Hitbox
@onready var sprite: Sprite2D = $sprite
@onready var hitbox: StaticBody2D = $hitbox

# Defines Scroll Speed
@export var scroll_speed: float = 4.0

# Define Width & Height
@export var width: float = 1728
@export var height: float = 540



# Defines Update
func _process(delta: float) -> void:
	# Scrolls Background
	sprite.global_position.x -= scroll_speed
	hitbox.global_position.x -= scroll_speed
	
	
	# Checks if Background is out of map
	if sprite.global_position.x <= -width:
		sprite.global_position.x = width
	
	hitbox.global_position.x = sprite.global_position.x
