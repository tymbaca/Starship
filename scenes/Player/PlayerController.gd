extends Node2D

# export var speed: int = 100
# export var turn_speed: int = 2
# export var bullet_speed: int = 200
# export var reloading_speed: float = 1

# export var is_vertival_movable: bool = false
@export var is_verbose: bool = false

var screen_size = Vector2.ZERO
@onready var mover: Node2D = $"../Mover"
@onready var bullet_spawner: Node2D = $"../BulletSpawner"
@onready var parent: CharacterBody2D = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

	# Configuring childs
	# $Mover.turn_speed = turn_speed
	# $BulletSpawner.bullet_speed = bullet_speed
	# $BulletSpawner.reloading_speed = reloading_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		mover.move_left()
	if Input.is_action_pressed("move_right"):
		mover.move_right()
		
	
	if Input.is_action_pressed("fire"):
		bullet_spawner.fire()

#	if Input.is_action_pressed("move_up"):
#		mover.move_up()
#	if Input.is_action_pressed("move_down"):
#		mover.move_down()
#
#	if Input.is_action_pressed("turn_left"):
#		mover.turn_left()
#	if Input.is_action_pressed("turn_right"):
#		mover.turn_right()
#
#	parent.look_at(get_global_mouse_position())

	if is_verbose:
		print(screen_size)
		print(position)
	
