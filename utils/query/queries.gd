extends VBoxContainer

@export var database_path : String = "res://"

@onready var queries_container := $Scroll/QueriesContainer
@onready var sql := $SQL
@onready var answer_hint := $AnswerHint
var current_ongoing_query : Query

signal answer(data : Array[Dictionary])
signal reset


func update_answer_hint_text(new_text : String):
	answer_hint.update_text(new_text)


func _ready() -> void:
	sql.update_database_path(database_path)
	sql.open_database()


func _on_add_button_pressed() -> void:
	queries_container.add_query()


func _on_queries_container_answer(result: Array[Dictionary]) -> void:
	answer.emit(result)


func _on_queries_container_execute_query(query_string: String, query_node : Query) -> void:
	print("_on_queries_container_execute_query")
	current_ongoing_query = query_node
	var batata = sql.execute_query(query_string)
	query_node.result.update_result(batata)
	


func _on_hint_button_pressed() -> void:
	answer_hint.visible = true
