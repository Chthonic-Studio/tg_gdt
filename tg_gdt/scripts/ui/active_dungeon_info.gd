extends ScrollContainer

# Preload DungeonProfile for accessing the enum values
const DungeonProfile = preload("res://scripts/guild/dungeonProfile.gd")
var InProgressDungeonListItemScene = preload("res://active_dungeon.tscn")

# Mapping of enum values to status strings
var status_map = {
	DungeonProfile.DungeonStatus.LISTED: "Listed",
	DungeonProfile.DungeonStatus.DUNGEON_BREAK: "Dungeon Break",
	DungeonProfile.DungeonStatus.WAITING_FOR_ADVENTURERS: "Waiting for Adventurers",
	DungeonProfile.DungeonStatus.SCOUTING: "Scouting",
	DungeonProfile.DungeonStatus.EXPLORATION: "Exploration",
	DungeonProfile.DungeonStatus.MEASUREMENT: "Measurement",
	DungeonProfile.DungeonStatus.CLEARING: "Clearing",
	DungeonProfile.DungeonStatus.BOSS_ROOM: "Boss Room"
}

# Reference to the VBoxContainer
@onready var in_progress_dungeon_list_vbox = $activeDungeonListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in in_progress_dungeon_list_vbox.get_children():
		in_progress_dungeon_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the in-progress dungeon list
func populate_in_progress_dungeon_list(in_progress_dungeons):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of in-progress dungeons
	for dungeon in in_progress_dungeons:
		# Instantiate a new in_progress_dungeon_list_item
		var in_progress_dungeon_list_item = InProgressDungeonListItemScene.instantiate()

		# Populate the fields with the dungeon's information
		in_progress_dungeon_list_item.get_node("dungeonTitle").text = dungeon.title
		in_progress_dungeon_list_item.get_node("dungeonDescription").text = dungeon.description
		in_progress_dungeon_list_item.get_node("rankValue").text = dungeon.rank
		in_progress_dungeon_list_item.get_node("rewardsValue").text = format_rewards(dungeon.rewards)
		in_progress_dungeon_list_item.get_node("statusValue").text = status_map[dungeon.status]  # Map the status value to string

		# Add the in_progress_dungeon_list_item to the VBoxContainer
		in_progress_dungeon_list_vbox.add_child(in_progress_dungeon_list_item)

# Function to format the rewards dictionary into a string
func format_rewards(rewards: Dictionary) -> String:
	var rewards_str = ""
	for key in rewards.keys():
		rewards_str += str(rewards[key]) + " " + key.capitalize() + ", "
	return rewards_str.trim_suffix(", ")

# Connect to the DungeonManager's update_in_progress_dungeon_list signal
func _ready():
	DungeonManager.connect("update_in_progress_dungeon_list", Callable(self, "populate_in_progress_dungeon_list"))
