extends Node

var CharacterGenerator = preload("res://scripts/characters/characterGenerator.gd").new()
var PartyGenerator = preload("res://scripts/guild/parties/partyGenerator.gd").new()
var GuildWorkerGenerator = preload("res://scripts/guild/guild_worker_generator.gd").new()
var GuildWorkerCardScene = preload("res://guild_worker_card.tscn")
var MissionGenerator = preload("res://scripts/guild/missionGenerator.gd").new()
var MissionProfile = preload("res://scripts/guild/missionProfile.gd")
var MessageGenerator = preload("res://scripts/guild/messageGenerator.gd").new()
var Message = preload("res://scripts/guild/message.gd")

# Define player stats
var gold: int = 300
var reputation: int = 0
var leadership: int = 0
var wisdom: int = 0
var charisma: int = 0
var resources: int = 0
var morale: int = 0
var influence: int = 0
var adventurer_support: int = 0
var guild_prestige: int = 0
var security: int = 0

# Define guild building stats
var tavern_level: int = 1
var tavern_status: String = "Rundown"
var training_grounds_level: int = 1
var training_grounds_status: String = "Rundown"
var forge_level: int = 1
var forge_status: String = "Rundown"
var apothecary_level: int = 1
var apothecary_status: String = "Rundown"
var cartography_level: int = 1
var cartography_status: String = "Rundown"
var enchantment_level: int = 1
var enchantment_status: String = "Rundown"
var guild_tavern_income: int = 100
var guild_forge_income: int = 100
var cartographer_table_income: int = 100
var training_grounds_income: int = 100
var apothecary_income: int = 100
var enchantment_table_income: int = 100

# Define operating costs and workers
var tavern_workers: int = 2
var training_grounds_workers: int = 2
var forge_workers: int = 2
var apothecary_workers: int = 2
var cartography_workers: int = 2
var enchantment_workers: int = 2
var operating_costs: int = 0

# Define global bool variables
var noGold: bool = false
var noResources: bool = false
var initial_guild_workers_assigned: bool = false

# List to keep track of all characters
var preload_characters = []
var characters = []
var retired_characters = []
var dead_characters = []

# List to keep track of all parties
var parties = []

# List to keep track of all guild workers
var guild_workers = []

# List to keep track of missions
var missions = []
var active_missions = []

# List to keep track of messages
var read_messages = []
var unread_messages = []


# Define signals
signal stat_modified # Signals a player's stat was modified
signal update_character_list # Signals there was an update in the character list
signal update_party_list # Signals there was an update in the party list
signal update_guild_worker_list # Signals there was an update in the guild worker list
signal gold_spent
signal update_mission_list
signal update_active_mission_list
signal update_dungeon_list
signal new_message_received
signal unread_message_count_changed

func _ready():
	if not initial_guild_workers_assigned:
		populate_guild_positions()
	# Connect to the year_passed signal from TimeManager
	TimeManager.connect("year_passed", Callable(self, "_on_year_passed"))

# Function to show a popup when the player doesn't have enough gold
func not_enough_gold():
	var popup = Popup.new()
	popup.popup_centered()
	popup.add_child(Label.new())
	popup.get_child(0).text = "Not enough gold"
	add_child(popup)
	popup.show()

# Updated Function: When spawning a new character, add to preload_characters and send an application message.
func _on_spawn_character():
	print("Generating new adventurer application")
	var new_character = CharacterGenerator.generate_character()
	if new_character:
		preload_characters.append(new_character)
		# Instead of only generating the message, add it using add_message:
		add_message(Message.MessageType.ADVENTURER_APPLIES, {"adventurer": new_character})
		print("Adventurer application added: ", new_character.name)
	else:
		print("Failed to generate character")

