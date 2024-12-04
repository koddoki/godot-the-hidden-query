extends VBoxContainer

@export var database_path : String = "res://"

@onready var queries_container := $Scroll/QueriesContainer
@onready var sql := $SQL

signal answer(data : Array[Dictionary])


func _ready() -> void:
	sql.update_database_path(database_path)
	sql.open_database()


func _on_add_button_pressed() -> void:
	queries_container.add_query()


func _on_queries_container_answer(result: Array[Dictionary]) -> void:
	print("CHEGO AQUIIIIIIIIIII \n" + str(result))
	answer.emit(result)
