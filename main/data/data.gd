extends Node

signal data_changed

var seeds: int:
	set(val):
		seeds = val
		data_changed.emit()

var fruits: int:
	set(val):
		fruits = val
		data_changed.emit()

var fed: int

func _ready() -> void:
	seeds = 2
	fruits = 0
	fed = 0
