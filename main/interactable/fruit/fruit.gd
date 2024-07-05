class_name Fruit extends Interactable

@export var drying_speed: float = 1.0
@export var dry_color: Color
@export var wet_color: Color

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
	water_progress -= delta * drying_speed * 1.0 / 64.0
	water_progress = clamp(water_progress, 0.0, 1.0)
	modulate = lerp(dry_color, wet_color, water_progress)
	
	%GrowAnimationPlayer.speed_scale = (0.5 + 0.5 * water_progress) * 0.2
	
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
		queue_free()
	if can_water:
		water_progress = 1.0
