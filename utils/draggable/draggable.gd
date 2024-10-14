extends Button

## This node parent will become draggable, this means whenever you click on it you will be able to move it


var dragging : bool = false
var max_velocity : Vector2 = Vector2(800,800)


func _ready():
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	
	modulate.a = 0


func _process(delta):
	if dragging:
		get_parent().rotation = 0
		get_parent().global_position = get_global_mouse_position()
		get_parent().linear_velocity = Input.get_last_mouse_velocity()#.clamp(-max_velocity,max_velocity)


func _on_button_down():
	dragging = true


func _on_button_up():
	dragging = false
