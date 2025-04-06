extends Node

var personalities = {
    "Architect": {
        "name": "Architect", 
        "weight": 1.0, 
        "modifiers": {
            "Confidence": 20, 
            "Curiosity": 20, 
            "Creativity": 30, 
            "Patience": 20, 
            "Honesty": 20
        }
    },
    "Logician": {
        "name": "Logician", 
        "weight": 1.0, 
        "modifiers": {
            "Adaptability": 20, 
            "Curiosity": 20, 
            "Creativity": 30, 
            "Honesty": 20,
            "Resourcefulness": 20
        }
    },
    "Commander": {
        "name": "Commander", 
        "weight": 1.0, 
        "modifiers": {
            "Ambition": 20, 
            "Leadership": 30, 
            "Confidence": 20, 
            "Bravery": 20, 
            "Persuasion": 30,
            "Aggression": 10
        }
    },
    "Debater": {
        "name": "Debater", 
        "weight": 1.0, 
        "modifiers": {
            "Adaptability": 20, 
            "Ambition": 20, 
            "Confidence": 20, 
            "Humor": 20, 
            "Curiosity": 20, 
            "Bravery": 20,
            "Aggression": 20,
            "Resourcefulness": 20
        }
    },
    "Advocate": {
        "name": "Advocate", 
        "weight": 1.0, 
        "modifiers": {
            "Loyalty": 30, 
            "Leadership": 30, 
            "Empathy": 20, 
            "Patience": 20, 
            "Honesty": 20, 
            "Intimidation": -20, 
            "Deception": -20, 
            "Diplomacy": 20
        }
    },
    "Mediator": {
        "name": "Mediator", 
        "weight": 1.0, 
        "modifiers": {
            "Empathy": 20, 
            "Curiosity": 20, 
            "Creativity": 30, 
            "Patience": 20, 
            "Intimidation": -20, 
            "Deception": -20, 
            "Diplomacy": 20
        }
    },
    "Protagonist": {
        "name": "Protagonist", 
        "weight": 1.0, 
        "modifiers": {
            "Loyalty": 30, 
            "Leadership": 30, 
            "Sociability": 20, 
            "Creativity": 30, 
            "Persuasion": 30, 
            "Diplomacy": 20,
            "Aggression": 10
        }
    },
    "Campaigner": {
        "name": "Campaigner", 
        "weight": 1.0, 
        "modifiers": {
            "Adaptability": 20, 
            "Sociability": 20, 
            "Humor": 20, 
            "Creativity": 30, 
            "Diplomacy": 20
        }
    },
    "Logistician": {
        "name": "Logistician", 
        "weight": 1.0, 
        "modifiers": {
            "Tenacity": 20, 
            "Discipline": 20, 
            "Patience": 20
        }
    },
    "Defender": {
        "name": "Defender", 
        "weight": 1.0, 
        "modifiers": {
            "Tenacity": 20, 
            "Loyalty": 30, 
            "Empathy": 20, 
            "Discipline": 20, 
            "Patience": 20, 
            "Honesty": 20, 
            "Intimidation": -20, 
            "Deception": -20,
            "Aggression": 10
        }
    },
    "Executive": {
        "name": "Executive", 
        "weight": 1.0, 
        "modifiers": {
            "Tenacity": 20, 
            "Ambition": 20, 
            "Leadership": 30, 
            "Confidence": 20, 
            "Discipline": 20
        }
    },
    "Consul": {
        "name": "Consul", 
        "weight": 1.0, 
        "modifiers": {
            "Tenacity": 20, 
            "Loyalty": 30, 
            "Sociability": 20, 
            "Empathy": 20, 
            "Discipline": 20, 
            "Persuasion": 30
        }
    },
    "Virtuoso": {
        "name": "Virtuoso", 
        "weight": 1.0, 
        "modifiers": {
            "Adaptability": 20, 
            "Sociability": 20, 
            "Curiosity": 20, 
            "Creativity": 30,
            "Resourcefulness": 20
        }
    },
    "Adventurer": {
        "name": "Adventurer", 
        "weight": 1.0, 
        "modifiers": {
            "Adaptability": 20, 
            "Tenacity": 20, 
            "Sociability": 20, 
            "Bravery": 20, 
            "Intimidation": -20, 
            "Deception": -20
        }
    },
    "Entrepeneur": {
        "name": "Entrepreneur", 
        "weight": 1.0, 
        "modifiers": {
            "Confidence": 20, 
            "Humor": 20, 
            "Bravery": 20,
            "Resourcefulness": 20
        }
    },
    "Entertainer": {
        "name": "Entertainer", 
        "weight": 1.0, 
        "modifiers": {
            "Sociability": 20, 
            "Humor": 20, 
            "Curiosity": 20
        }
    }
}


func get_random_personality() -> Dictionary:
	var total_weight = 0.0
	for personality in personalities.values():
		total_weight += personality.weight
	
	var random_weight_point = randf() * total_weight
	
	for personality_name in personalities.keys():
		var personality = personalities[personality_name]
		if random_weight_point < personality.weight:
			return {"name": personality_name, "modifiers": personality.modifiers}
		random_weight_point -= personality.weight
	
	return {}