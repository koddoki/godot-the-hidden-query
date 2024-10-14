extends VBoxContainer

@export var cor : Color


@onready var previewer = $QueryPreviewer
@onready var viewer = $QueryViewer
@onready var result = $QueryResult
@onready var animation = $AnimationPlayer


func _ready() -> void:
	update_colors()


func update_colors():
	var color_previewer : Color = cor
	var color_viewer : Color = Color(clamp(cor.r * 1.1, 0, 255), clamp(cor.g * 1.1, 0, 255), clamp(cor.b * 1.1, 0, 255))
	var color_result : Color = Color(clamp(cor.r * 1.3, 0, 255), clamp(cor.g * 1.3, 0, 255), clamp(cor.b * 1.3, 0, 255))
	
	previewer.update_color(color_previewer)
	viewer.update_color(color_viewer)
	result.update_color(color_result)


#region animation
func animation_open_previewer():
	animation.play("open_previewer")


func animation_close_previewer():
	animation.play("close_previewer")


func animation_open_viewer():
	print("open viewer")
	animation.play("open_viewer")


func animation_close_viewer():
	animation.play("close_viewer")


func animation_open_result():
	animation.play("open_result")
#endregion


func _on_query_previewer_view_button_pressed() -> void:
	animation_close_previewer()


func _on_query_viewer_execute_button_pressed() -> void:
	animation_open_result()


func _on_query_viewer_hide_button_pressed() -> void:
	animation_close_viewer()
