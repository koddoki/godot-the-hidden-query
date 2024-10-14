extends Location

@onready var animation := $AnimationPlayer


func _on_arrow_east_pressed() -> void:
	change_location.emit("TestLocationEast")
	animation.play("fade")


func _on_arrow_west_pressed() -> void:
	change_location.emit("TestLocationWest")
	animation.play("fade")
