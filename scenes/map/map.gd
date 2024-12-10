extends Node2D

# Make sure this number isn't higher than the number of positions
@export var current_location := 1

@onready var positions := $UpperScreen/Positions
@onready var locations := $BottomScreen/Locations
@onready var bottom_fade_rect := $BottomScreen/BottomFadeRect
@onready var cutscene_manager := $CutsceneManager


func _ready() -> void:
	if not Globals.level_completion[1]["is_completed"]:
		cutscene_manager.start_cutscene("res://assets/cutscenes/cutscene_1.json", 1)
		return
	if not Globals.level_completion[2]["is_completed"]:
		cutscene_manager.start_cutscene("res://assets/cutscenes/cutscene_2.json", 2)
		return


func _on_blink_timer_timeout() -> void:
	var position : Sprite2D = positions.get_child(current_location)
	position.visible = !position.visible


func _on_location_go_to_location(location_number: int) -> void:
	var position : Sprite2D = positions.get_child(current_location)
	position.visible = false
	current_location = location_number
	bottom_fade_rect.fade_in()


func _on_bottom_fade_rect_fade_in_is_over() -> void:
	locations.hide_locations()
	locations.change_location("Location" + str(current_location))
	bottom_fade_rect.fade_out()


func _on_location_3_start_cutscene_3() -> void:
	cutscene_manager.start_cutscene("res://assets/cutscenes/cutscene_3.json", 3)
