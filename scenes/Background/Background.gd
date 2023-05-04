extends Node2D

@export var background_speed: float = 200
@onready var pivot: Node2D = $Pivot
@onready var screen_size: Rect2 = get_viewport_rect()

func _process(delta: float) -> void:
	pivot.position.y += background_speed * delta
	
	if pivot.last_background.global_position.y > 0:
		pivot.queue_sprite()
