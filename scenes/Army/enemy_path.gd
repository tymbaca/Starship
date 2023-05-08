@tool
extends Path2D
class_name SquadPath

@onready var pivot = $Pivot

@export_range(0, 1) var pivot_progress_ratio: float = 0

@export var direction: SquadPivot.Direction = SquadPivot.Direction.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot.direction = direction
	pivot.progress_ratio = pivot_progress_ratio
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		pivot.direction = direction
		pivot.progress_ratio = pivot_progress_ratio
	pass
