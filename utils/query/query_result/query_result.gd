extends ColorRect

class_name QueryResult

@onready var label := $ScrollContainer/Label

var current_result : Array[Dictionary] = []

signal answer(answer : Array[Dictionary])


func update_color(new_color : Color) -> void:
	color = new_color


func update_result(new_result : Array[Dictionary]):
	current_result = new_result
	label.text = str(current_result)


func _on_answer_pressed() -> void:
	answer.emit(current_result)
