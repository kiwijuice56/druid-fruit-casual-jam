class_name Player extends CharacterBody2D

@export var sprite: Sprite2D

@export var speed: float = 64.0

func _physics_process(delta: float) -> void:
	var input: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	velocity = input * speed
	
	move_and_slide()
	
	animate(input)


func animate(input: Vector2) -> void:
	if input.x < 0 and input.y < 0:
		sprite.frame = 0
	elif input.x > 0 and input.y < 0:
		sprite.frame = 2
	elif input.x > 0 and input.y > 0:
		sprite.frame = 4
	elif input.x < 0 and input.y > 0:
		sprite.frame = 6
	
	elif input.y < 0:
		sprite.frame = 1
	elif input.x > 0:
		sprite.frame = 3
	elif input.y > 0:
		sprite.frame = 5
	elif input.x < 0:
		sprite.frame = 7
