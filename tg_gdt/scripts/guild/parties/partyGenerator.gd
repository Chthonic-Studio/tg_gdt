extends Node

# Load the PartyProfile scene
var PartyProfileScene = preload("res://party.tscn")

# List of 10 possible party names
var party_names = [
	"The Bravehearts",
	"Shadow Strikers",
	"Mystic Warriors",
	"Dragon Slayers",
	"Storm Chasers",
	"Phoenix Force",
	"Silver Rangers",
	"Thunder Guardians",
	"Crimson Crusaders",
	"Golden Griffins"
]

# Function to generate a unique party
func generate_party(party_name: String = "") -> Node2D:
	var party = PartyProfileScene.instantiate() as Node2D
	
	party_name = get_random_party_name()
	
	party.party_name = party_name
	party.missions_completed = 0
	party.party_rank = "E"
	party.party_log = []
	party.members = []

	# Set the name of the node
	party.name = party_name

	return party

# Function to get a random party name from the list
func get_random_party_name() -> String:
	var random_index = randi() % party_names.size()
	return party_names[random_index]

# Function to add a character to a party
func add_character_to_party(party: Node2D, character: Node2D):
	party.add_member(character)

# Function to remove a character from a party
func remove_character_from_party(party: Node2D, character: Node2D):
	party.remove_member(character)

# Function to log an entry in the party's log
func log_entry(party: Node2D, entry: String):
	party.add_log_entry(entry)

# Function to complete a mission for the party
func complete_mission(party: Node2D):
	party.complete_mission()

# Function to set the party rank
func set_party_rank(party: Node2D, rank: String):
	party.set_rank(rank)
