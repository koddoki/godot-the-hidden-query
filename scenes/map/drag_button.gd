extends TextureButton

var dragging : bool = false
var max_velocity : Vector2 = Vector2(800,800)
var last_mouse_position = Vector2.ZERO


func _ready():
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)


func _process(delta):
	if dragging:
		global_position += get_global_mouse_position() - last_mouse_position
		
		global_position = global_position.clamp(-(Vector2(get_rect().size.x - get_parent().size.x, get_rect().size.y - get_parent().size.y)), Vector2.ZERO)
	last_mouse_position = get_global_mouse_position()


func _on_button_down():
	dragging = true


func _on_button_up():
	dragging = false
