tool
extends Reference

const ResQStore := preload("resq_store.gd")

var store: ResQStore = null


# Start a new command pipeline.
func begin_transaction():
	pass


# Update indexes for the resource at p_path.
func update_indexes(p_path: String):
	pass


# Create a save command.
# When executed, a save will update indexes.
func push_save(p_path: String, p_resource: Resource, p_flags := 0):
	pass


# Create an import command.
# When executed, an import will update indexes.
# Note: 'import' means importing data from a different resq_db. It is not
#       related to Godot's import system.
# Note: If using the default implementation of a flat-file DB, this command
#       will fail.
func push_import(p_resource: Resource, p_path: String, p_version: String):
	pass


# Create a delete command.
func push_delete(p_path):
	pass


# Create a flush command. When committed, post-flush commands will be aware
# of changes from pre-flush commands.
func push_flush():
	pass


# flush all commands in pipeline and commit transaction.
func commit():
	pass


# discard all commands in pipeline and rollback transaction.
func rollback():
	pass

