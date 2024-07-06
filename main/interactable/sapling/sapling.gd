class_name Sapling extends Interactable

func _ready() -> void:
	can_interact = true

func interact(player: Player) -> void:
	player.can_interact = true
	Data.seeds += 1
	%AnimationPlayer.play("pick")
	await %AnimationPlayer.animation_finished
	queue_free()

func interact_string() -> String:
	return "z: pluck seed"
