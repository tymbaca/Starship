extends Node2D
class_name Squad

signal defeated
signal started_moving

enum Type {
	WAVE,
}

enum States {
	STACKED,
	MOVING,
	MOVING_FIGHTING,
	FIGHTING
}

@export var type: Type
@export var front_squad: Squad = null
@export var vertical_speed: float = 10

@export var ratio_speed: float = 0.1
@export var offset: float = 0.1

@export var squad_area: SquadArea
@export var raycast: RayCast2D

var pivots: Array[SquadPivot]
var enemies: Array[Enemy]

var state: States = States.STACKED


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	find_pivots_and_enemies()
	set_pivots_offsets()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_pivots_movement(delta)
	clear_dead_enemies()
	if len(enemies) == 0:
		defeat()
	
	state = get_currect_state()
	
	match state:
		States.STACKED:
			set_enemies_visibility(false)
			set_enemies_state(Enemy.States.IDLE)
		
		States.MOVING:
			set_enemies_visibility(false)
			set_enemies_state(Enemy.States.IDLE)
			move_down(delta)
			

		States.MOVING_FIGHTING:
			set_enemies_visibility(true)
			set_enemies_state(Enemy.States.FIRING)
			move_down(delta)
			
		States.FIGHTING:
			set_enemies_visibility(true)
			set_enemies_state(Enemy.States.FIRING)

#====================================================

"Returning correct state based on RayCast collider"
func get_currect_state():
	return get_state_from_raycast()
#	return get_state_from_squad_area()


func get_state_from_raycast() -> States:
	var collider = raycast.get_collider()
	if collider:
		print(collider.name)
		if collider is SquadArea:
			return States.STACKED
		elif collider is CombatZone:
			return States.MOVING_FIGHTING
		elif collider is SafeZone:
			return States.FIGHTING
		else:
			# Ignore another colliders
			return state
	else:
		return States.MOVING

#func get_state_from_squad_area():
#	var colliders = squad_area.get_overlapping_areas()
#	if colliders:
#		if contains_instance(colliders, SquadArea):
#			return States.STACKED
#		elif contains_instance(colliders, CombatZone):
#			return States.MOVING_FIGHTING
#		elif contains_instance(colliders, SafeZone):
#			return States.FIGHTING
#		else:
#			return States.MOVING


func contains_instance(array: Array, cls):
	for item in array:
		if is_instance_of(item, cls):
			return true
	
	

func move_down(delta: float):
	position.y += vertical_speed * delta


func is_colliding_with_squad():
	var collider = raycast.get_collider()
	if collider and collider.get_parent() is Squad:
		return true
	else:
		return false


func find_pivots_and_enemies():
	for child in get_children():
		if child is SquadPath:
			pivots.append(child.pivot)
			enemies.append(child.pivot.enemy)


func set_pivots_offsets():
	for index in pivots.size(): 
		if pivots[index].direction == SquadPivot.Direction.RIGHT:
			pivots[index].progress_ratio += index * offset
		else:
			pivots[index].progress_ratio -= index * offset


func set_enemies_visibility(value: bool):
	for enemy in enemies:
		enemy.visible = value
		enemy.god_mode = not value

func set_enemies_state(value: Enemy.States):
	for enemy in enemies:
		enemy.state = value

	
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


func defeat():
	defeated.emit()
	queue_free()
