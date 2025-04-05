extends Node

var mission_counter: int = 0

# Function to get the next mission ID
func get_next_mission_id() -> int:
	mission_counter += 1
	return mission_counter

func _ready():
	print("Globals script initialized")
	randomize()  # Initialize random number generator
