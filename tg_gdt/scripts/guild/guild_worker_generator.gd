extends Node

# Load the attribute scripts
var Gender = preload("res://scripts/characters/gender.gd").new()
var Race = preload("res://scripts/characters/races.gd").new()
var Personality = preload("res://scripts/characters/personality.gd").new()
var Names = preload("res://scripts/characters/names.gd").new()

# Define the positions
var positions = ["Blacksmith", "Apothecary", "Trainer", "Mage", "Receptionist", "Scout"]

# Define the attributes
var affinities = ["Natural", "Good", "High"]
var moods = ["Happy", "Neutral", "Sad"]
var skill_levels = ["Beginner", "Intermediate", "Advanced"]

# Function to generate a unique guild worker
func generate_guild_worker(position: String) -> Dictionary:
	var worker = {}
	
	worker.position = position
	worker.gender = Gender.get_random_gender()
	worker.race = Race.get_random_race()
	worker.personality = Personality.get_random_personality()
	worker.first_name = Names.generate_first_name(worker.race["name"], worker.gender)
	worker.last_name = Names.generate_last_name(worker.race["name"])
	worker.full_name = worker.first_name + " " + worker.last_name
	worker.age = randi_range(20, 40)
	worker.affinity = affinities[randi() % affinities.size()]
	worker.mood = moods[randi() % moods.size()]
	worker.skill_level = skill_levels[randi() % skill_levels.size()]

	return worker
