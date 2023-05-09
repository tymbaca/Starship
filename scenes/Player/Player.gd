class_name Player
extends Ship

signal player_dead  # Arguments maybe?
signal total_enemy_killed(count)

@export var health_bar: TextureProgressBar
@export var enemy_killed: int = 0

@onready var level: Level = %Level

func _ready() -> void:
	super._ready()
	health_bar.max_value = max_health
	
	await level.level_loaded
	for enemy in level.enemies:
		enemy.dead.connect(func(ship):
			enemy_killed += 1
			print("enemy killed")
			)
	
	level.no_squads_left.connect(func():
		total_enemy_killed.emit(enemy_killed))

func _process(delta: float) -> void:
	health_bar.value = health
	super._process(delta)

func die():
	super.die()
	player_dead.emit()

#======================================================

func connect_to_all_enemies_death(callable: Callable):
	for enemy in level.enemies:
		enemy.dead.connect(callable)
	
