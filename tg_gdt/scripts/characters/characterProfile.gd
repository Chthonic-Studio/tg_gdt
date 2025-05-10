extends Node2D

# Load the relevant scripts
var Status = preload("res://scripts/abilities/status.gd").new()
var Message = preload("res://scripts/guild/message.gd")

enum CharacterStatus { ACTIVE, RETIRED, DECEASED }

# Character Info
var character_id = ""
var character_first_name : String = ""
var character_last_name : String = ""
var character_gender : String  = ""
var character_title : String = ""
var level : int = 1
var experience : int = 0
var age : int = 0
var character_status = CharacterStatus.ACTIVE
var character_fullName : String = ""
var character_avatar = "res://assets/avatars/test_humanavatar.png"
var missions_completed : int = 0
var rank : String = "E"
var guild_eval : String = "Guild Evaluation"
var guild_trust : int = 0

# Character Variables
var selected_race = {}
var selected_class = {}
var selected_traits = []
var selected_personality = {}
var selected_backstory = {}

# Character Statuses
var character_statuses = []

# Character Party
var party : String = "No Party"

# Character relationships dictionary: The key is the other character's ID.
# The value is a dictionary: {"value": float, "title": String}
var relationships = {}


var gold : int = 0

# Character relationships
var relationships = {}

# This will store the couple's character_id once a couple is formed.
var couple = null

# AI Variables
enum AIState { IDLE, PERFORMING_ACTION, WAITING_FOR_MISSION }

var ai_state: int = AIState.IDLE
var isJoiningMission: bool = false

var ai_variables = {
	"Stress": 0,
	"Comfort": 0,
	"Loneliness": 0,
	"Fatigue": 0,
	"Mood": 0,
	"isHurt": false
}

var faithClass: bool = true

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

