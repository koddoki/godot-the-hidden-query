extends Node2D

@onready var sql = $BottomScreen/Queries.sql
@onready var simulation := $Simulation
@onready var answer_animation := $AnswerAnimation
@onready var answer_hint := $BottomScreen/AnswerHint
@onready var queries := $BottomScreen/Queries

var is_answer_correctly_answered := false
var correct_answer := ["Douglas"]

func _ready() -> void:
	prepare_database()
	queries.update_answer_hint_text("In SQL, you can have multiple conditions if you add the 'and' keyword between conditions!")


func prepare_database():
	var table : Dictionary = {
		"id" : {"data_type":"int", "primary_key":true, "not_null":true, "auto_increment":true},
		"name" : {"data_type":"text"},
		"species" : {"data_type":"text"},
		"age" : {"data_type" : "int"},
		"color" : {"data_type" : "text"},
		"diet" : {"data_type" : "text"},
		"has_ears" : {"data_type" : "bool"},
		"gender" : {"data_type" : "text"}
	}
	
	sql.create_table("people", table)
	sql.delete_from_table("people")
	
	generate_puzzle_data()

func generate_puzzle_data() -> void:
	var data : Array[Dictionary] = [
		# Elephant (with and without ears)
		{
			"name" : "Douglas",
			"species" : "Elephant",
			"age" : "12",
			"color" : "Gray",
			"diet" : "Herbivore",
			"has_ears" : "true",
			"gender" : "male"
		},
		{
			"name" : "Ella",
			"species" : "Elephant",
			"age" : "9",
			"color" : "Gray",
			"diet" : "Herbivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Giraffe (with and without ears)
		{
			"name" : "Garry",
			"species" : "Giraffe",
			"age" : "15",
			"color" : "Yellow",
			"diet" : "Herbivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Gemma",
			"species" : "Giraffe",
			"age" : "10",
			"color" : "Yellow",
			"diet" : "Herbivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Hippo (with and without ears)
		{
			"name" : "Henry",
			"species" : "Hippo",
			"age" : "20",
			"color" : "Grey",
			"diet" : "Herbivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Holly",
			"species" : "Hippo",
			"age" : "8",
			"color" : "Grey",
			"diet" : "Herbivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Monkey (with and without ears)
		{
			"name" : "Milo",
			"species" : "Monkey",
			"age" : "5",
			"color" : "Brown",
			"diet" : "Omnivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Maya",
			"species" : "Monkey",
			"age" : "7",
			"color" : "Brown",
			"diet" : "Omnivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Panda (with and without ears)
		{
			"name" : "Perry",
			"species" : "Panda",
			"age" : "10",
			"color" : "Black and White",
			"diet" : "Herbivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Penny",
			"species" : "Panda",
			"age" : "12",
			"color" : "Black and White",
			"diet" : "Herbivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Parrot (with and without ears)
		{
			"name" : "Percy",
			"species" : "Parrot",
			"age" : "3",
			"color" : "Green",
			"diet" : "Omnivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Penna",
			"species" : "Parrot",
			"age" : "4",
			"color" : "Red",
			"diet" : "Omnivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Penguin (with and without ears)
		{
			"name" : "Paul",
			"species" : "Penguin",
			"age" : "7",
			"color" : "Black and White",
			"diet" : "Carnivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Polly",
			"species" : "Penguin",
			"age" : "6",
			"color" : "Black and White",
			"diet" : "Carnivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Pig (with and without ears)
		{
			"name" : "Peter",
			"species" : "Pig",
			"age" : "3",
			"color" : "Pink",
			"diet" : "Omnivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Pippa",
			"species" : "Pig",
			"age" : "2",
			"color" : "Pink",
			"diet" : "Omnivore",
			"has_ears" : false,
			"gender" : "female"
		},
		
		# Snake (with and without ears)
		{
			"name" : "Sven",
			"species" : "Snake",
			"age" : "6",
			"color" : "Green",
			"diet" : "Carnivore",
			"has_ears" : true,
			"gender" : "male"
		},
		{
			"name" : "Sasha",
			"species" : "Snake",
			"age" : "4",
			"color" : "Green",
			"diet" : "Carnivore",
			"has_ears" : false,
			"gender" : "female"
		}
	]
	
	sql.insert_rows("people", data)


func _on_queries_answer(answer_array: Array[Dictionary]) -> void:
	var people_name : Array[String]
	
	for row in answer_array:
		people_name.append(row.name)
	print(people_name)
	if people_name.hash() == correct_answer.hash():
		answer_animation.correct_answer()
	else:
		answer_animation.wrong_answer()
	
	simulation.reset_color()
	simulation.focus_on_people(people_name)


func _on_answer_animation_pressed(is_right_answer: bool) -> void:
	is_answer_correctly_answered = is_right_answer
	answer_hint.visible = true
	
	if is_answer_correctly_answered:
		answer_hint.update_text("Nicely done!!")
	else:
		answer_hint.update_text("TIP:\nWhen you query a text, it's important to pay attention if the words are uppercase or lowercase!")


func _on_answer_hint_pressed() -> void:
	print(is_answer_correctly_answered)
	if is_answer_correctly_answered:
		Globals.level_completion[3] = {
			"is_completed": true,
			"puzzle_points": 3
		}
		SceneSwitcher.goto_scene("res://scenes/map/map.tscn")
		return
	answer_hint.visible = false
	
