extends Control
class_name DeathMenu

@export var player: Player
@onready var background := $Background
@onready var retry_button := $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_dead.connect(visibility_on)
	modulate.a = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func visibility_on():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 1) 
	visible = true
