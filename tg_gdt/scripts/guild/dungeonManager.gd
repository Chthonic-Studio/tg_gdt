extends Node

var available_dungeons: Array = []
var active_dungeons: Array = []
var in_progress_dungeons: Array = []

# Load the DungeonProfile script
const DungeonProfile = preload("res://scripts/guild/dungeonProfile.gd")

# Define the signals
signal update_dungeon_list(active_dungeons: Array)
signal update_in_progress_dungeon_list(in_progress_dungeons: Array)

func _ready():
	# Initialize the available dungeons
	available_dungeons = create_dungeons()
	print("Available dungeons initialized: ", available_dungeons.size())
	for dungeon in available_dungeons:
		print("Dungeon ID: ", dungeon.dungeon_id, " Title: ", dungeon.title)
	print("DungeonManager is ready.")

# Function to create dungeons
func create_dungeons() -> Array:
	print("Creating dungeons")
	return [
		create_dungeon("1", "The Dark Forest", "Explore the haunted forest and clear out the monsters.", "B", {"gold": 100, "influence": 10}, ["Enter the forest", "Clear monsters", "Find the hidden treasure"]),
		create_dungeon("2", "Cave of Wonders", "Discover the secrets hidden in the cave.", "A", {"gold": 200, "prestige": 20}, ["Enter the cave", "Avoid traps", "Retrieve the artifact"]),
		create_dungeon("3", "Ancient Ruins", "Uncover the mysteries of the ancient ruins.", "S", {"gold": 300, "reputation": 30}, ["Enter the ruins", "Solve the puzzles", "Defeat the guardian"]),
		# Add more dungeons as needed
	]

# Helper function to create a dungeon
func create_dungeon(id: String, title: String, description: String, rank: String, rewards: Dictionary, stages: Array) -> DungeonProfile:
	print("Creating dungeon with ID: ", id)
	var dungeon = DungeonProfile.new()
	dungeon.init(id, title, description, rank, rewards, stages)
	print("Dungeon created: ", dungeon.title)
	return dungeon

# Function to activate a random dungeon
func activate_random_dungeon():
	print("Attempting to activate a random dungeon. Available dungeons: ", available_dungeons.size())
	if available_dungeons.size() == 0:
		print("No available dungeons to activate.")
		return null

	var random_index = randi() % available_dungeons.size()
	var dungeon = available_dungeons[random_index]
	available_dungeons.remove_at(random_index)  # Corrected: use remove_at to remove the element at the index
	active_dungeons.append(dungeon)
	emit_signal("update_dungeon_list", active_dungeons)
	print("Dungeon activated: ", dungeon.title)
	return dungeon

# Function to get the list of active dungeons
func get_active_dungeons() -> Array:
	return active_dungeons

# Function to update the status of a dungeon
func update_dungeon_status(dungeon_id: String, new_status: int):
	for dungeon in active_dungeons:
		if dungeon.dungeon_id == dungeon_id:
			dungeon.status = new_status
			if new_status == DungeonProfile.DungeonStatus.WAITING_FOR_ADVENTURERS:
				active_dungeons.erase(dungeon)
				in_progress_dungeons.append(dungeon)
				emit_signal("update_dungeon_list", active_dungeons)
				emit_signal("update_in_progress_dungeon_list", in_progress_dungeons)
				return
			if new_status == DungeonProfile.DungeonStatus.BOSS_ROOM:
				active_dungeons.erase(dungeon)
				emit_signal("update_dungeon_list", active_dungeons)
				return

# Function to refresh the in-progress dungeon list
func refresh_in_progress_dungeon_list():
	emit_signal("update_in_progress_dungeon_list", in_progress_dungeons)
