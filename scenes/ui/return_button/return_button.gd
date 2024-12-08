extends Sprite2D


signal pressed


func _on_button_mouse_entered() -> void:
	modulate = Color.KHAKI


func _on_button_mouse_exited() -> void:
	modulate = Color.WHITE


func _on_button_pressed() -> void:
	pressed.emit()
