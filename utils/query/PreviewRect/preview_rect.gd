extends ColorRect

signal view_button_pressed
signal delete_button_pressed

@onready var label := $Label


func _on_button_pressed() -> void:
	view_button_pressed.emit()


func update_color(new_color : Color) -> void:
	color = new_color


func _on_delete_button_pressed() -> void:
	delete_button_pressed.emit()
