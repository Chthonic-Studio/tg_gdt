extends ScrollContainer

var MissionListItemScene = preload("res://mission.tscn")
var MissionProfile = preload("res://scripts/guild/missionProfile.gd")  # Preload the MissionProfile script

@onready var mission_list_vbox = $missionsListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in mission_list_vbox.get_children():
		mission_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the mission list
func populate_mission_list(missions):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of missions
	for mission in missions:
		print("Creating mission list item for mission_id: ", mission.mission_id)  # Debug print
		# Instantiate a new mission_list_item
		var mission_list_item = MissionListItemScene.instantiate()

		# Populate the mission_list_item with the mission's information
		mission_list_item.populate_mission_details(mission)

		# Add the mission_list_item to the VBoxContainer
		mission_list_vbox.add_child(mission_list_item)

# Connect to the GameManager's update_mission_list signal
func _ready():
	GameManager.connect("update_mission_list", Callable(self, "populate_mission_list"))
