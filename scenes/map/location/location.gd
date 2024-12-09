class_name Location

extends Node2D

signal go_to_location(location_number : int)


func _on_arrow_pressed(location_number: int) -> void:
	go_to_location.emit(location_number)
	print("Batata")
