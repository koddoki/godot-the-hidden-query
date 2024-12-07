extends ColorRect


signal execute_button_pressed(text : String)
signal reset_button_pressed
signal hide_button_pressed


@onready var text_edit := $QueryViewer/HBoxContainer/TextEdit


func update_color(new_color : Color) -> void:
	color = new_color


func _on_execute_button_pressed() -> void:
	execute_button_pressed.emit(text_edit.text)


func _on_reset_button_pressed() -> void:
	text_edit.text = ""
	reset_button_pressed.emit()


func _on_hide_button_pressed() -> void:
	hide_button_pressed.emit()
