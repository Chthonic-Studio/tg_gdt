extends NinePatchRect

const MissionProfile = preload("res://scripts/guild/missionProfile.gd")

# Function to populate the mission details
func populate_mission_details(mission):
	print("Populating mission details for mission_id: ", mission.mission_id)  # Debug print
	$missionTitle.text = str(mission.title)
	$missionDescription.text = str(mission.description)
	$rankValue.text = str(mission.rank)
	$rewardsValue.text = format_rewards(mission.rewards)
	$acceptButton.set_meta("mission_id", mission.mission_id)
	$declineButton.set_meta("mission_id", mission.mission_id)

	$acceptButton.connect("pressed", Callable(self, "_on_accept_button_pressed"))
	$declineButton.connect("pressed", Callable(self, "_on_decline_button_pressed"))

# Function to format the rewards dictionary into a string
func format_rewards(rewards: Dictionary) -> String:
	var rewards_str = ""
	for key in rewards.keys():
		rewards_str += str(rewards[key]) + " " + key.capitalize() + ", "
	return rewards_str.trim_suffix(", ")

# Function to handle accept button press
func _on_accept_button_pressed():
	var mission_id = $acceptButton.get_meta("mission_id")
	print("Accept button pressed for mission_id: ", mission_id)
	if mission_id:
		GameManager.update_mission_status(mission_id, MissionProfile.MissionStatus.WAITING_FOR_ADVENTURERS)
		GameManager.emit_signal("update_mission_list", GameManager.missions)
		GameManager.emit_signal("update_active_mission_list", GameManager.active_missions)

# Function to handle decline button press
func _on_decline_button_pressed():
	var mission_id = $declineButton.get_meta("mission_id")
	print("Decline button pressed for mission_id: ", mission_id)
	if mission_id:
		GameManager.remove_mission(mission_id)
		GameManager.emit_signal("update_mission_list", GameManager.missions)
