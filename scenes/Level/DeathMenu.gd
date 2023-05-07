extends Control
class_name DeathMenu

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_dead.connect(visibility_on)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func visibility_on():
	visible = true
