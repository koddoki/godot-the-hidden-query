extends Node2D


@onready var background_node : = $Background
@onready var textbox_title : = $ColorRect/Title
@onready var textbox_text : = $ColorRect/Text
@onready var characters : = $Characters
@onready var spawn_positions : = $SpawnPositions


@onready var default_texture = load("res://icon.svg")

var current_csv_row = 0
var dialogues : Array
var puzzle := 0


# If you want to go back to the map, next_puzzle should be equals to 0
func start_cutscene(cutscene_path : String, next_puzzle : int):
	visible = true
	puzzle = next_puzzle
	var json_as_text = FileAccess.get_file_as_string(cutscene_path)
	dialogues = JSON.parse_string(json_as_text)
	next_scene()


func next_scene():
	if dialogues.size() > 0:
		var dialogue = dialogues.pop_back()
		var background = dialogue["background"] if dialogue.has("background") else null
		var title = dialogue["title"] if dialogue.has("title") else null
		var text = dialogue["text"] if dialogue.has("text") else null
		var character_data = dialogue["character_data"] if dialogue.has("character_data") else null
		update_text(title, text)
		update_characters(character_data)
		return
	
	if puzzle == 0:
		visible = false
		return
	
	SceneSwitcher.goto_scene("res://scenes/puzzles/Puzzle" + str(puzzle) +"/puzzle.tscn")

## This function is not being used in this project, but if neccessary it's possible to
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
	next_scene()
