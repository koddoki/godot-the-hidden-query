extends Node


var db : SQLite
var sample_json_path = "res://utils/sql/sample_json.json"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	db = SQLite.new()
	db.path = "res://utils/sql/db.db"
	db.open_db()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
