class_name Fractal extends SubViewportContainer

@export var fractal_material: ShaderMaterial
@export var fractal_canvas: FractalNavigation
@export var fractal_anim: AnimationPlayer

@export var bulb_power: float:
	set(val):
		bulb_power = val
		fractal_canvas.material.set_shader_parameter("bulb_power", bulb_power)

func _ready() -> void:
	make_fractal_unique.call_deferred()

func make_fractal_unique() -> void:
	fractal_canvas.material = fractal_material.duplicate()
	fractal_canvas.material.set_shader_parameter("rotation_speed", randf_range(1.0, 9.0))
	fractal_anim.play("idle")
