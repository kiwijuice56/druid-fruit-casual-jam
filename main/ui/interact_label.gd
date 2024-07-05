class_name InteractLabel extends Label

func _ready() -> void:
	text = ""

func prompt(input_text: String) -> void:
	text = input_text
