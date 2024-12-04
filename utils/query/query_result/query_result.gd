extends ColorRect

@onready var label := $ScrollContainer/Label


signal answer(arroz : String)


func update_color(new_color : Color) -> void:
	color = new_color


func _on_answer_pressed() -> void:
	answer.emit(label.text)
