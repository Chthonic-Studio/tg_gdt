extends NinePatchRect

# Basic UI Elements
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

# AI Debug Labels (paths must correspond to your scene)
@onready var ai_debug_container = $ai_debug
@onready var creativityDesireLabel = $"ai_debug/HBoxContainer/1stVbox/creativity/VBoxContainer2/creativityDesire"
@onready var creativityNeedLabel = $"ai_debug/HBoxContainer/1stVbox/creativity/VBoxContainer2/creativityNeed"
@onready var creativityUtilityLabel = $"ai_debug/HBoxContainer/1stVbox/creativity/VBoxContainer2/creativityUtility"
@onready var explorationDesireLabel = $"ai_debug/HBoxContainer/1stVbox/exploration/VBoxContainer2/explorationDesire"
@onready var explorationNeedLabel = $"ai_debug/HBoxContainer/1stVbox/exploration/VBoxContainer2/explorationNeed"
@onready var explorationUtilityLabel = $"ai_debug/HBoxContainer/1stVbox/exploration/VBoxContainer2/explorationUtility"
@onready var helpingDesireLabel = $"ai_debug/HBoxContainer/1stVbox/helping/VBoxContainer2/helpingDesire"
@onready var helpingNeedLabel = $"ai_debug/HBoxContainer/1stVbox/helping/VBoxContainer2/helpingNeed"
@onready var helpingUtilityLabel = $"ai_debug/HBoxContainer/1stVbox/helping/VBoxContainer2/helpingUtility"
@onready var relaxationDesireLabel = $"ai_debug/HBoxContainer/1stVbox/relaxation/VBoxContainer2/relaxationDesire"
@onready var relaxationNeedLabel = $"ai_debug/HBoxContainer/1stVbox/relaxation/VBoxContainer2/relaxationNeed"
@onready var relaxationUtilityLabel = $"ai_debug/HBoxContainer/1stVbox/relaxation/VBoxContainer2/relaxationUtility"
@onready var restingDesireLabel = $"ai_debug/HBoxContainer/1stVbox/rest/VBoxContainer2/restDesire"
@onready var restingNeedLabel = $"ai_debug/HBoxContainer/1stVbox/rest/VBoxContainer2/restNeed"
@onready var restingUtilityLabel = $"ai_debug/HBoxContainer/1stVbox/rest/VBoxContainer2/restUtility"
@onready var shoppingDesireLabel = $"ai_debug/HBoxContainer/2ndVbox/shopping/VBoxContainer2/shoppingDesire"
@onready var shoppingNeedLabel = $"ai_debug/HBoxContainer/2ndVbox/shopping/VBoxContainer2/shoppingNeed"
@onready var shoppingUtilityLabel = $"ai_debug/HBoxContainer/2ndVbox/shopping/VBoxContainer2/shoppingUtility"
@onready var trainingDesireLabel = $"ai_debug/HBoxContainer/2ndVbox/training/VBoxContainer2/trainingDesire"
@onready var trainingNeedLabel = $"ai_debug/HBoxContainer/2ndVbox/training/VBoxContainer2/trainingNeed"
@onready var trainingUtilityLabel = $"ai_debug/HBoxContainer/2ndVbox/training/VBoxContainer2/trainingUtility"
@onready var socializationDesireLabel = $"ai_debug/HBoxContainer/2ndVbox/socialization/VBoxContainer2/socializationDesire"
@onready var socializationNeedLabel = $"ai_debug/HBoxContainer/2ndVbox/socialization/VBoxContainer2/socializationNeed"
@onready var socializationUtilityLabel = $"ai_debug/HBoxContainer/2ndVbox/socialization/VBoxContainer2/socializationUtility"
@onready var spiritualityDesireLabel = $"ai_debug/HBoxContainer/2ndVbox/spirituality/VBoxContainer2/spiritualityDesire"
@onready var spiritualityNeedLabel = $"ai_debug/HBoxContainer/2ndVbox/spirituality/VBoxContainer2/spiritualityNeed"
@onready var spiritualityUtilityLabel = $"ai_debug/HBoxContainer/2ndVbox/spirituality/VBoxContainer2/spiritualityUtility"
@onready var entertainmentDesireLabel = $"ai_debug/HBoxContainer/2ndVbox/entertainment/VBoxContainer2/entertainmentDesire"
@onready var entertainmentNeedLabel = $"ai_debug/HBoxContainer/2ndVbox/entertainment/VBoxContainer2/entertainmentNeed"
@onready var entertainmentUtilityLabel = $"ai_debug/HBoxContainer/2ndVbox/entertainment/VBoxContainer2/entertainmentUtility"
@onready var studyingDesireLabel = $"ai_debug/HBoxContainer/3rdVbox/studying/VBoxContainer2/studyingDesire"
@onready var studyingNeedLabel = $"ai_debug/HBoxContainer/3rdVbox/studying/VBoxContainer2/studyingNeed"
@onready var studyingUtilityLabel = $"ai_debug/HBoxContainer/3rdVbox/studying/VBoxContainer2/studyingUtility"
@onready var villainyDesireLabel = $"ai_debug/HBoxContainer/3rdVbox/villainy/VBoxContainer2/villainyDesire"
@onready var villainyNeedLabel = $"ai_debug/HBoxContainer/3rdVbox/villainy/VBoxContainer2/villainyNeed"
@onready var villainyUtilityLabel = $"ai_debug/HBoxContainer/3rdVbox/villainy/VBoxContainer2/villainyUtility"

