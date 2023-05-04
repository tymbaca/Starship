extends Effect

@onready var sparks = $Sparks
@onready var smoke = $Smoke

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._enter_tree()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func emit():
	sparks.emitting = true
	smoke.emitting = true
