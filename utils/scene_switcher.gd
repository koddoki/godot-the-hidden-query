extends Node


var current_scene = null


func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)


func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)


func _deferred_goto_scene(path):
	current_scene.free()
	
	var scene = ResourceLoader.load(path)
	current_scene = scene.instantiate()
	
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
