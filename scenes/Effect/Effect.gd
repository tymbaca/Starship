class_name Effect
extends Node2D

@export var emitting: bool = true

@export var effects: Array[GPUParticles2D]


func _ready() -> void:
	set_as_top_level(true)
	emit()

func _process(delta: float) -> void:
	emitting = false
	for effect in effects:
		emitting = emitting or effect.emitting

func emit():
	for effect in effects:
		effect.emitting = true 
