extends Node2D


@onready var background_node : = $Background
@onready var textbox_title : = $ColorRect/TextEdit
@onready var textbox_text : = $ColorRect/TextEdit2
@onready var characters : = $Characters
@onready var spawn_positions : = $SpawnPositions


@onready var default_texture = load("res://icon.svg")

var current_csv_row = 0

signal next_button_pressed



func update_scene(_path_csv:String):
	pass


func update_background(background_path : String):
	if background_path == null:
		return
	background_node.texture = load(background_path)


func update_text(new_name : String, new_text : String):
	textbox_title.text = new_name
	textbox_text.text = new_text


## Updates multiple characters based on the provided data.
##
## @param characters_data Array of tuples, where each tuple contains:
##   - Texture2D: The texture for the character.
##   - int: The row position. Min value = 1; Max value = 4; Default value = 1.
##   - int: The column position. Min value = 1; Max value = 6; Default value = 1.
##   - bool: Whether the character is flipped horizontally.
## - character_texture : Texture2D, row : int, column : int, is_fipped : bool
func update_characters(characters_data):
	for child in characters.get_children():
		child.queue_free()
	
	for character_data in characters_data:
		assert(character_data.size() == 4)
		var character_texture = load(character_data["character_texture"]) if character_data.has("character_texture") else null
		var row = character_data["row"] if character_data.has("row") else null
		var column = character_data["column"] if character_data.has("column") else null
		var is_flipped = character_data["is_flipped"] if character_data.has("is_flipped") else null
		
		#var character_texture : Texture2D = character_data[0] if typeof(character_data[0]) == TYPE_OBJECT and character_data[0] is Texture2D else default_texture
		#var row : int = character_data[1] if typeof(character_data[1]) == TYPE_INT and int(character_data[1]) > 0 and int(character_data[1]) < 5 else 1
		#var column : int = character_data[2] if typeof(character_data[2]) == TYPE_INT and int(character_data[1]) > 0 and int(character_data[1]) < 7 else 1
		#var is_flipped : bool = character_data[3] if typeof(character_data[3]) == TYPE_BOOL else false
		
		var character_spawn_position = spawn_positions.get_node("Row"+str(row)+"/Column"+str(column)+"/SpawningPoint").global_position
		var new_character : = TextureRect.new()
		
		new_character.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		new_character.texture = character_texture
		new_character.size = Vector2(320, 448)
		new_character.position = character_spawn_position
		new_character.flip_h = is_flipped
		
		characters.add_child(new_character)


func _on_next_button_pressed():
	emit_signal("next_button_pressed")
