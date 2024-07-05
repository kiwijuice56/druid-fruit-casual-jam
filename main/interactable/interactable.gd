class_name Interactable extends Area2D

var can_interact: bool = false

signal interact_changed

func interact(player: Player) -> void:
	pass

func interact_string() -> String:
	return "z: interact"
