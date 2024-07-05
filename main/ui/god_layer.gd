class_name GodLayer extends CanvasLayer

func talk() -> void:
	visible = true
	await get_tree().create_timer(3.0).timeout
	visible = false
