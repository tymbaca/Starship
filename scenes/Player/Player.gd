class_name Player
extends Ship

signal player_dead

@export var health_bar: TextureProgressBar

func _ready() -> void:
	super._ready()
	health_bar.max_value = max_health

func _process(delta: float) -> void:
	health_bar.value = health
	super._process(delta)
	
func die():
	super.die()
	player_dead.emit()
	
