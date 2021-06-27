extends Reference


func get(p_path: String) -> Resource:
	var paths := PoolStringArray()
	paths.push_back(p_path)
	var data := getAll(paths)
	return data.front()


func getAll(p_paths: PoolStringArray) -> Array:
	return []


func get_or_create(p_path: String) -> Resource:
	if exists(p_path):
		return get(p_path)
	return create(p_path)


func exists(p_path: String) -> bool:
	return false


func create(p_path: String) -> Resource:
	return null


func save(p_path: String) -> int:
	return OK


func delete(p_path: String) -> int:
	return OK


