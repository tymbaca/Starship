extends Node2D
class_name LevelFather

@onready var level: Level = $Level

func _ready() -> void:
	Settings.current_level = level


func no_enemy_left() -> bool:
	# Not implemented
	return true
