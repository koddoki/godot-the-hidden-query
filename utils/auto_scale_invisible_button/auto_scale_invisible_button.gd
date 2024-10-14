extends Button


func _ready() -> void:
	if get_parent():
		if get_parent().has_method("get_rect"):
			size = get_parent().call("get_rect").size
			position.x = -size.x/2
			position.y = -size.y/2
		print("AutoScaleInvisibleButton parent should always have the methos get_rect()")
		return
	print("AutoScaleInvisibleButton should always have a parent")
