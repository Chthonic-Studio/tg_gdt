extends Node2D

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
func add_member(character):
	if character not in members:
		members.append(character)
        member_count += 1

# Remove a character from the party
func remove_member(character):
	if character in members:
		members.erase(character)
        member_count -= 1

# Get the list of party members
func get_members() -> Array:
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
