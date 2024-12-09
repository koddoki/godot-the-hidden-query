extends Node2D

# Make sure this number isn't higher than the number of positions
@export var current_position := 1

@onready var positions := $UpperScreen/Positions


func _on_blink_timer_timeout() -> void:
	var position : Sprite2D = positions.get_child(current_position)
	position.visible = !position.visible