# Dictionary mapping behavior stats to their positive and negative word sets
var behavior_mapping = {
	"Sociability": {
		"positive": { "noun": "Socialite", "adjective": "Outgoing" },
		"negative": { "noun": "Loner", "adjective": "Reclusive" }
	},
	"Confidence": {
		"positive": { "noun": "Leader", "adjective": "Confident" },
		"negative": { "noun": "Doubter", "adjective": "Insecure" }
	},
	"Empathy": {
		"positive": { "noun": "Healer", "adjective": "Compassionate" },
		"negative": { "noun": "Callous", "adjective": "Unfeeling" }
	},
	"Humor": {
		"positive": { "noun": "Jester", "adjective": "Witty" },
		"negative": { "noun": "Gloom", "adjective": "Dour" }
	},
	"Curiosity": {
		"positive": { "noun": "Explorer", "adjective": "Inquisitive" },
		"negative": { "noun": "Skeptic", "adjective": "Uninterested" }
	},
	"Creativity": {
		"positive": { "noun": "Creator", "adjective": "Innovative" },
		"negative": { "noun": "Copycat", "adjective": "Unimaginative" }
	},
	"Discipline": {
		"positive": { "noun": "Strategist", "adjective": "Disciplined" },
		"negative": { "noun": "Drifter", "adjective": "Undisciplined" }
	},
	"Patience": {
		"positive": { "noun": "Sage", "adjective": "Patient" },
		"negative": { "noun": "Impatient", "adjective": "Rushed" }
	},
	"Honesty": {
		"positive": { "noun": "Truthseeker", "adjective": "Honest" },
		"negative": { "noun": "Deceiver", "adjective": "Dishonest" }
	},
	"Bravery": {
		"positive": { "noun": "Adventurer", "adjective": "Brave" },
		"negative": { "noun": "Craven", "adjective": "Cowardly" }
	},
	"Persuasion": {
		"positive": { "noun": "Orator", "adjective": "Persuasive" },
		"negative": { "noun": "Mumbler", "adjective": "Ineffectual" }
	},
	"Intimidation": {
		"positive": { "noun": "Enforcer", "adjective": "Formidable" },
		"negative": { "noun": "Weakling", "adjective": "Timid" }
	},
	"Deception": {
		"positive": { "noun": "Schemer", "adjective": "Cunning" },
		"negative": { "noun": "Naïf", "adjective": "Transparent" }
	},
	"Diplomacy": {
		"positive": { "noun": "Ambassador", "adjective": "Tactful" },
		"negative": { "noun": "Bystander", "adjective": "Inept" }
	},
	"Aggression": {
		"positive": { "noun": "Warlord", "adjective": "Fierce" },
		"negative": { "noun": "Peacemaker", "adjective": "Passive" }
	},
	"Resourcefulness": {
		"positive": { "noun": "Survivor", "adjective": "Resourceful" },
		"negative": { "noun": "Dependent", "adjective": "Inept" }
	},
	"Cunning": {
		"positive": { "noun": "Schemer", "adjective": "Shrewd" },
		"negative": { "noun": "Bumbler", "adjective": "Naïve" }
	},
	"Integrity": {
		"positive": { "noun": "Paragon", "adjective": "Principled" },
		"negative": { "noun": "Turncoat", "adjective": "Corrupt" }
	},
	"Humility": {
		"positive": { "noun": "Servant", "adjective": "Humble" },
		"negative": { "noun": "Boaster", "adjective": "Arrogant" }
	},
	"Adaptability": {
		"positive": { "noun": "Chameleon", "adjective": "Flexible" },
		"negative": { "noun": "Rigid", "adjective": "Inflexible" }
	},
	"Tenacity": {
		"positive": { "noun": "Fighter", "adjective": "Tenacious" },
		"negative": { "noun": "Quitter", "adjective": "Weak" }
	},
	"Loyalty": {
		"positive": { "noun": "Ally", "adjective": "Loyal" },
		"negative": { "noun": "Traitor", "adjective": "Fickle" }
	},
	"Ambition": {
		"positive": { "noun": "Visionary", "adjective": "Ambitious" },
		"negative": { "noun": "Drifter", "adjective": "Aimless" }
	},
	"Good": {
		"positive": { "noun": "Saint", "adjective": "Virtuous" },
		"negative": { "noun": "Sinner", "adjective": "Corrupt" }
	},
	"Evil": {
		"positive": { "noun": "Villain", "adjective": "Sinister" },
		"negative": { "noun": "Martyr", "adjective": "Selfless" }
	},
	"Leadership": {
		"positive": { "noun": "Captain", "adjective": "Commanding" },
		"negative": { "noun": "Follower", "adjective": "Weak" }
	},
	"Willpower": {
		"positive": { "noun": "Rock", "adjective": "Resolute" },
		"negative": { "noun": "Wisp", "adjective": "Fragile" }
	},
	"Luck": {
		"positive": { "noun": "Fortune", "adjective": "Lucky" },
		"negative": { "noun": "Misfortune", "adjective": "Cursed" }
	},
	"Perception": {
		"positive": { "noun": "Seer", "adjective": "Keen" },
		"negative": { "noun": "Oblivious", "adjective": "Dull" }
	},
	"Morale": {
		"positive": { "noun": "Optimist", "adjective": "Cheerful" },
		"negative": { "noun": "Dreary", "adjective": "Forlorn" }
	}
}

func _ready():
	# Set the name of the node
	set_character_id()
	self.name = character_first_name + " " + character_last_name + " " + character_id
	character_fullName = character_first_name + " " + character_last_name
	
	# Connect to the year_passed signal from TimeManager
	TimeManager.connect("year_passed", Callable(self, "_on_year_passed"))

func set_character_id():
	character_id = str(self.get_instance_id())

