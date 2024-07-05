extends Node

signal data_changed

var seeds: int = 0:
	set(val):
		seeds = val
		data_changed.emit()

func _ready() -> void:
	seeds = 8
