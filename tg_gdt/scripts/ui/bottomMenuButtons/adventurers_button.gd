extends Button

func _ready():
	connect("pressed", Callable (self, "_on_button_pressed"))

func _on_button_pressed():
	UIManager.guildAdventurersButton_toggle()