# Function called when player accepts an adventurer application.
func accept_adventurer_application(character):
	if character in preload_characters:
		preload_characters.erase(character)
		characters.append(character)
		# Add the character node to the current scene.
		get_tree().current_scene.add_child(character)
		# Update relationships between the new character and all existing ones.
		for other in characters:
			if other != character:
				if not other.relationships.has(character.character_id):
					other.relationships[character.character_id] = 0
				if not character.relationships.has(other.character_id):
					character.relationships[other.character_id] = 0
		print("Adventurer accepted: ", character.name)
		emit_signal("update_character_list", characters)

# Function called when player declines an adventurer application.
func decline_adventurer_application(character):
	if character in preload_characters:
		preload_characters.erase(character)
		print("Adventurer declined: ", character.name)
		# Remove the node from the scene and free resources.
		character.queue_free()

# Function to generate and assign guild workers
func assign_guild_workers():
	var positions = ["Blacksmith", "Apothecary", "Trainer", "Mage", "Receptionist", "Scout"]
	for position in positions:
		var worker = GuildWorkerGenerator.generate_guild_worker(position)
		guild_workers.append(worker)
	emit_signal("update_guild_worker_list", guild_workers)

# Function to get all guild workers
func get_guild_workers():
	return guild_workers

func generate_guild_worker(position: String) -> Dictionary:
	return GuildWorkerGenerator.generate_guild_worker(position)

func populate_guild_positions():
	if initial_guild_workers_assigned:
		return

	var positions = ["Blacksmith", "Apothecary", "Trainer", "Mage", "Receptionist", "Scout"]
	guild_workers.clear()
	for position in positions:
		var worker = generate_guild_worker(position)
		guild_workers.append(worker)
	
	initial_guild_workers_assigned = true
	emit_signal("update_guild_worker_list", guild_workers)

# Function to handle year passing and update the ages of guild workers
func _on_year_passed(new_year: int):
	for worker in guild_workers:
		GuildWorkerGenerator.update_guild_worker_age(worker)
	emit_signal("update_guild_worker_list", guild_workers)
	
# Function to get guild stats
func get_guild_stats():
	return {
		"tavern_level": tavern_level,
		"tavern_status": tavern_status,
		"training_grounds_level": training_grounds_level,
		"training_grounds_status": training_grounds_status,
		"forge_level": forge_level,
		"forge_status": forge_status,
		"apothecary_level": apothecary_level,
		"apothecary_status": apothecary_status,
		"cartography_level": cartography_level,
		"cartography_status": cartography_status,
		"enchantment_level": enchantment_level,
		"enchantment_status": enchantment_status,
		"guild_tavern_income": guild_tavern_income,
		"guild_forge_income": guild_forge_income,
		"cartographer_table_income": cartographer_table_income,
		"training_grounds_income": training_grounds_income,
		"apothecary_income": apothecary_income,
		"enchantment_table_income": enchantment_table_income,
		"tavern_workers": tavern_workers,
		"training_grounds_workers": training_grounds_workers,
		"forge_workers": forge_workers,
		"apothecary_workers": apothecary_workers,
		"cartography_workers": cartography_workers,
		"enchantment_workers": enchantment_workers,
		"operating_costs": operating_costs
	}

