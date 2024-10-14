extends Location

@onready var animation := $AnimationPlayer


func _on_arrow_south_pressed() -> void:
	change_location.emit("TestLocationSouth")
	animation.play("fade")
