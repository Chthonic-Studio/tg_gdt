extends Node

var statuses = {
    "Poisoned": {"modifiers": {"Health": -5}},
    "Blessed": {"modifiers": {"Luck": 5}},
    "Cursed": {"modifiers": {"Luck": -5}},
    "Enraged": {"modifiers": {"Strength": 10, "Intelligence": -5}},
    "Protected": {"modifiers": {"Armor": 10}}
}

func get_random_status() -> Dictionary:
    var status_keys = statuses.keys()
    var random_status = status_keys[randi() % status_keys.size()]
    return {"name": random_status, "modifiers": statuses[random_status].modifiers}

func get_status_modifiers(status_name: String) -> Dictionary:
    if status_name in statuses:
        return statuses[status_name].modifiers
    else:
        return {}