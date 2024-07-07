class_name Fruit extends Interactable

@export var growing_speed: float = 1.0
@export var drying_speed: float = 1.0
@export var dry_color: Color
@export var wet_color: Color

@onready var personality: float = randf_range(1.0, 1.25)

var target_modulate: Color

var water_progress: float = 1.0

var can_harvest: bool = false:
	set(val):
		can_harvest = val
		can_interact = can_harvest or can_water
		interact_changed.emit()
var can_water: bool = false:
	set(val):
		can_water = val
		can_interact = can_harvest or can_water
		interact_changed.emit()

func _ready() -> void:
	can_interact = false
	%GrowAnimationPlayer.play("grow")
	%GrowAnimationPlayer.animation_finished.connect(_on_finished_growing)

func _on_finished_growing(_animation: String) -> void:
	can_harvest = true

func _physics_process(delta: float) -> void:
	water_progress -= delta * drying_speed * 1.0 / 64.0 * personality
	water_progress = clamp(water_progress, 0.0, 1.0)
	target_modulate = lerp(dry_color, wet_color, water_progress)
	modulate = lerp(modulate, target_modulate, delta * 2.0)
	
	%GrowAnimationPlayer.speed_scale = growing_speed * personality * ((0.25 + 0.75 * water_progress) * 0.01)
	
	if not can_water and water_progress < 0.90:
		can_water = true
	if can_water and water_progress >= 0.90:
		can_water = false

func interact_string() -> String:
	if can_harvest:
		return "z: harvest"
	if can_water:
		return "z: give water"
	return ""

func interact(player: Player) -> void:
	player.can_interact = true
	if can_harvest:
		set_physics_process(false)
		Data.fruits += 1
		%GrowAnimationPlayer.speed_scale = 2.0
		%GrowAnimationPlayer.play("harvest")
		await %GrowAnimationPlayer.animation_finished
		queue_free()
	if can_water:
		%WaterAnimationPlayer.play("water")
		water_progress = 1.0
