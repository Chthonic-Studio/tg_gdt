extends NinePatchRect


@onready var fullNameLabel = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer/characterName
@onready var fullAvatar = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer/characterAvatar
# Main Stat List 
@onready var strength = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/strengthValue
@onready var agility = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/agilityValue
@onready var constitution = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/constitutionValue
@onready var intelligence = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/intelligenceValue
@onready var wisdom = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/wisdomValue
@onready var charisma = $MarginContainer/HBoxContainer/MarginContainer/VSplitContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/charismaValue

# Personality Stat List
@onready var adaptability = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/adaptabilityValue
@onready var aggression = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/aggressionValue
@onready var ambition = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/ambitionValue
@onready var bravery = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/braveryValue
@onready var confidence = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/confidenceValue
@onready var creativity = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/creativityValue
@onready var cunning = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/cunningValue
@onready var curiosity = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/curiosityValue
@onready var deception = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/deceptionValue
@onready var diplomacy = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/diplomacyValue
@onready var discipline = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/disciplineValue
@onready var empathy = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/empathyValue
@onready var evil = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/evilValue
@onready var good = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/goodValue
@onready var honesty = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/honestyValue
@onready var humility = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/humilityValue
@onready var humor = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/humorValue
@onready var integrity = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/integrityValue
@onready var intimidation = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/intimidationValue
@onready var leadership = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/leadershipValue
@onready var loyalty = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/loyaltyValue
@onready var luck = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/luckValue
@onready var morale = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/moraleValue
@onready var patience = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/patienceValue
@onready var perception = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/perceptionValue
@onready var persuasion = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/persuasionValue
@onready var resourcefulness = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/resourcefulnessValue
@onready var sociability = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/sociabilityValue
@onready var tenacity = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/tenacityValue
@onready var willpower = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/VBoxContainer4/willpowerValue


# This function receives the character data as a dictionary and populates the fullInfo UI.
func populate_full_info(character):
	print("Populating full info...")
	# Debug: Check if fullNameLabel is not null
	if fullNameLabel == null:
		print("ERROR: fullNameLabel is NIL!")
	else:
		fullNameLabel.text = character["character_fullName"]
	
	# Similarly check fullAvatar
	if fullAvatar == null:
		print("ERROR: fullAvatar is NIL!")
	else:
		fullAvatar.texture = load(character["character_avatar"])
	
	# Populate main stats if nodes are valid
	strength.text = str(int(character["stats"]["Strength"]))
	agility.text = str(int(character["stats"]["Agility"]))
	constitution.text = str(int(character["stats"]["Constitution"]))
	wisdom.text = str(int(character["stats"]["Wisdom"]))
	intelligence.text = str(int(character["stats"]["Intelligence"]))
	charisma.text = str(int(character["stats"]["Charisma"]))
	
	# Populate personality stats similarly
	adaptability.text = str(int(character["stats"]["Adaptability"]))
	aggression.text = str(int(character["stats"]["Aggression"]))
	ambition.text = str(int(character["stats"]["Ambition"]))
	bravery.text = str(int(character["stats"]["Bravery"]))
	confidence.text = str(int(character["stats"]["Confidence"]))
	creativity.text = str(int(character["stats"]["Creativity"]))
	cunning.text = str(int(character["stats"]["Cunning"]))
	curiosity.text = str(int(character["stats"]["Curiosity"]))
	deception.text = str(int(character["stats"]["Deception"]))
	diplomacy.text = str(int(character["stats"]["Diplomacy"]))
	discipline.text = str(int(character["stats"]["Discipline"]))
	empathy.text = str(int(character["stats"]["Empathy"]))
	evil.text = str(int(character["stats"]["Evil"]))
	good.text = str(int(character["stats"]["Good"]))
	honesty.text = str(int(character["stats"]["Honesty"]))
	humility.text = str(int(character["stats"]["Humility"]))
	humor.text = str(int(character["stats"]["Humor"]))
	integrity.text = str(int(character["stats"]["Integrity"]))
	intimidation.text = str(int(character["stats"]["Intimidation"]))
	leadership.text = str(int(character["stats"]["Leadership"]))
	loyalty.text = str(int(character["stats"]["Loyalty"]))
	luck.text = str(int(character["stats"]["Luck"]))
	morale.text = str(int(character["stats"]["Morale"]))
	patience.text = str(int(character["stats"]["Patience"]))
	perception.text = str(int(character["stats"]["Perception"]))
	persuasion.text = str(int(character["stats"]["Persuasion"]))
	resourcefulness.text = str(int(character["stats"]["Resourcefulness"]))
	sociability.text = str(int(character["stats"]["Sociability"]))
	tenacity.text = str(int(character["stats"]["Tenacity"]))
	willpower.text = str(int(character["stats"]["Willpower"]))
	
	print("Populated full info for character: ", character["character_fullName"])
