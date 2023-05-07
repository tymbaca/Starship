extends Node2D
class_name Level

func _ready() -> void:
	Settings.world = self


func no_enemy_left() -> bool:
	# Not implemented
	return true