# Function to upgrade a building
func upgrade_building(building: String):
	var upgrade_costs = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
	var upgrade_levels = ["Rundown", "Basic", "Functional", "Improved", "Enhanced", "Well-Established", "Superior", "Renowned", "Magnificent", "World's Best"]
	
	match building:
		"tavern":
			if tavern_level < 10 and gold >= upgrade_costs[tavern_level - 1]:
				gold -= upgrade_costs[tavern_level - 1]
				tavern_level += 1
				tavern_status = upgrade_levels[tavern_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
		"training_grounds":
			if training_grounds_level < 10 and gold >= upgrade_costs[training_grounds_level - 1]:
				gold -= upgrade_costs[training_grounds_level - 1]
				training_grounds_level += 1
				training_grounds_status = upgrade_levels[training_grounds_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
		"forge":
			if forge_level < 10 and gold >= upgrade_costs[forge_level - 1]:
				gold -= upgrade_costs[forge_level - 1]
				forge_level += 1
				forge_status = upgrade_levels[forge_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
		"apothecary":
			if apothecary_level < 10 and gold >= upgrade_costs[apothecary_level - 1]:
				gold -= upgrade_costs[apothecary_level - 1]
				apothecary_level += 1
				apothecary_status = upgrade_levels[apothecary_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
		"cartography":
			if cartography_level < 10 and gold >= upgrade_costs[cartography_level - 1]:
				gold -= upgrade_costs[cartography_level - 1]
				cartography_level += 1
				cartography_status = upgrade_levels[cartography_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
		"enchantment":
			if enchantment_level < 10 and gold >= upgrade_costs[enchantment_level - 1]:
				gold -= upgrade_costs[enchantment_level - 1]
				enchantment_level += 1
				enchantment_status = upgrade_levels[enchantment_level - 1]
				emit_signal("gold_spent")
			else:
				not_enough_gold()
	emit_signal("stat_modified")

# Function to hire workers for a building
func hire_workers(building: String):
	var hire_cost = 50
	
	if gold >= hire_cost:
		gold -= hire_cost
		
		match building:
			"tavern":
				tavern_workers += 1
				operating_costs += 10
				guild_tavern_income += 10
			"training_grounds":
				training_grounds_workers += 1
				operating_costs += 10
				training_grounds_income += 10
			"forge":
				forge_workers += 1
				operating_costs += 10
				guild_forge_income += 10
			"apothecary":
				apothecary_workers += 1
				operating_costs += 10
				apothecary_income += 10
			"cartography":
				cartography_workers += 1
				operating_costs += 10
				cartographer_table_income += 10
			"enchantment":
				enchantment_workers += 1
				operating_costs += 10
				enchantment_table_income += 10
		emit_signal("gold_spent")
	else:
		not_enough_gold()

	emit_signal("stat_modified")

func calculate_monthly_income() -> int:
	# Sum the incomes from all buildings
	var total_income = guild_tavern_income + guild_forge_income + cartographer_table_income + training_grounds_income + apothecary_income + enchantment_table_income
	return total_income

func apply_monthly_income():
	var income = calculate_monthly_income()
	modify_gold(income)
	print("Applied monthly income: " + str(income) + " gold.")

func apply_building_cost_reduction(building: String, cost_reduction: int):
	# Implement logic to reduce building cost for the specified building
	match building:
		"tavern":
			guild_tavern_income -= cost_reduction
		"training_grounds":
			training_grounds_income -= cost_reduction
		"forge":
			guild_forge_income -= cost_reduction
		"apothecary":
			apothecary_income -= cost_reduction
		"cartography":
			cartographer_table_income -= cost_reduction
		"enchantment":
			enchantment_table_income -= cost_reduction

# Function to update the status of a character by ID
func update_character_status(character_id: String, new_status: int):
	for character in characters:
		if character.character_id == character_id:
			character.character_status = new_status
			print("Character status updated: ", character.name, " -> ", new_status)
			# Emit the signal to update the character list
			emit_signal("update_character_list", characters)
			return
	print("Character not found: ", character_id)

# Function to get a character by its ID
func get_character_by_id(character_id: String):
	for character in characters:
		if character.character_id == character_id:
			return character
	return null

# Function to modify gold
func modify_gold(value: int):
	gold += value
	if gold < 0:
		gold = 0
		noGold = true
	else:
		noGold = false
	emit_signal("stat_modified")
	emit_signal("gold_spent")
	print("Gold modified. New value: " + str(gold))

# Function to modify reputation
func modify_reputation(value: int):
	reputation += value
	reputation = clamp(reputation, -100, 100)
	emit_signal("stat_modified")
	print("Reputation modified. New value: " + str(reputation))

# Function to modify leadership
func modify_leadership(value: int):
	leadership += value
	leadership = clamp(leadership, 0, 100)
	emit_signal("stat_modified")
	print("Leadership modified. New value: " + str(leadership))

# Function to modify wisdom
func modify_wisdom(value: int):
	wisdom += value
	wisdom = clamp(wisdom, 0 , 20)
	emit_signal("stat_modified")
	print("Wisdom modified. New value: " + str(wisdom))

# Function to modify charisma
func modify_charisma(value: int):
	charisma += value
	charisma = clamp(charisma, 0, 20)
	emit_signal("stat_modified")
	print("Charisma modified. New value: " + str(charisma))

# Function to modify resources
func modify_resources(value: int):
	resources += value
	if resources < 0:
		resources = 0
		noResources = true
	else:
		noResources = false
	emit_signal("stat_modified")
	print("Resources modified. New value: " + str(resources))

# Function to modify morale
func modify_morale(value: int):
	morale += value
	morale = clamp(morale, -100, 100)
	emit_signal("stat_modified")
	print("Morale modified. New value: " + str(morale))

# Function to modify influence
func modify_influence(value: int):
	influence += value
	influence = clamp(influence, 0, 100)
	emit_signal("stat_modified")
	print("Influence modified. New value: " + str(influence))

# Function to modify adventurer support
func modify_adventurer_support(value: int):
	adventurer_support += value
	adventurer_support = clamp(adventurer_support, 0, 100)
	emit_signal("stat_modified")
	print("Adventurer support modified. New value: " + str(adventurer_support))

# Function to modify guild prestige
func modify_guild_prestige(value: int):
	guild_prestige += value
	guild_prestige = clamp(guild_prestige, 0, 100)
	emit_signal("stat_modified")
	print("Guild prestige modified. New value: " + str(guild_prestige))

# Function to modify security
func modify_security(value: int):
	security += value
	security = clamp(security, -100, 100)
	emit_signal("stat_modified")
	print("Security modified. New value: " + str(security))

# Function to get the value of a player stat
func get_stat(stat_name: String) -> int:
	match stat_name:
		"gold":
			return gold
		"reputation":
			return reputation
		"leadership":
			return leadership
		"wisdom":
			return wisdom
		"charisma":
			return charisma
		"resources":
			return resources
		"morale":
			return morale
		"influence":
			return influence
		"adventurer_support":
			return adventurer_support
		"guild_prestige":
			return guild_prestige
		"security":
			return security
		_:
			print("Stat '" + stat_name + "' does not exist.")
			return -1

# PARTY VARIABLES
# Function to create a new party
func create_party(party_name: String) -> String:
	var unique_party_name = party_name
	var counter = 1
	while get_party_by_name(unique_party_name) != null:
		unique_party_name = party_name + " " + str(counter)
		counter += 1
	print("Creating party: ", unique_party_name)
	var new_party = PartyGenerator.generate_party(unique_party_name)
	if new_party:
		parties.append(new_party)
		print("Party created: ", new_party.party_name)
		emit_signal("update_party_list", parties)
		return new_party.party_name
	else:
		print("Failed to create party")
		return ""

func add_character_to_party(character_id: String, party_name: String):
	print("Adding character with ID:", character_id, "to party:", party_name)
	for party in parties:
		print("Checking party: ", party.party_name)
		if party.party_name == party_name:
			print("Party found: ", party.party_name)
			party.add_member(character_id)
			var character = get_character_by_id(character_id)
			if character:
				character.party = party_name
			print("Character with ID:", character_id, "added to party:", party.party_name)
			emit_signal("update_party_list", parties)
			return
	print("Party not found: ", party_name)

func remove_character_from_party(character_id: String, party_name: String):
	print("Removing character with ID:", character_id, "from party:", party_name)
	for party in parties:
		print("Checking party: ", party.party_name)
		if party.party_name == party_name:
			print("Party found: ", party.party_name)
			party.remove_member(character_id)
			var character = get_character_by_id(character_id)
			if character:
				character.party = "No Party"
			print("Character with ID:", character_id, "removed from party:", party.party_name)
			emit_signal("update_party_list", parties)
			return
	print("Party not found: ", party_name)

func get_party_by_name(party_name: String):
	for party in parties:
		if party.party_name == party_name:
			return party
	return null

func test_party_creation():
	print("Debug Create Party Function Started")
	if characters.size() < 3:
		print("Not enough characters to form a party")
		return
	var random_characters = []
	while random_characters.size() < 3:
		var random_index = randi() % characters.size()
		var random_character = characters[random_index]
		if random_character not in random_characters:
			random_characters.append(random_character)
			random_character.set_character_id()
	var party_name = "Test Party"
	party_name = create_party(party_name)
	if party_name == "":
		print("Failed to create party")
		return
	for character in random_characters:
		add_character_to_party(character.character_id, party_name)
	print("Test party created with characters: ", random_characters)
	for character in random_characters:
		if character.party:
			print("Character in party:", character.character_fullName, " -> ", character.party)
		else:
			print("Character in party:", character.character_fullName, " is not assigned to any party")


# ECONOMY VARIABLES
# Function to buy an item
func buy_item(item_id: int, quantity: int) -> bool:
	var item = Items.items[item_id]
	var total_price = item.base_price * Items.item_price_modifiers[item.name] * quantity
	if gold >= total_price:
		gold -= total_price
		Items.city_wealth += total_price
		Inventory.add_item(item_id, quantity)
		Items.update_item_price(item.name, quantity)
		emit_signal("stat_modified")
		return true
	print("Not enough gold to buy item")
	return false

# Function to sell an item
func sell_item(item_id: int, quantity: int) -> bool:
	if Inventory.remove_item(item_id, quantity):
		var item = Items.items[item_id]
		var total_price = item.base_price * Items.item_price_modifiers[item.name] * quantity
		gold += total_price
		Items.city_wealth -= total_price
		Items.update_item_price(item.name, -quantity)
		emit_signal("stat_modified")
		return true
	print("Failed to remove item from inventory")
	return false


# MISSION FUNCTIONS

# Function to generate a new mission
func generate_mission():
	var mission = MissionGenerator.generate_mission()
	missions.append(mission)
	emit_signal("update_mission_list", missions)

# Function to update the status of a mission
func update_mission_status(mission_id: String, new_status: int):
	for mission in missions:
		if mission.mission_id == mission_id:
			mission.status = new_status
			if new_status in [MissionProfile.MissionStatus.WAITING_FOR_ADVENTURERS, MissionProfile.MissionStatus.IN_PROGRESS]:
				missions.erase(mission)
				active_missions.append(mission)
				emit_signal("update_mission_list", missions)
				emit_signal("update_active_mission_list", active_missions)
			return

# Function to remove a mission
func remove_mission(mission_id: String):
	for mission in missions:
		if mission.mission_id == mission_id:
			missions.erase(mission)
			emit_signal("update_mission_list", missions)
			return
	for mission in active_missions:
		if mission.mission_id == mission_id:
			active_missions.erase(mission)
			emit_signal("update_active_mission_list", active_missions)
			return

# DUNGEON FUNCTIONS

# Function to generate and activate a random dungeon
func activate_random_dungeon():
	var dungeon = DungeonManager.activate_random_dungeon()
	if dungeon:
		emit_signal("update_dungeon_list", DungeonManager.get_active_dungeons())

# Function to update the status of a dungeon
func update_dungeon_status(dungeon_id: String, new_status: int):
	DungeonManager.update_dungeon_status(dungeon_id, new_status)
	emit_signal("update_dungeon_list", DungeonManager.get_active_dungeons())


# MESSAGE FUNCTIONS

# Function to generate and add a new message
func add_message(messageType, extra_info = {}):
	var message = MessageGenerator.generate_message(messageType, extra_info)
	unread_messages.append(message)
	emit_signal("new_message_received", message)
	emit_signal("unread_message_count_changed", unread_messages.size())

func get_unread_messages():
	return unread_messages

func mark_message_as_read(message):
	if message in unread_messages:
		unread_messages.erase(message)
		read_messages.append(message)
		emit_signal("unread_message_count_changed", unread_messages.size())

func handle_town_support_request(accept: bool, requested_item: String):
	if accept:
		if requested_item.begins_with("Gold"):
			var gold_amount = int(requested_item.split(" ")[1])
			modify_gold(-gold_amount)
		elif requested_item.begins_with("Guild building"):
			# Extract building and cost reduction details
			var details = requested_item.substr(16)  # Skip "Guild building: "
			var building = details.split(" with cost reduction of ")[0]
			var cost_reduction = int(details.split("with cost reduction of ")[1].split(" ")[0])
			# Apply cost reduction logic for 3 months
			apply_building_cost_reduction(building, cost_reduction)
		modify_reputation(10)
	else:
		modify_reputation(-10)
		modify_influence(-10)

# Function to handle Adventurer Support
func handle_adventurer_support(accept: bool, adventurer_name: String, requested_item: String):
	if accept:
		if requested_item.begins_with("Gold"):
			var gold_amount = int(requested_item.split(" ")[1])
			modify_gold(-gold_amount)
		elif requested_item.begins_with("Guild building"):
			# Extract building and cost reduction details
			var details = requested_item.substr(16)  # Skip "Guild building: "
			var building = details.split(" with cost reduction of ")[0]
			var cost_reduction = int(details.split("with cost reduction of ")[1].split(" ")[0])
			# Apply cost reduction logic for 3 months
			apply_building_cost_reduction(building, cost_reduction)
		modify_reputation(10)
	else:
		modify_reputation(-10)
		modify_influence(-10)

# Function to handle Dungeon Notification
func handle_dungeon_notification():
	var highest_rank_party = get_highest_rank_party()
	if highest_rank_party:
		send_party_to_dungeon(highest_rank_party)

func get_highest_rank_party():
	var highest_rank = -1
	var highest_rank_party = null
	for party in parties:
		if party.rank > highest_rank:
			highest_rank = party.rank
			highest_rank_party = party
	return highest_rank_party

func send_party_to_dungeon(party):
	# Logic to send the party to the dungeon
	pass

# Function to get a character by its name
func get_character_by_name(character_name: String):
	for character in characters:
		if character.character_fullName == character_name:
			return character
	return null

# Function to generate a random notification for debugging purposes
func generate_random_notification():
	var message = MessageGenerator.generate_random_notification()
	unread_messages.append(message)
	emit_signal("new_message_received", message)
	emit_signal("unread_message_count_changed", unread_messages.size())

# NEW: Function to update relationships at the end of each in-game month
func monthly_update_relationships() -> void:
	# Loop over every unique pair of active characters.
	for i in range(characters.size()):
		var char_a = characters[i]
		for j in range(i + 1, characters.size()):
			var char_b = characters[j]
			
			# Get the current relationship value (default is 0 if not set)
			var current_rel = 0.0
			if char_a.relationships.has(char_b.character_id):
				current_rel = char_a.relationships[char_b.character_id]
			
			# Base random change each month: random float between -5 and 5.
			var change = randf_range(-5, 5)
			
			# If the relationship is above 50, add an extra bonus [0, 1]
			if current_rel > 50:
				change += randf_range(0, 1)
			# If the relationship is below -50, subtract an extra value in [0, 1]
			elif current_rel < -50:
				change += randf_range(-1, 0)
			
			# If both characters are in a party together, add additional bonus [1, 3]
			# (Assuming the party String is not "No Party" and is the same for both)
			if char_a.party != "No Party" and char_a.party == char_b.party:
				change += randf_range(1, 3)
			
			# Update relationship symmetrically for both characters.
			char_a.adjust_relationship(char_b.character_id, change)
			char_b.adjust_relationship(char_a.character_id, change)
			
			# Optionally, print the updated relationship for debugging.
			#print("Updated relationship between ", char_a.character_id, " and ", char_b.character_id, ": ", char_a.relationships[char_b.character_id])
