extends VBoxContainer

var DungeonListItemScene = preload("res://dungeon.tscn")
var DungeonProfile = preload("res://scripts/guild/dungeonProfile.gd")

@onready var dungeon_list_vbox = $lp_dungeonList/dungeonListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in dungeon_list_vbox.get_children():
		dungeon_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the dungeon list
func populate_dungeon_list(dungeons):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of dungeons
	for dungeon in dungeons:
		print("Creating dungeon list item for dungeon_id: ", dungeon.dungeon_id)  # Debug print
		# Instantiate a new dungeon_list_item
		var dungeon_list_item = DungeonListItemScene.instantiate()

		# Populate the dungeon_list_item with the dungeon's information
		dungeon_list_item.get_node("dungeonTitle").text = dungeon.title
		dungeon_list_item.get_node("dungeonDescription").text = dungeon.description
		dungeon_list_item.get_node("rankValue").text = dungeon.rank
		dungeon_list_item.get_node("rewardsValue").text = format_rewards(dungeon.rewards)
		dungeon_list_item.get_node("acceptButton").connect("pressed", Callable(self, "_on_accept_button_pressed").bind(dungeon.dungeon_id))

		# Add the dungeon_list_item to the VBoxContainer
		dungeon_list_vbox.add_child(dungeon_list_item)

# Function to format the rewards dictionary into a string
func format_rewards(rewards: Dictionary) -> String:
	var rewards_str = ""
	for key in rewards.keys():
		rewards_str += str(rewards[key]) + " " + key.capitalize() + ", "
	return rewards_str.trim_suffix(", ")

# Function to handle the accept button press
func _on_accept_button_pressed(dungeon_id: String):
	DungeonManager.update_dungeon_status(dungeon_id, DungeonProfile.DungeonStatus.WAITING_FOR_ADVENTURERS)

# Connect to the DungeonManager's update_dungeon_list signal
func _ready():
	DungeonManager.connect("update_dungeon_list", Callable(self, "populate_dungeon_list"))
