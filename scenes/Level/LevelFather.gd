extends Node2D
class_name LevelFather

@export var win_menu_scene: PackedScene
@onready var level: Level = %Level

func _ready() -> void:
	level.no_squads_left.connect(load_win_menu)
	pass


func no_enemy_left() -> bool:
	# Not implemented
	return true


func load_win_menu():
	var score: int = level.player.enemy_killed
	var win_menu := win_menu_scene.instantiate()
	add_child(win_menu)
	win_menu.visibility_on()
	
