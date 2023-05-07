extends Node2D
class_name Level

func _ready() -> void:
	Settings.current_level = self


func no_enemy_left() -> bool:
	# Not implemented
	return true


func retry():
	get_tree().change_scene_to_file("res://scenes/Level/Level.tscn")
