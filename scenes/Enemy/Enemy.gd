class_name Enemy
extends Ship

@onready var weapon: Weapon = $Weapon

func _process(delta: float) -> void:
	super._process(delta)
	weapon.fire()
