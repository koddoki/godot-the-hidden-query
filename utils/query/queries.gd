extends VBoxContainer

@export var database_path : String = "res://"

@onready var queries_container := $Scroll/QueriesContainer
@onready var sql := $SQL

signal answer(query : String)


func _ready() -> void:
	sql.update_database_path(database_path)
	sql.open_database()


func create_table(table_name : String, table : Dictionary) -> void:
	sql.create_table(table_name, table)


func _on_add_button_pressed() -> void:
	queries_container.add_query()
