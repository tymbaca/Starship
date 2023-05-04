extends Node2D

@export var speed = 50

var is_reached

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	is_reached = false
	$Mover.speed = speed
	pass # Replace with function body.


func _process(delta):
	if not is_reached:
		$Mover.move_up()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BulletDetector_body_entered(body):
	die()

func die():
	queue_free()


func _on_Timer_timeout():
	$BulletSpawner.fire()
	print("fireing")


func _on_BulletDetector_area_entered(area):
	if area.name == "EnemyMoveLimit":
		is_reached = true
	pass # Replace with function body.
