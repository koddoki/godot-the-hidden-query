extends Node2D

@onready var sql = $BottomScreen/Queries.sql
@onready var simulation := $Simulation

func _ready() -> void:
	prepare_database()
	var batata = sql.execute_query("SELECT * FROM people")
	print(batata)


func prepare_database():
	var table : Dictionary = {
		"id" : {"data_type":"int", "primary_key":true, "not_null":true, "auto_increment":true},
		"name" : {"data_type":"text"}
	}
	
	sql.create_table("people", table)
	sql.delete_from_table("people")
	
	generate_puzzle_data()

func generate_puzzle_data() -> void:
	var data : Array[Dictionary] = [
		{
		"name" : "Douglas"
		},
		{
		"name" : "Adriana"
		},
		{
		"name" : "Cleber"
		},
		{
		"name" : "Renato"
		},
		{
		"name" : "Guilherme"
		},
		{
		"name" : "Vania"
		}
	]
	
	sql.insert_rows("people", data)


func _on_queries_answer(answer_array: Array[Dictionary]) -> void:
	var people_name : Array[String]
	
	for row in answer_array:
		people_name.append(row.name)
	
	simulation.reset_color()
	simulation.focus_on_people(people_name)
