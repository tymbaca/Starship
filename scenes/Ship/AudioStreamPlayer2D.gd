extends AudioStreamPlayer2D
class_name RandomAudioStreamPlayer2D

@export var streams: Array[AudioStreamWAV]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _play(from_position: float = 0.0):
	randomize()
	var shoot_sound = streams[randi() % streams.size()]
	stream = shoot_sound
	super.play()
