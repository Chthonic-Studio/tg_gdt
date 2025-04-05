extends ScrollContainer

var DungeonListItemScene = preload("res://dungeon.tscn")
var DungeonProfile = preload("res://scripts/guild/dungeonProfile.gd")  # Preload the MissionProfile script

@onready var dungeon_list_vbox = $lp_dungeonList/dungeonListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in mission_list_vbox.get_children():
		mission_list_vbox.remove_child(child)
		child.queue_free()

