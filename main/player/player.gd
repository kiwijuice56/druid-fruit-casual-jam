class_name Player extends Sprite2D

func _process(delta: float) -> void:
	var input: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if input.x < 0 and input.y < 0:
		frame = 0
	elif input.x > 0 and input.y < 0:
		frame = 2
	elif input.x > 0 and input.y > 0:
		frame = 4
	elif input.x < 0 and input.y > 0:
		frame = 6
	
	elif input.y < 0:
		frame = 1
	elif input.x > 0:
		frame = 3
	elif input.y > 0:
		frame = 5
	elif input.x < 0:
		frame = 7
	
