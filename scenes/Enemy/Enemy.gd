class_name Enemy
extends Ship


enum States {
	IDLE,
	FIRING
}

@onready var weapon: Weapon = $Weapon
var state := States.IDLE

func _process(delta: float) -> void:
	super._process(delta)
	
	match state:
		States.IDLE:
			pass
		States.FIRING:
			weapon.fire()
