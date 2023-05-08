extends Node2D

@onready var screen_size: Vector2 = get_viewport_rect().size
var current_level: Level

func _ready() -> void:
	OS.set_low_processor_usage_mode(true)
