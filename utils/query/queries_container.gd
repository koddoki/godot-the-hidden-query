extends VBoxContainer


signal answer(result : Array[Dictionary])


func add_query():
	var new_query = load("res://utils/query/query.tscn")
	var new_query_instance : Query = new_query.instantiate()
	new_query_instance.connect("answer", answer.emit)
	
	add_child(new_query_instance)
