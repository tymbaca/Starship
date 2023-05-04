extends Node2D

var backgrounds: Array[Sprite2D] = []
@onready var parent: Node2D = get_parent()
@onready var last_background: Sprite2D = $Sprite2D

func _ready() -> void:
	for child in get_children():
		backgrounds.append(child)

func queue_sprite() -> void:
	var new_background: Sprite2D = last_background.duplicate()
	new_background.position = last_background.position + Vector2(0, -Settings.screen_size.y)
	add_background(new_background)
	if len(backgrounds) > 2:
		remove_old_background()
		pass

func add_background(new_background: Sprite2D) -> void:
	backgrounds.append(new_background)
	add_child(new_background)
	last_background = new_background

func remove_old_background() -> void:
	backgrounds[0].queue_free()
	backgrounds.remove_at(0)


