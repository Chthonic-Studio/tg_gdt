extends Node

var traits = {
	"Brave": {"weight": 1.0, "modifiers": {"Courage": 2}},
	"Cunning": {"weight": 0.8, "modifiers": {"Intelligence": 2}},
	"Strong": {"weight": 0.6, "modifiers": {"Strength": 3}}
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
