extends Node2D
class_name Level

@export var combat_zone: Area2D
@export var safe_zone: Area2D


func retry():
	get_tree().change_scene_to_file("res://scenes/Level/LevelFather.tscn")


	

