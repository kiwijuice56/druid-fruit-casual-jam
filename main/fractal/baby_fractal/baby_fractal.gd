class_name BabyFractal extends Fractal

func make_fractal_unique() -> void:
	fractal_canvas.material = fractal_material.duplicate()
	fractal_canvas.material.set_shader_parameter("rotation_speed", randf_range(8.0/128.0, 16.0/128.0))
	fractal_anim.play("idle")
