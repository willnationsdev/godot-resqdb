tool
class_name ResQ
# author: willnationsdev
# license: MIT
# description:
# 
# ResQ provides a singleton facade for an indexable Resource database.
# - Define Resource types with an `*Index` suffix.
# - Define Reference types that extend `IndexProvider`.
# - Each IndexProvider...
#   - can only manage one type of Index.
#   - contributes to a master collection of the given type of Index.
#   - evaluates a modified resource for possible Index create/update/delete ops.
# - The database instance is maintained in this script's meta data.
# 
# This is a "singleton" class.
# The instance is stored in the Script's meta data.
# `ResQ.get_db()` accesses the actual database.
# The first access instantiates the database.
# The database persists until Godot shuts down.
# You can manually rebuild the database with `ResQ.refresh()`.
# You can manually delete the in-memory database with `ResQ.clear()`.
# After `clear`-ing, the database cannot be used until `get_db()` is used.
# To delete all associated index resources

const ResQDB := preload("resq_db.gd")
const RESQ_PATH_KEY := "_resq_path"
const RESQ_META_KEY := "_resq_db"


static func _get_script_static() -> Script:
	return load(ProjectSettings.get_setting(RESQ_PATH_KEY)) as Script


static func _create_db() -> void:
	var script = _get_script_static()
	script.set_meta(RESQ_META_KEY, ResQDB.new())


static func get_db() -> ResQDB:
	var script = _get_script_static()
	if not script.has_meta(RESQ_META_KEY):
		_create_db()
	var db = script.get_meta(RESQ_META_KEY)
	# Eventually port this to C++ so not limited to GDScript code
	if not db or not db is ResQDB:
		_create_db()
	return script.get_meta(RESQ_META_KEY) as ResQDB


static func save(p_path: String, p_resource: Resource):
	var db := get_db()
	db.push_save(p_path, p_resource)

