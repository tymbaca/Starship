extends CharacterBody2D

var Team = load("res://Team.gd")

@export var effect_scene: PackedScene

@export var speed = 100
@export var damage = 1
@onready var colision = $CollisionShape2D

@onready var world = get_parent().get_parent()

func _process(delta):
	

	var collision: KinematicCollision2D = move_and_collide(Vector2.UP.rotated(global_rotation) * speed * delta)
	if not collision == null:
		queue_free()
		emit_hit_effect(collision)
		var hitted_ship: CharacterBody2D = collision.collider
		hitted_ship.health -= damage
		
	
func emit_hit_effect(collision: KinematicCollision2D):
	var effect: Node2D = effect_scene.instantiate()
	var global_rotation_vector: Vector2 = Vector2.RIGHT.rotated(global_rotation)
	effect.global_position = global_position
	effect.global_rotation = get_reflect_vector(global_rotation_vector, collision.normal).angle() + PI/2
	world.add_child(effect)
	print(rad_to_deg(effect.global_rotation), " / ", effect.global_rotation_degrees, " / ", effect.global_rotation)

func get_reflect_vector(initial: Vector2, normal: Vector2):
	normal = normal.normalized()
	var dot_product = (initial.x * normal.x) + (initial.y * normal.y)
	var result = initial - 2 * dot_product * normal
	return result
