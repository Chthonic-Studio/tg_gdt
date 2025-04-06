extends Node

var races = {
    "Human": 
        {"weight": 1.0, "modifiers": 
            {"Constitution": 1, "Charisma": 1}},
    "Half-Elf": 
        {"weight": 0.8, "modifiers": 
            {"Dexterity": 1, "Charisma": 2, "Wisdom": -1}},
    "Dwarf": 
        {"weight": 0.8, "modifiers": 
            {"Strength": 2, "Constitution": 2, "Dexterity": -1}},
    "Elf": 
        {"weight": 0.7, "modifiers": 
            {"Dexterity": 2, "Constitution": -1, "Intelligence": 1}},
    "Halfling": 
        {"weight": 0.7, "modifiers": 
            {"Dexterity": 2, "Strength": -2, "Charisma": 1}},
    "Half-Orc": 
        {"weight": 0.6, "modifiers": 
            {"Strength": 2, "Constitution": 1, "Intelligence": -2}}
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