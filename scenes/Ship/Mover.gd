class_name Mover
extends Node2D

@export var default_speed: float = 15000
@export var dash_multiplier: float = 2
@export var turn_speed = 2
@export var dash_time: float = 1
@export var cooldown_time: float = 1
@export var dash_effect_scene: PackedScene

var ship: CharacterBody2D 
var speed: float
var direction: Vector2 = Vector2.ZERO
var turn_direction: float = 0
var dashing: bool = false
var cooldown: bool = false



func _ready():
	ship = get_parent()
	speed = default_speed

func _process(delta):
	# Move
	handle_movement(delta)
	# Turn
	handle_turn(delta)
	# var direction = get_global_mouse_position() - position
	# ship.look_at(get_global_mouse_position())

func handle_movement(delta):
	direction = direction.normalized().rotated(global_rotation)
	ship.set_velocity(direction.rotated(-global_rotation) * speed * delta)
	ship.move_and_slide()
	direction = Vector2.ZERO

func handle_turn(delta):
	ship.rotation += turn_direction * turn_speed * delta
	turn_direction = 0

func move_left() -> void:
	direction.x -= 1

func move_right() -> void:
	direction.x += 1

func move_up() -> void:
	direction.y -= 1

func move_down() -> void:
	direction.y += 1

func turn_left() -> void:
	turn_direction -= 1

func turn_right() -> void:
	turn_direction += 1

func dash_left() -> void:
	dash()

func dash_right() -> void:
	dash()

func dash() -> void:
	if not cooldown and ship.velocity != Vector2.ZERO:
		dashing = true
		cooldown = true
		emit_dash_effect()
		var tween := create_tween()
		
		tween.tween_property(self, "speed", default_speed * dash_multiplier, dash_time/4).set_trans(Tween.TRANS_BACK)
		tween.tween_interval(dash_time/2)
		tween.tween_property(self, "speed", default_speed, dash_time/4)
		await tween.finished

		var cooldown_timer := get_tree().create_timer(cooldown_time)
		await cooldown_timer.timeout
		cooldown = false


func emit_dash_effect():
	var effect = dash_effect_scene.instantiate()
	add_child(effect)
	effect.global_position = global_position
	effect.rotation = direction.angle() + PI/2
