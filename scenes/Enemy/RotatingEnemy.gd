extends Enemy

func _process(delta: float) -> void:
	super._process(delta)
	$Mover.turn_left()
