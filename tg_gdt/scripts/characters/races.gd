extends Node

var races = {
    "Human": {"weight": 1.0, "modifiers": {"Constitution": 2}},
    "Elf": {"weight": 0.8, "modifiers": {"Dexterity": 2, "Constitution": -1}},
    "Dwarf": {"weight": 0.6, "modifiers": {"Strength": 2, "Dexterity": -1}},
    "Orc": {"weight": 0.5, "modifiers": {"Strength": 3, "Intelligence": -2}}
}

func get_random_race() -> Dictionary:
    var total_weight = 0.0
    for race in races.values():
        total_weight += race.weight
    
    var random_weight_point = randf() * total_weight
    
    for race_name in races.keys():
        if random_weight_point < races[race_name].weight:
            return {"name": race_name, "modifiers": races[race_name].modifiers}
        random_weight_point -= races[race_name].weight
    
    return {}