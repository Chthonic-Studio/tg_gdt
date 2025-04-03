extends ScrollContainer

var CharacterListItemScene = preload("res://character_list_item.tscn")

# Reference to the VBoxContainer
@onready var character_list_vbox = $characterListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in character_list_vbox.get_children():
		character_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the character list
func populate_character_list(characters):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of characters
	for character in characters:
		# Instantiate a new character_list_item
		var character_list_item = CharacterListItemScene.instantiate()

		# Populate the fields with the character's information
		# Load the texture from the character_avatar property
		var avatar_texture = load(character.character_avatar)
		character_list_item.get_node("charAvatar").texture = avatar_texture
		character_list_item.get_node("charName").text = character.character_fullName
		character_list_item.get_node("charClass").text = character.selected_class["name"]
		character_list_item.get_node("charMissions").text = str(character.missions_completed)
		character_list_item.get_node("charRank").text = character.rank

		# Assign the character to the button's script
		character_list_item.get_node("charListButton").character = character
		
		# Add the character_list_item to the VBoxContainer
		character_list_vbox.add_child(character_list_item)

# Connect to the GameManager's update_character_list signal
func _ready():
	GameManager.connect("update_character_list", Callable(self, "populate_character_list"))
