extends CharacterBody2D

var Team = load("res://Team.gd")

@export var hit_effect_scene: PackedScene

@export var speed = 400
@export var damage = 1
@export var lifetime: float = 5

@onready var timer = get_tree().create_timer(lifetime)
 
func _ready():
	timer.connect("timeout", queue_free)
	set_as_top_level(true)

func _process(delta):
	var collision: KinematicCollision2D = move_and_collide(Vector2.UP.rotated(global_rotation) * speed * delta)
	if not collision == null:
		hit(collision)
		queue_free()
		
func hit(collision: KinematicCollision2D) -> void:
	emit_hit_effect(collision)
	do_damage(collision.get_collider())
	
func emit_hit_effect(collision: KinematicCollision2D):
	var effect: Node2D = hit_effect_scene.instantiate()
	var global_rotation_vector: Vector2 = Vector2.RIGHT.rotated(global_rotation)
	effect.global_position = global_position
	effect.global_rotation = get_reflect_vector(global_rotation_vector, collision.get_normal()).angle() + PI/2
	Level.node.add_child(effect)
#	print(rad_to_deg(effect.global_rotation), " / ", effect.global_rotation_degrees, " / ", effect.global_rotation)

func get_reflect_vector(initial: Vector2, normal: Vector2):
	normal = normal.normalized()
	var dot_product = (initial.x * normal.x) + (initial.y * normal.y)
	var result = initial - 2 * dot_product * normal
	return result
	
func do_damage(collider: Object):
	if collider is Ship:
		collider.health -= damage
