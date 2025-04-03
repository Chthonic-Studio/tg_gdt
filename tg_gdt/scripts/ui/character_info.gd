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


# Function to populate character info
func populate_character_info(character):
	charAvatar.texture = load(character.character_avatar)
	char_name.text = character.character_fullName
	char_title.text = character.character_title
	char_class.text = character.selected_class["name"] + " " + character.selected_race["name"]
	char_missions.text = str(character.missions_completed)
	char_rank.text = character.rank
	char_party.text = character.party
	guild_eval.text = character.guild_eval
	level.text = str(character.level)
	strength.text = str(character.stats["Strength"])
	agility.text = str(character.stats["Agility"])
	constitution.text = str(character.stats["Constitution"])
	wisdom.text = str(character.stats["Wisdom"])
	intelligence.text = str(character.stats["Intelligence"])
	charisma.text = str(character.stats["Charisma"])
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


func _ready():
	UIManager.connect("character_selected", Callable (self, "populate_character_info"))
