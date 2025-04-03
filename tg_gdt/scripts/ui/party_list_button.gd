extends Button

# Reference to the character this button represents
var party

func _ready():
	connect("pressed", Callable (self, "_on_button_pressed"))

func _on_button_pressed():
	print ("Party List Button Pressed for Party:" + str(party))
	UIManager.select_party(party)