func calculate_stats():
	# Define base values for primary stats; for new stats not listed here, default to 0.
	# You can adjust these base values as needed.
	var base_values = {
	"Health": 0,
	"Mana": 0,
	"Strength": 0,
	"Agility": 0,
	"Constitution": 0,
	"Wisdom": 0,
	"Intelligence": 0,
	"Charisma": 0,
	"Adaptability": randi_range(-30, 30),
	"Tenacity": randi_range(-30, 30),
	"Loyalty": randi_range(-30, 30),
	"Ambition": randi_range(-30, 30),
	"Good": randi_range(-30, 30),
	"Evil": randi_range(-30, 30),
	"Leadership": randi_range(-30, 30),
	"Willpower": randi_range(-30, 30),
	"Luck": randi_range(-30, 30),
	"Perception": randi_range(-30, 30),
	"Morale": randi_range(-30, 30),
	"FireAffinity": randi_range(-30, 30),
	"WaterAffinity": randi_range(-30, 30),
	"EarthAffinity": randi_range(-30, 30),
	"AirAffinity": randi_range(-30, 30),
	"LightAffinity": randi_range(-30, 30),
	"DarkAffinity": randi_range(-30, 30),
	"ArcaneAffinity": randi_range(-30, 30),
	"NatureAffinity": randi_range(-30, 30),
	"PsionicAffinity": randi_range(-30, 30),
	"LightningAffinity": randi_range(-30, 30),
	"FireResistance": randi_range(-30, 30),
	"WaterResistance": randi_range(-30, 30),
	"EarthResistance": randi_range(-30, 30),
	"AirResistance": randi_range(-30, 30),
	"LightResistance": randi_range(-30, 30),
	"DarkResistance": randi_range(-30, 30),
	"ArcaneResistance": randi_range(-30, 30),
	"NatureResistance": randi_range(-30, 30),
	"LightningResistance": randi_range(-30, 30),
	"PsionicResistance": randi_range(-30, 30),
	"Armor": randi_range(-30, 30),
	"Sociability": randi_range(-30, 30),
	"Confidence": randi_range(-30, 30),
	"Empathy": randi_range(-30, 30),
	"Humor": randi_range(-30, 30),
	"Curiosity": randi_range(-30, 30),
	"Creativity": randi_range(-30, 30),
	"Discipline": randi_range(-30, 30),
	"Patience": randi_range(-30, 30),
	"Honesty": randi_range(-30, 30),
	"Bravery": randi_range(-30, 30),
	"Persuasion": randi_range(-30, 30),
	"Intimidation": randi_range(-30, 30),
	"Deception": randi_range(-30, 30),
	"Diplomacy": randi_range(-30, 30),
	"Aggression": randi_range(-30, 30),
	"Resourcefulness": randi_range(-30, 30),
	"Cunning": randi_range(-30, 30),
	"Integrity": randi_range(-30, 30),
	"Humility": randi_range(-30, 30)
	}
	
	# Loop through all keys in the stats dictionary (including new ones)
	for stat in stats.keys():
		var base_value = base_values.get(stat, 0)
		var race_value = selected_race.get("modifiers", {}).get(stat, 0)
		# Use generated class stats instead of raw modifiers
		var class_value = selected_class.get("generated_stats", {}).get(stat, 0)
		var trait_value = 0
		for selected_trait in selected_traits:
			trait_value += selected_trait.get("modifiers", {}).get(stat, 0)
		var personality_value = selected_personality.get("modifiers", {}).get(stat, 0)
		var backstory_value = selected_backstory.get("modifiers", {}).get(stat, 0)
		var status_value = 0
		for status in character_statuses:
			if status != null:
				status_value += status.get("modifiers", {}).get(stat, 0)
				
		stats[stat] = base_value + race_value + class_value + trait_value + personality_value + backstory_value + status_value

	# Recompute guild evaluation after stats are set
	compute_guild_eval()

func compute_guild_eval():
	# List of behavior stats to consider for guild evaluation.
	var behavior_stats = [
		"Sociability", "Confidence", "Empathy", "Humor", "Curiosity", "Creativity",
		"Discipline", "Patience", "Honesty", "Bravery", "Persuasion", "Intimidation",
		"Deception", "Diplomacy", "Aggression", "Resourcefulness", "Cunning", "Integrity",
		"Humility", "Adaptability", "Tenacity", "Loyalty", "Ambition", "Good", "Evil",
		"Leadership", "Willpower", "Luck", "Perception", "Morale"
	]
	
	# Instead of sorting, find the highest and second-highest by absolute value.
	var highest = null
	var second_highest = null
	
	for stat in behavior_stats:
		var value = stats.get(stat, 0)
		# Create a dictionary to store stat name and its value.
		var current = {"name": stat, "value": value}
		if highest == null or abs(current["value"]) > abs(highest["value"]):
			second_highest = highest
			highest = current
		elif second_highest == null or abs(current["value"]) > abs(second_highest["value"]):
			second_highest = current
	
	# Use the two highest values to compute guild evaluation.
	if highest != null and second_highest != null:
		var high_mapping = behavior_mapping.get(highest["name"], null)
		var second_mapping = behavior_mapping.get(second_highest["name"], null)
		
		if high_mapping != null and second_mapping != null:
			var high_noun = high_mapping["positive"]["noun"] if highest["value"] >= 0 else high_mapping["negative"]["noun"]
			var second_adj = second_mapping["positive"]["adjective"] if second_highest["value"] >= 0 else second_mapping["negative"]["adjective"]
			guild_eval = second_adj + " " + high_noun
		else:
			guild_eval = "Undefined"
	else:
		guild_eval = "Undefined"

