@tool
extends PathFollow2D
class_name SquadPivot

enum Direction {
	RIGHT,
	LEFT
}

#@export var number: int
@onready var enemy := $Enemy
var direction: Direction



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if direction == Direction.RIGHT:
		if progress_ratio > 0.95:
			direction = Direction.LEFT

	elif direction == Direction.LEFT:
		if progress_ratio < 0.05:
			direction = Direction.RIGHT

