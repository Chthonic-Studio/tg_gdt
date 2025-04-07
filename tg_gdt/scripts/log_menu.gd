extends ScrollContainer

# Export the LogEntry scene so you can assign it in the editor.
var log_entry_scene = preload("res://log_entry.tscn")

# Assume the VBoxContainer is a direct child of the ScrollContainer.
@onready var vbox: VBoxContainer = $logVBox

func _ready() -> void:
	# Connect to the global LogManager signal to know when a new log is added.
	LogManager.connect("log_added", Callable (self, "_on_log_added"))
	# Optionally, populate UI with any existing logs on startup.
	for message in LogManager.logs:
		_create_log_entry(message)

# This method is called whenever LogManager adds a new log message.
func _on_log_added(message: String) -> void:
	_create_log_entry(message)
	# Optionally scroll to the bottom
	# This could involve setting the scroll value to 0.
	self.scroll_vertical = 0

func _create_log_entry(message: String) -> void:
	# Instance the LogEntry scene and set the log text.
	var entry = log_entry_scene.instantiate()
	entry.set_log_text(message)
	# Insert the new entry at the beginning so that newest is first.
	vbox.add_child(entry)
	vbox.move_child(entry, 0)
