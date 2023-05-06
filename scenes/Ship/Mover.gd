class_name Mover
extends Node2D

@export var default_speed: float = 10000
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
		speed = default_speed * dash_multiplier
		emit_dash_effect()

		var timer = get_tree().create_timer(dash_time)
		timer.timeout.connect(func(): 
			speed = default_speed
			dashing = false
			cooldown = true
			var cooldown_timer = get_tree().create_timer(cooldown_time)
			cooldown_timer.timeout.connect(func():
				cooldown = false
			)
		)


func emit_dash_effect():
	var effect = dash_effect_scene.instantiate()
	add_child(effect)
	effect.rotation = direction.angle() + PI/2
