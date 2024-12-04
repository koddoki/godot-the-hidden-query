extends Node
 
class_name SQL


var database : SQLite


func _ready() -> void:
	database = SQLite.new()


func update_database_path(path : String):
	database.path = path


func open_database():
	database.open_db()


func create_table(table_name : String, table : Dictionary) -> void:
	print("criou eee")
	database.create_table(table_name, table)


func insert_row(table_name : String, row : Dictionary) -> void:
	print("Inserting into " + table_name)
	database.insert_row(table_name, row)
