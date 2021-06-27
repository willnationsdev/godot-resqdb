tool
extends EditorPlugin

func _get_resq_script_path():
	get_script().resource_path.plus_file("../database/resq")





func _setup_resq():
	if not ProjectSettings.has_setting(ResQ.RESQ_PATH_KEY):
		ProjectSettings.add_property_info({
			"name": ResQ.RESQ_PATH_KEY,
			"type": TYPE_STRING,
		})
	ProjectSettings.set_setting(ResQ.RESQ_PATH_KEY, ResQ.resource_path)


func _shutdown_resq():
	_db = null
	


func _enter_tree():
	_setup_resq()


func _exit_tree():
	pass
