extends VisibleOnScreenEnabler2D

func _ready() -> void:
	rect = get_viewport_rect()
	print(rect)
