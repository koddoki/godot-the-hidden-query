extends VBoxContainer


signal answer(result : Array[Dictionary])
signal execute_query(query_string : String, query_node : Query)


func add_query():
	var new_query = load("res://utils/query/query.tscn")
	var new_query_instance : Query = new_query.instantiate()
	new_query_instance.connect("answer", answer.emit)
	new_query_instance.connect("execute_query", emit_execute_query)
	
	add_child(new_query_instance)


func emit_execute_query(query_string : String, query_node : Query):
	execute_query.emit(query_string, query_node)


func emit_answer(result_dict: Array[Dictionary]) -> void:
	answer.emit(result_dict)
