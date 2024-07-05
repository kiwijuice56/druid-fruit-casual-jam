class_name PropertyLabel extends Label

@export var property: String

func _ready() -> void:
	Data.data_changed.connect(_on_data_changed)
	_on_data_changed()

func _on_data_changed() -> void:
	text = "x%d" % int(Data.get(property))

