extends Node2D
class_name Squad

signal end
signal started_moving

enum Type {
	WAVE,
}

@export var type: Type
@export var offset: float = 0.1
@export var ratio_speed: float = 0.1
@export var front_squad: Squad = null
@export var vertical_speed: float = 10

var pivots: Array[SquadPivot] = []
@onready var enemies: Array[Enemy]
@onready var moving_area := $MovingArea 

var moving: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moving = true
	moving_area.area_entered.connect(moving_area_entered)
	
	if front_squad != null:
		process_mode = Node.PROCESS_MODE_DISABLED
		front_squad.end.connect(func():
			process_mode = Node.PROCESS_MODE_INHERIT
			started_moving.emit()
			moving = true
			)
	# Logic for cells. Maybe use front squad collider?
	
	for child in get_children():
		if child is SquadPath:
			pivots.append(child.pivot)
			enemies.append(child.pivot.enemy)

	for index in pivots.size(): 
		if pivots[index].direction == SquadPivot.Direction.RIGHT:
			pivots[index].progress_ratio += index * offset
		else:
			pivots[index].progress_ratio -= index * offset


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if moving:
		position.y += vertical_speed * delta
	
	handle_pivots_movement(delta)
	clear_dead_enemies()
	if len(enemies) == 0:
		end.emit()
		queue_free()
		
		
func moving_area_entered(area):
	print("entered", area)
	if area == Settings.current_level.safe_zone:
		moving = false
	elif front_squad != null:
		if area == front_squad.moving_area:
			moving = false
	
func handle_pivots_movement(delta: float):
	for pivot in pivots:
		if pivot.direction == pivot.Direction.RIGHT:
			pivot.progress_ratio += ratio_speed * delta
		else:
			pivot.progress_ratio -= ratio_speed * delta

func clear_dead_enemies():
	var new_enemies_array: Array[Enemy]
	for enemy in enemies:
		if enemy != null:
			new_enemies_array.append(enemy)
	enemies = new_enemies_array
