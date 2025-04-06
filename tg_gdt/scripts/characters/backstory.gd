extends Node

var backstories = {
	# Childhood & Upbringing
	"Orphaned in the Wilds": 
        {"weight": 1.0, "modifiers": 
            {"Survival": 30, "Empathy": -10, "Perception": 20, "Strength": 1}},
	"Raised by Nomads": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Discipline": 10, "Empathy": -10, "Wisdom": 1}},
	"Sheltered Temple Upbringing": 
        {"weight": 1.0, "modifiers": 
            {"Patience": 30, "Creativity": -10, "Empathy": 20, "Intelligence": 1}},
	"Street Urchin Survivor": 
        {"weight": 1.0, "modifiers": 
            {"Cunning": 30, "Sociability": 10, "Empathy": -10, "Agility": 1}},
	"Child Prodigy": 
        {"weight": 1.0, "modifiers": 
            {"Curiosity": 30, "Creativity": 10, "Humor": -10, "Intelligence": 1}},
	"Farmhand Turned Adventurer": 
        {"weight": 1.0, "modifiers": 
            {"Tenacity": 30, "Constitution": 10, "Patience": -10, "Strength": 1}},
	"Noble Scion in Disgrace": 
        {"weight": 1.0, "modifiers": 
            {"Humility": -20, "Empathy": -10, "Ambition": 20, "Charisma": 1}},
	"Merchant's Disappointed Heir": 
        {"weight": 1.0, "modifiers": 
            {"Cunning": 30, "Leadership": 10, "Integrity": -10, "Charisma": 1}},
	"Lived in a Haunted Village": 
        {"weight": 1.0, "modifiers": 
            {"Bravery": 30, "Empathy": -10, "Perception": 20, "Wisdom": 1}},
	"Grew Up in a Military Camp": 
        {"weight": 1.0, "modifiers": 
            {"Discipline": 30, "Tenacity": 10, "Aggression": -10, "Constitution": 1}},
	
	# Significant Life Events
	"Survived a Monster Attack": 
        {"weight": 1.0, "modifiers": 
            {"Bravery": 30, "Perception": 10, "Empathy": -10, "Constitution": 1}},
	"Witnessed a Great Tragedy": 
        {"weight": 1.0, "modifiers": 
            {"Empathy": 30, "Patience": 10, "Humor": -10, "Wisdom": 1}},
	"Found a Mysterious Artifact": 
        {"weight": 1.0, "modifiers": 
            {"Curiosity": 30, "Creativity": 10, "Discipline": -10, "Intelligence": 1}},
	"Lost a Loved One to Adventure": 
        {"weight": 1.0, "modifiers": 
            {"Empathy": 30, "Patience": 10, "Bravery": -10, "Charisma": 1}},
	"Made a Pact with a Strange Entity": 
        {"weight": 1.0, "modifiers": 
            {"Deception": 30, "Cunning": 10, "Integrity": -10, "Charisma": 1}},
	"Was Cursed by a Witch": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Discipline": 10, "Humor": -10, "Wisdom": 1}},
	"Discovered a Hidden Talent": 
        {"weight": 1.0, "modifiers": 
            {"Creativity": 30, "Curiosity": 10, "Discipline": -10, "Intelligence": 1}},
	"Escaped Slavery": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Cunning": 10, "Empathy": -10, "Strength": 1}},
	"Betrayed by a Close Friend": 
        {"weight": 1.0, "modifiers": 
            {"Cunning": 30, "Empathy": -10, "Perception": 20, "Wisdom": 1}},
	"Saved by a Mysterious Stranger": 
        {"weight": 1.0, "modifiers": 
            {"Integrity": 30, "Sociability": 10, "Empathy": -10, "Charisma": 1}},
	
	# Training & Profession (Before Adventuring)
	"Former City Guard": 
        {"weight": 1.0, "modifiers": 
            {"Discipline": 30, "Leadership": 10, "Cunning": -10, "Strength": 1}},
	"Retired Sailor": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Resourcefulness": 10, "Discipline": -10, "Strength": 1}},
	"Disgraced Scholar": 
        {"weight": 1.0, "modifiers": 
            {"Ambition": 30, "Wisdom": 10, "Charisma": -10, "Intelligence": 1}},
	"Runaway Apprentice": 
        {"weight": 1.0, "modifiers": 
            {"Creativity": 30, "Curiosity": 10, "Discipline": -10, "Intelligence": 1}},
	"Traveling Performer": 
        {"weight": 1.0, "modifiers": 
            {"Humor": 30, "Dexterity": 10, "Patience": -10, "Charisma": 1}},
	"Wilderness Scout": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Perception": 10, "Discipline": -10, "Agility": 1}},
	"Healer's Assistant": 
        {"weight": 1.0, "modifiers": 
            {"Empathy": 30, "Good": 10, "Strength": -10, "Wisdom": 1}},
	"Blacksmith's Apprentice": 
        {"weight": 1.0, "modifiers": 
            {"FireResistance": 30, "Creativity": 10, "Patience": -10, "Strength": 1}},
	"Cult Survivor": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Evil": 10, "Charisma": -10, "Wisdom": 1}},
	"Reformed Thief": 
        {"weight": 1.0, "modifiers": 
            {"Perception": 30, "Cunning": 10, "Charisma": -10, "Agility": 1}},
	
	# Motivations & Goals
	"Seeking Lost Knowledge": 
        {"weight": 1.0, "modifiers": 
            {"Curiosity": 30, "Creativity": 10, "Discipline": -10, "Intelligence": 1}},
	"Driven by Revenge": 
        {"weight": 1.0, "modifiers": 
            {"Bravery": 30, "Aggression": 10, "Empathy": -10, "Strength": 1}},
	"Searching for a Lost Family Member": 
        {"weight": 1.0, "modifiers": 
            {"Empathy": 30, "Courage": 10, "Patience": -10, "Charisma": 1}},
	"Pursuing Fame and Glory": 
        {"weight": 1.0, "modifiers": 
            {"Ambition": 30, "Cunning": 10, "Empathy": -10, "Charisma": 1}},
	"Dedicated to a Holy Quest": 
        {"weight": 1.0, "modifiers": 
            {"Good": 30, "Empathy": 10, "Ambition": -10, "Wisdom": 1}},
	"Trying to Break a Curse": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Discipline": 10, "Ambition": -10, "Wisdom": 1}},
	"Seeking Redemption for Past Deeds": 
        {"weight": 1.0, "modifiers": 
            {"Good": 30, "Bravery": 10, "Evil": -10, "Wisdom": 1}},
	"Driven by Greed for Treasure": 
        {"weight": 1.0, "modifiers": 
            {"Cunning": 30, "Ambition": 10, "Honesty": -10, "Charisma": 1}},
	"Protecting a Sacred Place": 
        {"weight": 1.0, "modifiers": 
            {"Bravery": 30, "Good": 10, "Evil": -10, "Constitution": 1}},
	"Exploring the Unknown": 
        {"weight": 1.0, "modifiers": 
            {"Curiosity": 30, "Creativity": 10, "Discipline": -10, "Intelligence": 1}},
	
	# Unique & Unusual Origins
	"Reincarnated Soul": 
        {"weight": 1.0, "modifiers": 
            {"Willpower": 30, "Tenacity": 10, "Confidence": -10, "Wisdom": 1}},
	"Amnesiac Wanderer": 
        {"weight": 1.0, "modifiers": 
            {"Adaptability": 30, "Curiosity": 10, "Sociability": -10, "Wisdom": 1}},
	"Experiment Gone Wrong": 
        {"weight": 1.0, "modifiers": 
            {"Sociability": -30, "Cunning": 10, "Honesty": -10, "Intelligence": 1}},
	"Dream Walker": 
        {"weight": 1.0, "modifiers": 
            {"Willpower": 30, "Curiosity": 10, "Sociability": -10, "Wisdom": 1}},
}

func get_random_backstory() -> Dictionary:
	var total_weight = 0.0
	for backstory in backstories.values():
		total_weight += backstory.weight
	
	var random_weight_point = randf() * total_weight
	
	for backstory_name in backstories.keys():
		var backstory = backstories[backstory_name]
		if random_weight_point < backstory.weight:
			return {"name": backstory_name, "modifiers": backstory.modifiers}
		random_weight_point -= backstory.weight
	
	return {}