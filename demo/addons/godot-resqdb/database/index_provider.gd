tool
class_name IndexProvider
# author: willnationsdev
# license: MIT
# description: An interface for a type that defines how Index resources should
#              be managed in response to changes in other Resources.

# Required. Returns the Resource class name for which indexes should be managed.
# The class name can be an engine or script class name.
func _type() -> String:
	return ""


# Required. Returns true if p_resource should have indexes managed for it.
# This method runs on all Resources of class _type().
func _when(p_resource: Resource) -> bool:
	return true


# Required. Returns the set of mapped Indexes for p_resource.
func _map(p_resource: Resource) -> Array:
	return []


# Optional. Returns the key by which p_resource should be grouped with others.
# If overridden, must also override `_reduce` and `_delete`.
func _group(p_resource: Resource) -> String:
	return ""


# Optional. Returns a single aggregate Index for all resources in group p_key.
# If overridden, must also override `_group` and `_delete`.
func _reduce(p_grouped_resources: Array, p_key: String) -> Resource:
	return null


# Optional. Returns the updated Index when some resources stop reducing to it.
# Return null to indicate that the Index should be fully deleted.
# Note: this is not called if p_removed_resources is empty.
# If overridden, must also override `_group` and `_reduce`.
func _delete(p_index: Resource, p_removed_resources: Array) -> Resource:
	return p_index
