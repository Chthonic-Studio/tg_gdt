extends Node

# Load the relevant scripts
var Status = preload("res://scripts/abilities/status.gd").new()

# Character Info
var character_id = ""
var character_first_name = ""
var character_last_name = ""
var character_gender = ""
var level = 1
var experience = 0
var age = 0

# Character Variables
var selected_race = {}
var selected_class = {}
var selected_traits = []
var selected_personality = {}
var selected_backstory = {}

# Character Statuses
var character_statuses = []

# Character Inventory
var character_inventory = []
var gold = 0

# Character Main Stats
var stats = {
	"Health": 0,
	"Mana": 0,
	"Strength": 0,
	"Agility": 0,
	"Constitution": 0,
	"Wisdom": 0,
	"Intelligence": 0,
	"Charisma": 0,
	"Adaptability": 0,
	"Tenacity": 0,
	"Loyalty": 0,
	"Ambition": 0,
	"Good": 0,
	"Evil": 0,
	"Leadership": 0,
	"Willpower": 0,
	"Luck": 0,
	"Perception": 0,
	"Morale": 0,
	"FireAffinity": 0,
	"WaterAffinity": 0,
	"EarthAffinity": 0,
	"AirAffinity": 0,
	"LightAffinity": 0,
	"DarkAffinity": 0,
	"ArcaneAffinity": 0,
	"NatureAffinity": 0,
	"PsionicAffinity": 0,
	"LightningAffinity": 0,
	"FireResistance": 0,
	"WaterResistance": 0,
	"EarthResistance": 0,
	"AirResistance": 0,
	"LightResistance": 0,
	"DarkResistance": 0,
	"ArcaneResistance": 0,
	"NatureResistance": 0,
	"LightningResistance": 0,
	"PsionicResistance": 0,
	"Armor": 0,
	"Sociability": 0,
	"Confidence": 0,
	"Empathy": 0,
	"Humor": 0,
	"Curiosity": 0,
	"Creativity": 0,
	"Discipline": 0,
	"Patience": 0,
	"Honesty": 0,
	"Bravery": 0,
	"Persuasion": 0,
	"Intimidation": 0,
	"Deception": 0,
	"Diplomacy": 0,
	"Aggression": 0,
	"Resourcefulness": 0,
	"Cunning": 0,
	"Integrity": 0,
	"Humility": 0
}

func _ready():
	# Set the name of the node
	self.name = character_first_name + " " + character_last_name + " " + character_id

func calculate_stats():
	# Calculate initial stats
	for stat in stats.keys():
		var race_value = selected_race.get("modifiers", {}).get(stat, 0)
		var class_value = selected_class.get("modifiers", {}).get(stat, 0)
		var trait_value = 0
		for selected_trait in selected_traits:
			trait_value += selected_trait.get("modifiers", {}).get(stat, 0)
		var personality_value = selected_personality.get("modifiers", {}).get(stat, 0)
		var backstory_value = selected_backstory.get("modifiers", {}).get(stat, 0)
		var status_value = 0
		for status in character_statuses:
			if status != null:
				status_value += status.get("modifiers", {}).get(stat, 0)
				
		stats[stat] = race_value + class_value + trait_value + personality_value + backstory_value + status_value

func add_experience(amount):
	var new_experience = experience + amount
	while new_experience >= level * 100:
		var excess_experience = new_experience - level * 100
		level_up()
		new_experience = excess_experience
	experience += new_experience

func level_up():
	level += 1

# Inventory management
func add_item_to_inventory(item):
	character_inventory.append(item)

func remove_item_from_inventory(item):
	character_inventory.erase(item)

func get_inventory_items():
	return character_inventory
