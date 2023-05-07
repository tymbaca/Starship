extends Node2D

@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var world: Level

func _ready() -> void:
	OS.set_low_processor_usage_mode(true)
