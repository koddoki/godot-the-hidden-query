extends Node2D


func change_location(next_location_name : String) -> void:
	get_node(next_location_name).visible = true


func hide_locations():
	for location : Location in get_children():
		location.visible = false
