extends Node2D


func _ready():
	pass


func change_location(next_location_name : String) -> void:
	get_node(next_location_name).visible = true
	get_node(next_location_name).animation.play_backwards("fade")
