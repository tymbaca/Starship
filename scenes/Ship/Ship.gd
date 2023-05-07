class_name Ship
extends CharacterBody2D


@export var max_health: int = 3
@export var destroy_effect_scene: PackedScene

var health: int
# @onready var weapon = $BulletSpawner

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	pass # Replace with function body.

func _process(delta):
	if health <= 0:
		die()
	pass

func die():
	queue_free()
	emit_destroy_effect()

func emit_destroy_effect():
	var effect: Node2D = destroy_effect_scene.instantiate()
	effect.global_position = global_position
	Settings.world.add_child(effect)
	
	
