extends ScrollContainer

var PartyListItemScene = preload("res://parties_list_item.tscn")

# Reference to the VBoxContainer
@onready var party_list_vbox = $partiesListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in party_list_vbox.get_children():
		party_list_vbox.remove_child(child)
		child.queue_free()

# Function to populate the party list
func populate_party_list(parties):
	# Clear any existing items in the VBoxContainer
	clear_vbox_container()

	# Iterate through the list of parties
	for party in parties:
		# Instantiate a new party_list_item
		var party_list_item = PartyListItemScene.instantiate()

		# Populate the fields with the party's information
		party_list_item.get_node("partyName").text = party.party_name
		party_list_item.get_node("partyRank").text = party.party_rank
		party_list_item.get_node("partyMissions").text = str(party.missions_completed)
		party_list_item.get_node("partyMembers").text = str(party.members.size())
		
		# Assign the character to the button's script
		party_list_item.get_node("partyButton").party = party
		
		# Add the party_list_item to the VBoxContainer
		party_list_vbox.add_child(party_list_item)

# Connect to the PartiesManager's update_party_list signal
func _ready():
	PartiesManager.connect("update_party_list", Callable(self, "populate_party_list"))
