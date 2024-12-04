extends Node2D

@onready var queries := $Queries

func _ready() -> void:
	prepare_database()


func prepare_database():
	var table : Dictionary = {
		"id" : {"data_type":"int", "primary_key":true, "not_null":true, "auto_increment":true},
		"name" : {"data_type":"text"},
		"score" : {"data_type" : "int"}
	}
	
	queries.create_table("teste", table)
	
	var puzzle_data := generate_puzzle_data()

func generate_puzzle_data() -> Dictionary:
	var data : Dictionary = {
		"name" : "batata",
		"score" : 123
	}
	
	return data


func _on_queries_answer(query: String) -> void:
	pass # Replace with function body.
