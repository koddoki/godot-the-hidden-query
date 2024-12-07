extends Node2D

@onready var tilemap_layers := $TileMapLayers
@onready var people_nodes := $People

func _ready() -> void:
	var test : Array[String] = ["Douglas", "Adriana"]
	focus_on_people(test)



func reset_color():
	tilemap_layers.modulate = Color.WHITE
	var people_children = people_nodes.get_children()
	
	for child : Sprite2D in people_children:
		child.modulate = Color.WHITE


func focus_on_people(node_names : Array[String]):
	tilemap_layers.modulate = Color.DIM_GRAY
	var people_children = people_nodes.get_children()
	
	for child : Sprite2D in people_children:
		if child.name not in node_names:
			child.modulate = Color.DIM_GRAY
