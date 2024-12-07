extends Node2D

@onready var sql = $Queries.sql

func _ready() -> void:
	prepare_database()
	var batata = sql.execute_query("SELECT * FROM teste")
	print(batata)


func prepare_database():
	var table : Dictionary = {
		"id" : {"data_type":"int", "primary_key":true, "not_null":true, "auto_increment":true},
		"name" : {"data_type":"text"},
		"score" : {"data_type" : "int"}
	}
	
	sql.create_table("teste", table)
	# sql.delete_from_table("teste")
	
	generate_puzzle_data()

func generate_puzzle_data() -> void:
	var data : Dictionary = {
		"name" : "batata",
		"score" : 123
	}
	
	sql.insert_row("teste", data)


func _on_queries_answer(query: String) -> void:
	pass # Replace with function body.
