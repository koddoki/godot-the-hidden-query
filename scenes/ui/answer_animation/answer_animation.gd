extends Node2D

@onready var animation := $AnimationPlayer

signal pressed(is_right_answer : bool)


func _on_button_pressed() -> void:
	animation.play("RESET")


func correct_answer():
	animation.play("correct_answer")
	pressed.emit(true)


func wrong_answer():
	animation.play("wrong_answer")
	pressed.emit(false)
