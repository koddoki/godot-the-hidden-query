extends Node2D

@export var label_text := "START"
@export var distance : = 10
@export var speed : = 8

@onready var label := $LabelHolder/Label

signal button_pressed


func _ready() -> void:
	label.text = label_text


func _on_button_mouse_entered() -> void:
	modulate = Color.KHAKI


func _on_button_mouse_exited() -> void:
	modulate = Color.WHITE


func _on_button_pressed() -> void:
	button_pressed.emit()
