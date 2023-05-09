extends Menu
class_name DeathMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	player.player_dead.connect(visibility_on)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
