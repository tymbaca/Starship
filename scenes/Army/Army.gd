extends Path2D
class_name Army

var cell_height: int = 500
var path_height: int

@export var pivots: Array[ArmyPivot]

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is ArmyPivot:
			pivots.append(child)
			
	path_height = cell_height * len(pivots)
	curve.set_point_position(0, Vector2(0, -path_height))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
