extends Node

var personalities = {
    "INTJ": {
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
    "INTP": {
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
    "ENTJ": {
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
    "ENTP": {
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
    "INFJ": {
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
    "INFP": {
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
    "ENFJ": {
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
    "ENFP": {
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
    "ISTJ": {
        "name": "Logistician", 
        "weight": 1.0, 
        "modifiers": {
            "Tenacity": 20, 
            "Discipline": 20, 
            "Patience": 20
        }
    },
    "ISFJ": {
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
    "ESTJ": {
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
    "ESFJ": {
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
    "ISTP": {
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
    "ISFP": {
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
    "ESTP": {
        "name": "Entrepreneur", 
        "weight": 1.0, 
        "modifiers": {
            "Confidence": 20, 
            "Humor": 20, 
            "Bravery": 20,
            "Resourcefulness": 20
        }
    },
    "ESFP": {
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