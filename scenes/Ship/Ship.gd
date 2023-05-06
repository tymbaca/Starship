class_name Ship
extends CharacterBody2D


@export var health: int = 3
@export var destroy_effect_scene: PackedScene

@onready var world = Level.node
# @onready var weapon = $BulletSpawner

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if health <= 0:
		queue_free()
		emit_destroy_effect()
	pass

func emit_destroy_effect():
	var effect: Node2D = destroy_effect_scene.instantiate()
	effect.global_position = global_position
	world.add_child(effect)
	
	
