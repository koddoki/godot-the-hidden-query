extends VBoxContainer

func add_query():
	var new_query = load("res://utils/query/query.tscn")
	var new_query_instance = new_query.instantiate()
	add_child(new_query_instance)
