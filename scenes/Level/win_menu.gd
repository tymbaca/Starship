extends Menu
class_name WinMenu

@onready var score := $Score
#@onready var 

var current_score_scroll: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	visibility_on()
	
#	var tween = create_tween()
#	tween.tween_property(self, "current_score_scroll", Settings.current_level.player.enemy_killed, 1)
#	tween.tween_property(score, "text", Settings.current_level.player.enemy_killed, 1)
	score.set_text(str(Settings.current_level.player.enemy_killed))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	score.set_text(str(current_score_scroll))
	
	pass
