extends ColorRect


@onready var animation := $AnimationPlayer
signal fade_in_is_over
signal fade_out_is_over


func fade_in():
	animation.play("fade_in")


func fade_out():
	animation.play("fade_out")


func emit_fade_in_is_over():
	fade_in_is_over.emit()


func emit_fade_out_is_over():
	fade_out_is_over.emit()
