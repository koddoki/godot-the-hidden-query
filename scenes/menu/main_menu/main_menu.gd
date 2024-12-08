extends Node2D

@onready var animation := $AnimationPlayer
@onready var credits := $Credits
@onready var about := $About
@onready var fade := $FadeRect


func _on_start_button_button_pressed() -> void:
	SceneSwitcher.goto_scene("res://scenes/map/map.tscn")


func _on_about_button_button_pressed() -> void:
	animation.play("open_about")
	fade.fade_in()


func _on_credits_button_button_pressed() -> void:
	animation.play("open_credits")
	fade.fade_in()


func _on_about_return_button_pressed() -> void:
	animation.play("close_about")
	fade.fade_out()


func _on_credits_return_button_pressed() -> void:
	animation.play("close_credits")
	fade.fade_out()
