extends NinePatchRect

var log_label: Label

func _ready() -> void:
	# Attempt to assign the label node when the scene is ready.
	log_label = get_node("logText")
	if not log_label:
		push_error("Error: 'logText' node not found in LogEntry scene.")

func set_log_text(message: String) -> void:
	if log_label:
		log_label.text = message
	else:
		# If the label is still null, defer the assignment.
		call_deferred("_delayed_set_log_text", message)

func _delayed_set_log_text(message: String) -> void:
	log_label = get_node("logText")
	if log_label:
		log_label.text = message
	else:
		push_error("Delayed: 'logText' node still not found in LogEntry scene.")
