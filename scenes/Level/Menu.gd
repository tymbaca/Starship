extends Control
class_name DeathMenu

@export var player: Player
@onready var background := $Background
@onready var retry_button := $Button
@onready var level: Level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_dead.connect(visibility_on)
	modulate.a = 0
	level = $"../Level"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null and Input.is_action_just_released("pause"):
		if visible == false:
			pause()
		else:
			unpause()
	pass
	
func visibility_on():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 1) 
	visible = true

func visibility_off():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 1) 
	visible = false

func pause():
	level.process_mode = Node.PROCESS_MODE_DISABLED
	visibility_on()
	
func unpause():
	level.process_mode = Node.PROCESS_MODE_INHERIT
	visibility_off()
	
