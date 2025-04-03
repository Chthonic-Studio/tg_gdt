extends Node2D

class_name Party

# Party Info
var party_name : String = ""
var party_rank : String = "E"
var missions_completed : int = 0
var party_log : Array = []
var member_count: int = 0
var guild_eval: String = "Placeholder Eval"

# Party Members
var members : Array = []

func _ready():
	# Set the name of the node
	self.name = party_name

# Add a character to the party
func add_member(character_id: String):
	print("Attempting to add member with ID:", character_id)
	if character_id not in members:
		members.append(character_id)
		member_count += 1
		print("Added member with ID:", character_id, "to party:", self.party_name)
	else:
		print("Member already in party with ID:", character_id)

# Remove a character from the party
func remove_member(character_id: String):
	print("Attempting to remove member with ID:", character_id)
	if character_id in members:
		members.erase(character_id)
		member_count -= 1
		print("Removed member with ID:", character_id, "from party:", self.party_name)
	else:
		print("Member not in party with ID:", character_id)

# Get the list of party members (by ID)
func get_member_ids() -> Array:
	return members

# Log a new entry
func add_log_entry(entry: String):
	party_log.append(entry)

# Get the party log
func get_log() -> Array:
	return party_log

# Increment missions completed
func complete_mission():
	missions_completed += 1

# Get the number of missions completed
func get_missions_completed() -> int:
	return missions_completed

# Set the party rank
func set_rank(rank: String):
	party_rank = rank

# Get the party rank
func get_rank() -> String:
	return party_rank
