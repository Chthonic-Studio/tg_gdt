extends ScrollContainer

# Preload MissionProfile for accessing the enum values
const MissionProfile = preload("res://scripts/guild/missionProfile.gd")
var ActiveMissionListItemScene = preload("res://active_mission.tscn")

# Mapping of enum values to status strings
var status_map = {
	MissionProfile.MissionStatus.LISTED: "Listed",
	MissionProfile.MissionStatus.WAITING_FOR_ADVENTURERS: "Waiting for Adventurers",
	MissionProfile.MissionStatus.IN_PROGRESS: "In Progress"
}

# Reference to the VBoxContainer
@onready var active_mission_list_vbox = $activeMissionsListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in active_mission_list_vbox.get_children():
		active_mission_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the active mission list
func populate_active_mission_list(active_missions):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of active missions
	for mission in active_missions:
		# Instantiate a new active_mission_list_item
		var active_mission_list_item = ActiveMissionListItemScene.instantiate()

		# Populate the fields with the mission's information
		active_mission_list_item.get_node("missionTitle").text = mission.title
		active_mission_list_item.get_node("missionDescription").text = mission.description
		active_mission_list_item.get_node("rankValue").text = mission.rank
		active_mission_list_item.get_node("rewardsValue").text = format_rewards(mission.rewards)
		active_mission_list_item.get_node("statusValue").text = status_map[mission.status]  # Map the status value to string

		# Add the active_mission_list_item to the VBoxContainer
		active_mission_list_vbox.add_child(active_mission_list_item)

# Function to format the rewards dictionary into a string
func format_rewards(rewards: Dictionary) -> String:
	var rewards_str = ""
	for key in rewards.keys():
		rewards_str += str(rewards[key]) + " " + key.capitalize() + ", "
	return rewards_str.trim_suffix(", ")

# Connect to the GameManager's update_active_mission_list signal
func _ready():
	GameManager.connect("update_active_mission_list", Callable(self, "populate_active_mission_list"))
