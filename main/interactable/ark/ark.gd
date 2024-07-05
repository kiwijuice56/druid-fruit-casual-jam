class_name Ark extends Interactable

@export var god_layer: GodLayer

func _ready() -> void:
	can_interact = true

func interact(player: Player) -> void:
	player.frozen = true
	await god_layer.talk()
	Data.seeds += ceil(Data.fruits * 1.5)
	Data.fruits = 0
	player.frozen = false
	player.can_interact = true

func interact_string() -> String:
	return "z: witness"
