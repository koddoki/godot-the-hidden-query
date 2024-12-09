extends Node2D

@onready var animation := $AnimationPlayer
signal change_location(next_location_name : String)

func _on_arrow_east_pressed() -> void:
	change_location.emit("TestLocationEast")
	animation.play("fade")


func _on_arrow_west_pressed() -> void:
	change_location.emit("TestLocationWest")
	animation.play("fade")
