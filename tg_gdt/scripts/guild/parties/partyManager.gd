extends Node

class_name PartyManager

var parties = []
var party_scene = preload("res://scripts/guild/parties/partyProfile.gd")

func create_party(party_name: String) -> Node:
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

func get_party_by_name(party_name: String) -> Node:
	for party in parties:
		if party.party_name == party_name:
			return party
	return null

func all_ready_for_mission():
	for party in parties:
		for character_id in party.members:
			var character = GameManager.get_character_by_id(character_id)
			if character and character.ai_state != character.AIState.WAITING_FOR_MISSION:
				return false
	return true
