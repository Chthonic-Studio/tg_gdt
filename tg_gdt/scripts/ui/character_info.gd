extends VBoxContainer

# Reference to the UI elements
@onready var charAvatar = $charMainInfo/charAvatar
@onready var char_name = $charMainInfo/charName
@onready var char_title = $charMainInfo/charName/charTitle
@onready var char_class = $NinePatchRect/charClass
@onready var char_missions = $adventurerDetails/missionsLabel/missionsNumber
@onready var char_rank = $adventurerDetails/rankHolder/charRank
@onready var char_party = $adventurerDetails/missionsLabel/partyValue
@onready var guild_eval = $adventurerDetails/missionsLabel/guildEvaluationValue
@onready var level = $stats_status/statTable/HBoxContainer/VBoxContainer2/levelStat
@onready var strength = $stats_status/statTable/HBoxContainer/VBoxContainer2/strengthStat
@onready var agility = $stats_status/statTable/HBoxContainer/VBoxContainer2/agilityStat
@onready var constitution = $stats_status/statTable/HBoxContainer/VBoxContainer2/constitutionStat
@onready var wisdom = $stats_status/statTable/HBoxContainer/VBoxContainer2/wisdomStat
@onready var intelligence = $stats_status/statTable/HBoxContainer/VBoxContainer2/intelligenceStat
@onready var charisma = $stats_status/statTable/HBoxContainer/VBoxContainer2/charismaStat
@onready var age = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/ageValue
@onready var gender = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/genderValue
@onready var personality = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/personalityValue
@onready var backstory = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/backstoryValue
@onready var show_traits = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/traitsValue
@onready var status = $stats_status/otherInfo/VBoxContainer/otherInfoContainer/otherInfoVbox/otherInfoValues/statusValue

# Full Info Variables
@onready var option_button = $stats_status/otherInfo/VBoxContainer/MarginContainer/OptionButton
@onready var fullInfoScene = $"../../../../../../../../../characterInfoContainer/characterFullStats"

# Variable to store current character data; note the different name
var current_character_data = {}

# Function to populate character info
func populate_character_info(character):
	charAvatar.texture = load(character.character_avatar)
	char_name.text = character.character_fullName
	char_title.text = character.character_title
	char_class.text = character.selected_race["name"] + " " + character.selected_class["name"]
	char_missions.text = str(character.missions_completed)
	char_rank.text = character.rank
	char_party.text = character.party
	guild_eval.text = character.guild_eval
	level.text = str(character.level)
	strength.text = str(int(character.stats["Strength"]))
	agility.text = str(int(character.stats["Agility"]))
	constitution.text = str(int(character.stats["Constitution"]))
	wisdom.text = str(int(character.stats["Wisdom"]))
	intelligence.text = str(int(character.stats["Intelligence"]))
	charisma.text = str(int(character.stats["Charisma"]))
	age.text = str(character.age)
	gender.text = character.character_gender
	personality.text = character.selected_personality["name"]
	backstory.text = character.selected_backstory["name"]
	
	# Populate traits
	var trait_names = []
	for traits in character.selected_traits:
		trait_names.append(traits["name"])
	show_traits.text = ", ".join(trait_names)
	
		# Populate statuses
	var status_names = []
	for status_item in character.character_statuses:
		status_names.append(status_item["name"])
	status.text = ", ".join(status_names) if status_names.size() > 0 else "No active status"

	# Save the character data for later use
	current_character_data = character

func _ready():
	UIManager.connect("character_selected", Callable (self, "populate_character_info"))
	# Connect the OptionButton signal
	option_button.connect("item_selected", Callable (self, "_on_option_button_item_selected"))

func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			print("See Full Stats option selected.")
			_send_character_data_to_fullinfo(current_character_data)
			UIManager.characterFullInfo_toggle()
		1:
			print("Talk option selected.")
			pass
		2:
			print("Banish option selected.")
			pass
		_:
			pass

### FULL STATS PAGE ###

func _send_character_data_to_fullinfo(character):
	print("Sending character data to Full Info Scene")
	fullInfoScene.populate_full_info(character)

func _start_dialogue():
	# Implement your dialogue start logic here.
	print("Starting dialogue...")

func _banish_character():
	# Implement the banish logic here.
	print("Banish the character...")
