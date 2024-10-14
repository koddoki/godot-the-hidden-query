extends ColorRect

signal view_button_pressed


func _on_button_pressed() -> void:
	view_button_pressed.emit()


func update_color(new_color : Color) -> void:
	color = new_color
