extends Button

# Reference to the character this button represents
var character

func _ready():
	connect("pressed", Callable (self, "_on_button_pressed"))

func _on_button_pressed():
	UIManager.select_character(character)
