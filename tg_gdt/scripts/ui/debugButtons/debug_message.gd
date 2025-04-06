extends Button

func _ready():
	connect("pressed", Callable (self, "_on_DebugButton_pressed"))
	
func _on_DebugButton_pressed():
	GameManager.generate_random_notification()
