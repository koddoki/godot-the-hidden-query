extends VBoxContainer

class_name Query

@export var cor := Color.WHITE


@onready var previewer = $QueryPreviewer
@onready var viewer = $QueryViewer
@onready var result = $QueryResult
@onready var animation = $AnimationPlayer
@onready var rng = RandomNumberGenerator.new()

signal answer(result : Array[Dictionary])
signal execute_query(query_string : String, query_node : Query)


func _ready() -> void:
	update_colors()


func update_colors():
	var color_previewer : Color
	
	if cor == Color.WHITE:
		color_previewer = generate_random_color()
	else:
		color_previewer = cor
	
	var color_viewer : Color = Color(color_previewer.r * 1.1,color_previewer.g * 1.1, color_previewer.b * 1.1)
	var color_result : Color = Color(color_previewer.r * 1.3, color_previewer.g * 1.3, color_previewer.b * 1.3)
	
	previewer.update_color(color_previewer)
	viewer.update_color(color_viewer)
	result.update_color(color_result)


func generate_random_color() -> Color:
	var r = rng.randf_range(0, 0.5)
	var g = rng.randf_range(0, 0.5)
	var b = rng.randf_range(0, 0.5)

	return Color(r,g,b)


#region animation
func animation_open_previewer():
	animation.play("open_previewer")


func animation_close_previewer():
	animation.play("close_previewer")


func animation_open_viewer():
	animation.play("open_viewer")


func animation_close_viewer():
	animation.play("close_viewer")


func animation_open_result():
	animation.play("open_result")


func animation_close_result():
	animation.play("close_result")


func animation_close_result_and_viewer():
	animation.play("close_result_and_viewer")
#endregion


#region buttons
func _on_query_previewer_view_button_pressed() -> void:
	animation_close_previewer()


func _on_query_viewer_execute_button_pressed(text : String) -> void:
	print("_on_query_viewer_execute_button_pressed")
	execute_query.emit(text, self)
	animation_open_result()


func _on_query_viewer_reset_button_pressed() -> void:
	if result.visible == true:
		animation_close_result()


func _on_query_viewer_hide_button_pressed() -> void:
	previewer.label.text = viewer.text_edit.text.left(20) + "..."
	if result.visible == true:
		animation_close_result_and_viewer()
		return
	animation_close_viewer()
#endregion


func _on_query_previewer_delete_button_pressed() -> void:
	queue_free()


func _on_query_result_answer(result_dict : Array[Dictionary]) -> void:
	answer.emit(result_dict)
