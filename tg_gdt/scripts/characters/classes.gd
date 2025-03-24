extends Node

var classes = {
    "Warrior": {"weight": 1.0, "modifiers": {"Strength": 5, "Dexterity": -1}},
    "Mage": {"weight": 0.8, "modifiers": {"Intelligence": 5, "Constitution": -1}},
    "Rogue": {"weight": 0.6, "modifiers": {"Dexterity": 5, "Strength": -1}}
}

func get_random_class() -> Dictionary:
    var total_weight = 0.0
    for charClass in classes.values():
        total_weight += charClass.weight
    
    var random_weight_point = randf() * total_weight
    
    for charClass_name in classes.keys():
        if random_weight_point < classes[charClass_name].weight:
            return {"name": charClass_name, "modifiers": classes[charClass_name].modifiers}
        random_weight_point -= classes[charClass_name].weight
    
    return {}