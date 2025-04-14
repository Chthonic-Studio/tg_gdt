extends Node

class_name PartyManager
signal update_party_list

var parties = []
var party_generator = preload("res://scripts/guild/parties/partyGenerator.gd").new()

# Create a new party with a unique name.
func create_party(party_name: String) -> Node:
	var unique_party_name = party_name
	var counter = 1
	while get_party_by_name(unique_party_name) != null:
		unique_party_name = party_name + " " + str(counter)
		counter += 1
	var new_party = party_generator.generate_party(unique_party_name)
	if new_party:
		parties.append(new_party)
		GameManager.parties.append(new_party)
		emit_signal("update_party_list", parties)
		# Optionally: LogManager.add_log("A new party has been formed! " + new_party.party_name + " will now take missions as a group")
	return new_party

# Remove a party from the list.
func remove_party(party: Node):
	if party in parties:
		parties.erase(party)
		GameManager.parties.erase(party)
		emit_signal("update_party_list", parties)
		LogManager.add_log("The party " + party.party_name + " has been disbanded")

# Add a character to a party. This function first checks if the character is in a previous party.
func add_character_to_party(character, party):
	if character and party:
		# Check if the character is already assigned to a different party.
		if character.party != "No Party":
			var previous_party = get_party_by_name(character.party)
			if previous_party:
				remove_character_from_party(character, previous_party)
		# Now add character to the target party.
		party.add_member(character.character_id)
		character.party = party.party_name
		emit_signal("update_party_list", parties)

# Remove a character from a party.
func remove_character_from_party(character, party):
	if character and party:
		party.remove_member(character.character_id)
		character.party = "No Party"
		emit_signal("update_party_list", parties)

# Return a party node by its name.
func get_party_by_name(party_name: String) -> Node:
	for party in parties:
		if party.party_name == party_name:
			return party
	return null

# Check if every party's members are in the WAITING_FOR_MISSION state.
func all_ready_for_mission() -> bool:
	for party in parties:
		for character_id in party.members:
			var character = GameManager.get_character_by_id(character_id)
			if character and character.ai_state != character.AIState.WAITING_FOR_MISSION:
				return false
	return true

# Test function to create a party from a provided array of characters.
# If no argument is provided, it defaults to using GameManager.characters.
func test_party_creation(characters_array = null) -> void:
	if characters_array == null:
		# Default to GameManager.characters if no array is passed.
		characters_array = GameManager.characters
	print("Debug Create Party Function Started")
	if characters_array.size() < 3:
		print("Not enough characters to form a party")
		return
	var random_characters = []
	while random_characters.size() < 3:
		var random_index = randi() % characters_array.size()
		var random_character = characters_array[random_index]
		if random_character not in random_characters:
			random_characters.append(random_character)
			random_character.set_character_id()
	var new_party = create_party("Test Party")
	if new_party == null:
		print("Failed to create party")
		return
	for character in random_characters:
		add_character_to_party(character, new_party)
	print("Test party created with characters:")
	for character in random_characters:
		if character.party:
			print(character.character_fullName, "->", character.party)
		else:
			print(character.character_fullName, "is not assigned to any party")
