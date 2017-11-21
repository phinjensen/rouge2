extends "entity.gd"

const scale = Vector2(32, 32)

func _init():
	health = 20
	position = Vector2(6, 9)

func _ready():
	set_pos(position * scale)