# AI Action Log Labels
@onready var currentActionLabel = $"ai_debug/HBoxContainer/4thVbox/HBoxContainer/VBoxContainer2/currentActionPerformed"
@onready var actionCategoryLabel = $"ai_debug/HBoxContainer/4thVbox/HBoxContainer/VBoxContainer2/currentActionCategory"
@onready var lastActionLabel = $"ai_debug/HBoxContainer/4thVbox/HBoxContainer/VBoxContainer2/previousActionPerformed"

# The current character reference for debug updates.
var current_character = null
# Instead of creating a new instance each time, store the calculations instance.
var calculations = preload("res://scripts/characters/AI/actionCalculations.gd").new()

func populate_full_info(character):
	print("Populating full info...")
	current_character = character
	if fullNameLabel:
		fullNameLabel.text = character["character_fullName"]
	if fullAvatar:
		fullAvatar.texture = load(character["character_avatar"])
	
	# Populate main stats.
	strength.text = str(int(character["stats"]["Strength"]))
	agility.text = str(int(character["stats"]["Agility"]))
	constitution.text = str(int(character["stats"]["Constitution"]))
	wisdom.text = str(int(character["stats"]["Wisdom"]))
	intelligence.text = str(int(character["stats"]["Intelligence"]))
	charisma.text = str(int(character["stats"]["Charisma"]))
	
	# Populate personality stats.
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
	
	update_ai_debug_info()
	print("Populated full info for character:", character["character_fullName"])

func update_ai_debug_info():
	if not ai_debug_container.visible or current_character == null:
		return

	if current_character.has_meta("current_utilities"):
		var utilities = current_character.get_meta("current_utilities")

		creativityNeedLabel.text = str("%.2f" % utilities["creativityNeed"])
		creativityDesireLabel.text = str("%.2f" % utilities["creativityDesire"])
		creativityUtilityLabel.text = str("%.2f" % utilities["creativityUtility"])

		explorationNeedLabel.text = str("%.2f" % utilities["explorationNeed"])
		explorationDesireLabel.text = str("%.2f" % utilities["explorationDesire"])
		explorationUtilityLabel.text = str("%.2f" % utilities["explorationUtility"])

		helpingNeedLabel.text = str("%.2f" % utilities["helpingNeed"])
		helpingDesireLabel.text = str("%.2f" % utilities["helpingDesire"])
		helpingUtilityLabel.text = str("%.2f" % utilities["helpingUtility"])

		relaxationNeedLabel.text = str("%.2f" % utilities["relaxationNeed"])
		relaxationDesireLabel.text = str("%.2f" % utilities["relaxationDesire"])
		relaxationUtilityLabel.text = str("%.2f" % utilities["relaxationUtility"])

		#restingNeedLabel.text = str("%.2f" % utilities["restingNeed"])
		#restingDesireLabel.text = str("%.2f" % utilities["restingDesire"])
		restingUtilityLabel.text = str("%.2f" % utilities["restingUtility"])

		shoppingNeedLabel.text = str("%.2f" % utilities["shoppingNeed"])
		shoppingDesireLabel.text = str("%.2f" % utilities["shoppingDesire"])
		shoppingUtilityLabel.text = str("%.2f" % utilities["shoppingUtility"])

		trainingNeedLabel.text = str("%.2f" % utilities["trainingNeed"])
		trainingDesireLabel.text = str("%.2f" % utilities["trainingDesire"])
		trainingUtilityLabel.text = str("%.2f" % utilities["trainingUtility"])

		socializationNeedLabel.text = str("%.2f" % utilities["socializationNeed"])
		socializationDesireLabel.text = str("%.2f" % utilities["socializationDesire"])
		socializationUtilityLabel.text = str("%.2f" % utilities["socializationUtility"])

		spiritualityNeedLabel.text = str("%.2f" % utilities["spiritualityNeed"])
		spiritualityDesireLabel.text = str("%.2f" % utilities["spiritualityDesire"])
		spiritualityUtilityLabel.text = str("%.2f" % utilities["spiritualityUtility"])

		entertainmentNeedLabel.text = str("%.2f" % utilities["entertainmentNeed"])
		entertainmentDesireLabel.text = str("%.2f" % utilities["entertainmentDesire"])
		entertainmentUtilityLabel.text = str("%.2f" % utilities["entertainmentUtility"])

		studyingNeedLabel.text = str("%.2f" % utilities["studyingNeed"])
		studyingDesireLabel.text = str("%.2f" % utilities["studyingDesire"])
		studyingUtilityLabel.text = str("%.2f" % utilities["studyingUtility"])

		villainyNeedLabel.text = str("%.2f" % utilities["villainyNeed"])
		villainyDesireLabel.text = str("%.2f" % utilities["villainyDesire"])
		villainyUtilityLabel.text = str("%.2f" % utilities["villainyUtility"])

	else:
		print("Warning: Utility values not yet calculated for", current_character.character_fullName)
	
	# Update action information
	if current_character.has_method("get_current_action"):
		currentActionLabel.text = str(current_character.get_current_action())
	else:
		currentActionLabel.text = "None"
	if current_character.has_method("get_current_action_category"):
		actionCategoryLabel.text = str(current_character.get_current_action_category())
	else:
		actionCategoryLabel.text = "None"
	if current_character.has_method("get_last_action_taken"):
		lastActionLabel.text = str(current_character.get_last_action_taken())
	else:
		lastActionLabel.text = "None"

func _process(delta):
	if current_character:
		update_ai_debug_info()
