extends Node

signal log_added(new_log)

# Array to hold log messages (only those meant for the player to see)
var logs: Array = []

func add_log(message: String) -> void:
	# Add the message to our log array
	logs.append(message)
	# Emit a signal so any UI elements can update if needed
	emit_signal("log_added", message)

# Optional: A method to clear logs
func clear_logs() -> void:
	logs.clear()
