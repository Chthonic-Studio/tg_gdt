extends Node

var personalities = {     
	"Brave": {"weight": 1.0, "modifiers": {"Courage": 5}},
	"Cautious": {"weight": 0.8, "modifiers": {"Courage": -2, "Intelligence": 1}},
	"Cunning": {"weight": 0.6, "modifiers": {"Cunning": 10}},
	"Cowardly": {"weight": 0.7, "modifiers": {"Courage": -30}}

	# Add more personalities as needed
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
