class_name Spike extends Sprite2D

func _ready() -> void:
	scale *= randf_range(0.8, 1.1)
	modulate.r *= randf_range(0.9, 1.1)
