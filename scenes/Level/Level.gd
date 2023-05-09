extends Node2D
class_name Level

signal level_loaded
signal no_squads_left

@export var combat_zone: Area2D
@export var safe_zone: Area2D
@export var player: Player

@onready var squads: Array
@onready var enemies: Array


func _ready():
	Settings.current_level = self
	
	squads = get_tree().get_nodes_in_group("squad")
	for squad in squads:
		squad.defeated.connect(func(squad): squads.erase(squad))
	
	enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		enemy.dead.connect(func(enemy): enemies.erase(enemy))
	level_loaded.emit()
	

func _process(delta):
	if len(squads) == 0:
		no_squads_left.emit()


func retry():
	get_tree().change_scene_to_file("res://scenes/Level/LevelFather.tscn")

#func sync(entities: Array, signal_name: StringName):
#	for entity in entities:
#		entity.signal_name.connect()
