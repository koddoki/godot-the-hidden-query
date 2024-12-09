extends Sprite2D

@export var location_number : int = 1

signal pressed(location_number : int)


func _on_button_mouse_entered() -> void:
	modulate = Color("edec2a")


func _on_button_mouse_exited() -> void:
	modulate = Color("ff3a33")


func _on_button_pressed() -> void:
	pressed.emit(location_number)
