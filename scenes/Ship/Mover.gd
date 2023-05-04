extends Node2D

@export var speed = 5000
@export var turn_speed = 2

var ship: CharacterBody2D 
var direction: Vector2 = Vector2.ZERO
var turn_direction: float = 0



func _ready():
	ship= get_parent()

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

