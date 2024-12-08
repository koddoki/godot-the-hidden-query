extends ColorRect


@onready var animation := $AnimationPlayer


func fade_in():
	animation.play("fade_in")


func fade_out():
	animation.play_backwards("fade_in")
