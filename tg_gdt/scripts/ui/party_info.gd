extends VBoxContainer

@onready var partyName = $partyName
@onready var missionNumber = $HSplitContainer/missionsLabel/missionsNumber
@onready var guildEval = $HSplitContainer/missionsLabel/guildEvaluationValue
@onready var partyRank = $HSplitContainer/rankLabel/rankValue

@onready var partyMembersContainer = $partyMembersList/partyMembersContainer
@onready var advLogVBox = $adventureLog/advLogVBox

var PartyMemberItemScene = preload("res://partyMembersListItem.tscn")
var AdventureLogEntryScene = preload("res://party_adventure_log_entry.tscn")

func _ready():
	UIManager.connect("party_selected", Callable(self, "populate_party_info"))

func populate_party_info(party):
	print("Populating party info")
	partyName.text = party.party_name
	missionNumber.text = str(party.missions_completed)
	guildEval.text = str(party.guild_eval)
	partyRank.text = str(party.party_rank)
	populate_party_members(party.members)
	populate_adventure_log(party.party_log)

func populate_party_members(member_ids):
	# Clear existing members
	print("Clearing existing members")
	for child in partyMembersContainer.get_children():
		child.queue_free()

	# Add new members
	for member_id in member_ids:
		var member = get_character_by_id(member_id)
		if member:
			var member_item = PartyMemberItemScene.instantiate()
			if member_item == null:
				print("Failed to instantiate PartyMemberItemScene")
			else:
				var charName = member_item.get_node("charName")
				if charName == null:
					print("Failed to find charName node in PartyMemberItemScene")
				else:
					charName.text = member.character_first_name + " " + member.character_last_name
				var classRaceValue = member_item.get_node("classRaceValue")
				if classRaceValue == null:
					print("Failed to find classRaceValue node in PartyMemberItemScene")
				else:
					classRaceValue.text = member.selected_class["name"] + " " + member.selected_race["name"]
				var rankValue = member_item.get_node("rankValue")
				if rankValue == null:
					print("Failed to find rankValue node in PartyMemberItemScene")
				else:
					rankValue.text = member.rank
				partyMembersContainer.add_child(member_item)

func get_character_by_id(character_id):
	# This function should retrieve the character object by its ID.
	# Update this function as needed to match your game manager or character retrieval logic.
	for character in GameManager.characters:
		if character.character_id == character_id:
			return character
	return null

func populate_adventure_log(log_entries):
	# Clear existing log entries
	print("Clearing existing log entries")
	for child in advLogVBox.get_children():
		child.queue_free()

	# Add new log entries
	for entry in log_entries:
		print("Adding log entry:", entry)
		var log_item = AdventureLogEntryScene.instantiate()
		if log_item == null:
			print("Failed to instantiate AdventureLogEntryScene")
		else:
			var logEntryText = log_item.get_node("adventureLogEntry")
			if logEntryText == null:
				print("Failed to find adventureLogEntry node in AdventureLogEntryScene")
			else:
				logEntryText.text = entry
			advLogVBox.add_child(log_item)
