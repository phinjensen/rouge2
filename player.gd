extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var position = Vector2(1, 1)
onready var map = get_node("../TileMap")
const scale = Vector2(32, 32)

func _ready():
	set_pos(position * scale)
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.KEY:
		var original_position = position
		if event.is_action_pressed("move_right"):
			position.x += 1
		elif event.is_action_pressed("move_left"):
			position.x -= 1
		elif event.is_action_pressed("move_down"):
			position.y += 1
		elif event.is_action_pressed("move_up"):
			position.y -= 1
		if map.get_tileset().tile_get_shape(map.get_cellv(position)):
			position = original_position
		set_pos(position * scale)