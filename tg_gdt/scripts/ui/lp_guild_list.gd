extends MarginContainer

# Reference to the GridContainer
@onready var grid_container = $guildWorkersGrid

# Function to remove all children from the GridContainer
func clear_grid_container():
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free()

# Function to load guild worker cards
func load_guild_worker_cards():
	clear_grid_container()
	var guild_workers = GameManager.get_guild_workers()
	for worker in guild_workers:
		var guild_worker_card = GameManager.GuildWorkerCardScene.instantiate()
		
		guild_worker_card.get_node("workerName").text = worker.full_name
		guild_worker_card.get_node("jobPosition").text = worker.position
		guild_worker_card.get_node("afinityValue").text = worker.affinity
		guild_worker_card.get_node("moodValue").text = worker.mood
		guild_worker_card.get_node("skillValue").text = worker.skill_level
		guild_worker_card.get_node("ageValue").text = str(worker.age)
		
		grid_container.add_child(guild_worker_card)

# Call the function to load guild worker cards when the node is ready
func _ready():
	load_guild_worker_cards()
