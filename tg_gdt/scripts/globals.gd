extends Node

var mission_counter: int = 0

# Function to get the next mission ID
func get_next_mission_id() -> int:
	mission_counter += 1
	return mission_counter

func _ready():
	print("Globals script initialized")
	randomize()  # Initialize random number generator


# Function to pause the game
func pause_game():
	TimeManager.pause_game()

# Function to set normal speed
func normal_speed():
	TimeManager.normal_speed()

# Function to set double speed
func double_speed():
	TimeManager.double_speed()
