@icon("res://scenes/Ship/class_icon.svg")
extends CharacterBody2D
class_name Ship

signal dead(ship: Ship)

@export var max_health: int = 3
@export var destroy_effect_scene: PackedScene
@export var god_mode: bool = false

@export var hit_audio_player: RandomAudioStreamPlayer2D
@export var destroy_audio_player: RandomAudioStreamPlayer2D

var health: int
var alive: bool = true
# @onready var weapon = $BulletSpawner

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	pass # Replace with function body.

func _process(delta):
	if health <= 0 and alive:
		die()
	pass

func take_damage(damage: int):
	hit_audio_player._play()
	if not god_mode:
		health -= damage

func die():
	alive = false
	visible = false
	emit_destroy_effect()
	
	destroy_audio_player._play()
	await destroy_audio_player.finished
	
	queue_free()
	dead.emit(self)

func emit_destroy_effect():
	var effect: Node2D = destroy_effect_scene.instantiate()
	effect.global_position = global_position
	Settings.current_level.add_child(effect)
	
	
