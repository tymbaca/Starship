class_name Effect
extends Node2D

@export var emitting: bool = true
@export var _top_level: bool = true

@onready var effects: Array = get_children()


func _ready() -> void:
	if _top_level:
		set_as_top_level(true)
	emit()

func _process(delta: float) -> void:
	if is_finished():
		queue_free()


func emit():
	for effect in effects:
		effect.emitting = true 

func is_finished():
	var is_emitting = false
	for effect in effects:
		is_emitting = is_emitting or effect.emitting
	return not is_emitting
	