func add_experience(amount):
	var new_experience = experience + amount
	while new_experience >= level * 100:
		var excess_experience = new_experience - level * 100
		level_up()
		new_experience = excess_experience
	experience += new_experience

func level_up():
	level += 1
	# For each primary stat, 33% chance to increase by 1
	for stat in ["Strength", "Agility", "Constitution", "Wisdom", "Intelligence", "Charisma"]:
		if randf() < 0.33:
			stats[stat] += 1
	
	# Increase Health and Mana by a random amount between 1 and 5
	stats["Health"] += randi() % 5 + 1
	stats["Mana"] += randi() % 5 + 1

# Inventory management
func add_item_to_inventory(item):
	character_inventory.append(item)

func remove_item_from_inventory(item):
	character_inventory.erase(item)

func get_inventory_items():
	return character_inventory

# Signaling functions
# Function to simulate adventurer support request
func simulate_adventurer_support():
	var requested_item = "gold"
	GameManager.add_message(Message.MessageType.ADVENTURER_SUPPORT, {"adventurer_name": character_fullName, "requested_item": requested_item})

# Function to simulate adventurer updates
func simulate_adventurer_updates():
	GameManager.add_message(Message.MessageType.ADVENTURER_UPDATES)

# Function to handle year passing and update the character's age
func _on_year_passed(new_year: int):
	age += 1


# RELATIONSHIP FUNCTIONS 

# Adjust the numeric relationship value with another character.
func adjust_relationship(other_id: String, delta: float) -> void:
	if relationships.has(other_id):
		relationships[other_id]["value"] = clamp( relationships[other_id]["value"] + delta, -100, 100)
	else:
		# Initialize with the given delta and a default title (for instance, "Acquaintance")
		relationships[other_id] = {"value": clamp(delta, -100, 100), "title": "Acquaintance"}

# Increase relationship value.
func increase_relationship(other_id: String, amount: float) -> void:
	adjust_relationship(other_id, amount)

# Decrease relationship value.
func decrease_relationship(other_id: String, amount: float) -> void:
	adjust_relationship(other_id, -amount)

# Set the relationship title for this character with another character.
# Note: This function only updates the title for the current character.
func set_relationship_title(other_id: String, new_title: String) -> void:
	if relationships.has(other_id):
		relationships[other_id]["title"] = new_title
	else:
		# If no relationship yet, initialize it with a default numeric value of 0.
		relationships[other_id] = {"value": 0, "title": new_title}

# Optional: a getter function to retrieve a relationship record.
func get_relationship(other_id: String) -> Dictionary:
	if relationships.has(other_id):
		return relationships[other_id]
	return {}

# For debugging, prints all relationships.
func print_relationships() -> void:
	for other_id in relationships.keys():
		print("Relationship with ", other_id, ": ", relationships[other_id])


######### AI Functionalities #########


## Update AI Behavior Variables

func update_ai_variables():
	ai_variables["Stress"] = clamp(ai_variables["Fatigue"] * 0.4 - ai_variables["Mood"] * 0.1 + ai_variables["Loneliness"] * 0.1, 0, 100)
	ai_variables["Comfort"] = clamp(30 - ai_variables["Stress"] * 0.3 + ai_variables["Mood"] * 0.1, 0, 100)
	ai_variables["Loneliness"] = clamp(ai_variables["Sociability"] * 0.2 - ai_variables["Mood"] * 0.1 + randi() % 15 + 1, 0, 100)
	ai_variables["Mood"] = clamp(ai_variables["Morale"] * 0.3 + randi() % 15 + 1, 0, 100)
	return

## Called when the character finishes an action
func update_ai_after_action():
	if isJoiningMission:
		ai_state = AIState.WAITING_FOR_MISSION
	else:
		ai_state = AIState.IDLE
		# Optionally recalculate chance for new action here


# New routine to update fatigue daily regardless of actions.
func update_fatigue_daily():
	# Increase fatigue by 0.1 per day.
	ai_variables["Fatigue"] += 0.1
	ai_variables["Fatigue"] = clamp(ai_variables["Fatigue"], 0, 100)

## Call this function when the character goes to sleep.
func reset_fatigue_on_sleep():
	ai_variables["Fatigue"] = 100

func toggle_isHurt():
	if (ai_variables["isHurt"] == true):
		ai_variables["isHurt"] = false
	else:
		ai_variables["isHurt"] = true
