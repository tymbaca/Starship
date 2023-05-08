@icon("res://scenes/Ship/class_icon.svg")
extends CharacterBody2D
class_name Ship


@export var max_health: int = 3
@export var destroy_effect_scene: PackedScene
@export var god_mode: bool = false

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

func take_damage(damage: int):
	if not god_mode:
			health -= damage

func die():
	queue_free()
	emit_destroy_effect()

func emit_destroy_effect():
	var effect: Node2D = destroy_effect_scene.instantiate()
	effect.global_position = global_position
	Settings.current_level.add_child(effect)
	
	
