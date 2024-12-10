extends Node2D

@onready var label := $Label

signal pressed


func _on_button_pressed() -> void:
	visible = false
	pressed.emit()


func update_text(new_text : String):
	label.text = new_text
