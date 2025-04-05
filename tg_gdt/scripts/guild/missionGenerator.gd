extends Node

# Function to generate a unique mission
func generate_mission() -> Node:
	var mission = preload("res://scripts/guild/missionProfile.gd").new()
	
	mission.mission_id = str(Globals.get_next_mission_id())  # Assign the mission ID
	print("Generating mission with ID: ", mission.mission_id)  # Debug print
	
	mission.title = get_random_title()
	mission.description = get_random_description()
	mission.rank = get_random_rank()
	mission.rewards = generate_rewards()
	
	return mission

# Function to get a random title from a predefined list
func get_random_title() -> String:
	var titles = ["Rescue the Villagers", "Defeat the Bandits", "Retrieve the Artifact", "Escort the Merchant"]
	return titles[randi() % titles.size()]

# Function to get a random description from a predefined list
func get_random_description() -> String:
	var descriptions = [
		"Travel to the village and rescue the captured villagers.",
		"Defeat the bandits terrorizing the countryside.",
		"Retrieve the ancient artifact from the ruins.",
		"Escort the merchant safely to the neighboring town."
	]
	return descriptions[randi() % descriptions.size()]

# Function to get a random rank from a predefined list
func get_random_rank() -> String:
	var ranks = ["E", "D", "C", "B", "A", "S"]
	return ranks[randi() % ranks.size()]

# Function to generate random rewards
func generate_rewards() -> Dictionary:
	var rewards = {
		"gold": randi_range(50, 200),
		"reputation": randi_range(5, 20),
		"prestige": randi_range(1, 10),
		"influence": randi_range(5, 15)
	}
	return rewards
