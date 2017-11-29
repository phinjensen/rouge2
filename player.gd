extends "entity.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var enemy = get_node("../Enemy")

func attack(enemy):
	enemy.health -= 10
	if enemy.health <= 0:
		enemy.free()
		print("deaded him good!")

func move(direction):
	var new_position = position
	if direction == "right":
		new_position.x += 1
	elif direction == "left":
		new_position.x -= 1
	elif direction == "down":
		new_position.y += 1
	elif direction == "up":
		new_position.y -= 1
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if enemy.position == new_position:
			print("enemy!")
			attack(enemy)
			return
	if not map.get_tileset().tile_get_shape(map.get_cellv(new_position)):
		position = new_position

func _ready():
	health = 100
	position = Vector2(1, 1)
	set_pos(position * scale)
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.KEY:
		var original_position = position
		for action in ["move_right", "move_left", "move_down", "move_up"]:
			if event.is_action_pressed(action):
				move(action.split("_")[-1])
		set_pos(position * scale)
