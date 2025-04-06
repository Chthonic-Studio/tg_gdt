extends Node

var traits = {
    "Brave": {"weight": 1.0, "modifiers": {"Bravery": 20}},
    "Cautious": {"weight": 1.0, "modifiers": {"Bravery": -10, "Intelligence": 1}},
    "Ambitious": {"weight": 1.0, "modifiers": {"Ambition": 20}},
    "Humble": {"weight": 1.0, "modifiers": {"Charisma": -1, "Integrity": 10}},
    "Kind": {"weight": 1.0, "modifiers": {"Empathy": 20}},
    "Cruel": {"weight": 1.0, "modifiers": {"Empathy": -20}},
    "Loyal": {"weight": 1.0, "modifiers": {"Loyalty": 20}},
    "Treacherous": {"weight": 1.0, "modifiers": {"Loyalty": -20, "Deception": 20}},
    "Optimistic": {"weight": 1.0, "modifiers": {"Morale": 20}},
    "Pessimistic": {"weight": 1.0, "modifiers": {"Morale": -20}},
    "Energetic": {"weight": 1.0, "modifiers": {"Willpower": 20, "Health": 2}},
    "Lazy": {"weight": 1.0, "modifiers": {"Willpower": -20}},
    "Intelligent": {"weight": 1.0, "modifiers": {"Intelligence": 2}},
    "Foolish": {"weight": 1.0, "modifiers": {"Intelligence": -2}},
    "Charismatic": {"weight": 1.0, "modifiers": {"Charisma": 2}},
    "Awkward": {"weight": 1.0, "modifiers": {"Charisma": -2}},
    "Patient": {"weight": 1.0, "modifiers": {"Patience": 20}},
    "Impulsive": {"weight": 1.0, "modifiers": {"Patience": -20, "Bravery": 10}},
    "Honest": {"weight": 1.0, "modifiers": {"Integrity": 20}},
    "Deceptive": {"weight": 1.0, "modifiers": {"Deception": 20}},
    "Generous": {"weight": 1.0, "modifiers": {"Empathy": 20, "Ambition": -10}},
    "Ambitiony": {"weight": 1.0, "modifiers": {"Ambition": 20, "Empathy": -10}},
    "Curious": {"weight": 1.0, "modifiers": {"Curiosity": 20}},
    "Indifferent": {"weight": 1.0, "modifiers": {"Empathy": -20, "Morale": -10}},
    "Disciplined": {"weight": 1.0, "modifiers": {"Discipline": 20}},
    "Reckless": {"weight": 1.0, "modifiers": {"Discipline": -20, "Bravery": 10}},
    "Observant": {"weight": 1.0, "modifiers": {"Perception": 20}},
    "Oblivious": {"weight": 1.0, "modifiers": {"Perception": -20}},
    "Friendly": {"weight": 1.0, "modifiers": {"Sociability": 20}},
    "Aloof": {"weight": 1.0, "modifiers": {"Sociability": -20}},
    "Determined": {"weight": 1.0, "modifiers": {"Willpower": 20}},
    "Hesitant": {"weight": 1.0, "modifiers": {"Willpower": -20}},
    "Creative": {"weight": 1.0, "modifiers": {"Creativity": 20}},
    "Practical": {"weight": 1.0, "modifiers": {"Creativity": -10, "Intelligence": 1}},
    "Stoic": {"weight": 1.0, "modifiers": {"Discipline": 20, "Empathy": -10}},
    "Emotional": {"weight": 1.0, "modifiers": {"Empathy": 20, "Discipline": -10}},
    "Humorous": {"weight": 1.0, "modifiers": {"Humor": 20}},
    "Serious": {"weight": 1.0, "modifiers": {"Humor": -20}},
    "Organized": {"weight": 1.0, "modifiers": {"Discipline": 20}},
    "Chaotic": {"weight": 1.0, "modifiers": {"Discipline": -20}},
    "Forgiving": {"weight": 1.0, "modifiers": {"Empathy": 20}},
    "Vengeful": {"weight": 1.0, "modifiers": {"Bravery": 10, "Empathy": -20}},
    "Confident": {"weight": 1.0, "modifiers": {"Confidence": 20}},
    "Insecure": {"weight": 1.0, "modifiers": {"Confidence": -20}},
    "Adaptable": {"weight": 1.0, "modifiers": {"Adaptability": 20}},
    "Stubborn": {"weight": 1.0, "modifiers": {"Adaptability": -20}},
    "Articulate": {"weight": 1.0, "modifiers": {"Intelligence": 1, "Charisma": 1}},
    "Quiet": {"weight": 1.0, "modifiers": {"Sociability": -20}},
    "Empathetic": {"weight": 1.0, "modifiers": {"Empathy": 20}},
    "Callous": {"weight": 1.0, "modifiers": {"Empathy": -20}}
}

func get_random_traits(num_traits: int) -> Array:
	var selected_traits = []
	var possible_traits = traits.keys()
	
	for i in range(num_traits):
		var total_weight = 0.0
		for trait_name in possible_traits:
			total_weight += traits[trait_name].weight
		
		var random_weight_point = randf() * total_weight
		
		for trait_name in possible_traits:
			if random_weight_point < traits[trait_name].weight:
				selected_traits.append({"name": trait_name, "modifiers": traits[trait_name].modifiers})
				possible_traits.erase(trait_name)
				break
			random_weight_point -= traits[trait_name].weight
	
	return selected_traits
