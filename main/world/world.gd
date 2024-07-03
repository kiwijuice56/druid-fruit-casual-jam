class_name World extends Node2D

func _ready() -> void:
	for i in range(4):
		var fruit: Area2D = preload("res://main/fruit/fruit.tscn").instantiate()
		add_child(fruit)
		fruit.global_position = Vector2(randf_range(0, 330.0), randf_range(0, 256.0))
