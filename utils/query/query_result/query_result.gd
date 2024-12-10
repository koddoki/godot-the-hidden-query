extends ColorRect

class_name QueryResult

@onready var label := $ScrollContainer/Label

var current_result : Array[Dictionary] = []

signal answer(answer : Array[Dictionary])


func update_color(new_color : Color) -> void:
	color = new_color


func update_result(new_result : Array[Dictionary]):
	print("Era pra atualizar o texto do result")
	current_result = new_result
	label.text = array_to_readable_string(current_result)


func array_to_readable_string(data: Array) -> String:
	if data.size() == 0:
		return ""
	
	var result = "[color=white]"
	var headers = data[0].keys()
	var colors = ["red", "green", "blue", "orange", "purple", "cyan", "yellow"]
	var header_colors = {}
	
	for i in headers.size():
		header_colors[headers[i]] = colors[i % colors.size()]
	
	for header in headers:
		var color = header_colors[header]
		result += "[color=%s]%s[/color], " % [color, header.capitalize()]
	result = result.rstrip(", ") + "[/color]\n"

	for entry in data:
		var entry_string = ""
		for key in headers:
			var color = header_colors[key]
			entry_string += "[color=%s]%s[/color], " % [color, str(entry.get(key, "N/A"))]
		entry_string = entry_string.rstrip(", ")
		result += entry_string + "\n"
	
	return result


func _on_answer_pressed() -> void:
	answer.emit(current_result)
