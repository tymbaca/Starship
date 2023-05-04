extends Node2D

var backgrounds: Array[Sprite2D] = []

func _ready() -> void:
	add_backgrounds()

func add_backgrounds() -> void:
	for child in get_children():
		if child is Sprite2D:
			backgrounds.append(child)


