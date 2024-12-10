extends Location

signal start_cutscene_3


func _on_npc_pressed(location_number: int) -> void:
	start_cutscene_3.emit()
