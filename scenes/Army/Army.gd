extends Node2D

enum Type {
	WAVE,
}

@export var type: Type
@export var offset: float = 0.1
@export var ratio_speed: float = 0.1
var pivots: Array[PathPivot] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Path2D:
			pivots.append(child.get_child(0))

	for index in pivots.size(): 
		if pivots[index].direction == PathPivot.Direction.RIGHT:
			pivots[index].progress_ratio += index * offset
		else:
			pivots[index].progress_ratio -= index * offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for pivot in pivots:
		if pivot.direction == pivot.Direction.RIGHT:
			pivot.progress_ratio += ratio_speed * delta
		else:
			pivot.progress_ratio -= ratio_speed * delta
