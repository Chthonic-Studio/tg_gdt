extends Node

# All signals

# UI toggling signals
signal toggle_leftMenu
signal toggle_characterList
signal toggle_partiesList
signal toggle_economyList
signal toggle_guildList
signal toggle_missionList
signal toggle_dungeonList
# Signal to notify when en element is selected
signal character_selected(character)
signal party_selected(party)

# Guild building button connections
signal initialize_button_handler


func _ready():
	print("UIManager initialized")
	# Emit the signal to initialize the button handler
	emit_signal("initialize_button_handler")

# Function to select a character
func select_character(character):
	emit_signal("character_selected", character)
	
func select_party(party):
	emit_signal("party_selected", party)
	
func leftMenu_toggle():
	emit_signal("toggle_leftMenu")
	
func guildAdventurersButton_toggle():
	emit_signal ("toggle_characterList")
	
func partiesList_toggle():
	emit_signal ("toggle_partiesList")
	
func itemList_toggle():
	emit_signal ("toggle_economyList")

func guildList_toggle():
	emit_signal ("toggle_guildList")
	
func missionList_toggle():
	emit_signal ("toggle_missionList")
	
func dungeonList_toggle():
	emit_signal ("toggle_dungeonList")
	
# Function to update all item quantities
func update_all_quantities():
	for child in get_tree().get_nodes_in_group("item_list_entries"):
		if child.has_method("update_item_info"):
			var item_quantity = Inventory.get_item_quantity(child.item.item_id)
			child.update_item_info(child.item, item_quantity)
