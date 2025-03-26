extends Button

# Load the CharacterGenerator script
var CharacterGenerator = preload("res://scripts/characters/characterGenerator.gd").new()

func _on_pressed():
	var new_character = CharacterGenerator.generate_character()
	get_tree().root.add_child(new_character)
	print(new_character)
