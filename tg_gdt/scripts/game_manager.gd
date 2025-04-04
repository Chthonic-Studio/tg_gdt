extends Node

var CharacterGenerator = preload("res://scripts/characters/characterGenerator.gd").new()
var PartyGenerator = preload("res://scripts/guild/parties/partyGenerator.gd").new()

# Define player stats
var gold: int = 0
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

# Define global bool variables
var noGold: bool = false
var noResources: bool = false

# List to keep track of all characters
var characters = []
var retired_characters = []
var dead_characters = []

# List to keep track of all parties
var parties = []

# Define signals
signal stat_modified # Signals a player's stat was modified
signal update_character_list # Signals there was an update in the character list
signal update_party_list # Signals there was an update in the party list

# Function to generate and add a new character
func _on_spawn_character():
	print("Generating character")
	var new_character = CharacterGenerator.generate_character()
	if new_character:
		get_tree().current_scene.add_child(new_character)
		characters.append(new_character)
		print("Character added to scene: ", new_character.name)
		# Emit the signal to update the character list
		emit_signal("update_character_list", characters)
	else:
		print("Failed to generate character")

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
