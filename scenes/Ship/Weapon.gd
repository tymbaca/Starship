class_name Weapon
extends Node2D

@export var bullet_scene: PackedScene
@export var bullet_speed: int = 5000
@export var reloading_speed: float = 1  # In seconds
@export var bullet_damage: int = 1

@export var audio_player: RandomAudioStreamPlayer2D

var current_reloading_progress: float = reloading_speed
var is_ready: bool = true
var is_firing

var world

func _ready():
	world = get_parent().get_parent()

func _process(delta):
	if is_ready and is_firing:
		var bullet = bullet_scene.instantiate()
		var bullet_direction_vector = Vector2.UP.rotated(global_rotation)
		world.add_child(bullet)
		bullet.global_rotation = global_rotation
		bullet.global_position = global_position
		bullet.damage = bullet_damage
		
		audio_player._play()

		is_ready = false
		current_reloading_progress = 0
	
	if not is_ready:
		current_reloading_progress += delta
		if current_reloading_progress >= reloading_speed:
			is_ready = true
	
	is_firing = false

func fire():
	is_firing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
