extends Node

# All signals

# UI toggling signals
signal toggle_leftMenu
signal toggle_characterList
signal toggle_partiesList
# Signal to notify when a character is selected
signal character_selected(character)


func _ready():
	print("UIManager initialized")

# Function to select a character
func select_character(character):
	emit_signal("character_selected", character)
	
func leftMenu_toggle():
	emit_signal("toggle_leftMenu")
	
func guildAdventurersButton_toggle():
	emit_signal ("toggle_characterList")
	
func partiesList_toggle():
	emit_signal ("toggle_partiesList")
	
