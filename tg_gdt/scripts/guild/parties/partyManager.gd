extends Node

class_name PartyManager

var parties = []
var party_scene = preload("res://scripts/guild/parties/partyProfile.gd")

func create_party(party_name: String) -> Node:
	# Creates a new party node
	var new_party = party_scene.instance()
	new_party.party_name = party_name
	parties.append(new_party)
	return new_party

func add_character_to_party(character, party):
	if character and party:
		party.add_member(character.character_id)
		character.party = party.party_name

func remove_character_from_party(character, party):
	if character and party:
		party.remove_member(character.character_id)
		character.party = "No Party"

func all_ready_for_mission():
	# Check if every party (or each character flagged to join) is in the waiting state
	for party in parties:
		for character_id in party.members:
			var character = GameManager.get_character_by_id(character_id)
			# Make sure you check the state on the character
			if character and character.ai_state != character.AIState.WAITING_FOR_MISSION:
				return false
	return true