extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var enemyscene = load("res://enemy.tscn")
	var enemy = enemyscene.instance()
	enemy.add_to_group("enemies")
	add_child(enemy)