class_name SeedLabel extends Label

func _ready() -> void:
	Data.data_changed.connect(_on_data_changed)
	_on_data_changed()

func _on_data_changed() -> void:
	text = "x%d" % Data.seeds

