extends Node

# Define a dictionary to hold the statuses
var statuses = {
    1: {
        "name": "Poisoned",
        "description": "The character is poisoned and loses health over time.",
        "modifiers": {"Health": -5}
    },
    2: {
        "name": "Blessed",
        "description": "The character is blessed and gains increased stats.",
        "modifiers": {"Strength": 2, "Agility": 2, "Wisdom": 2}
    },
    3: {
        "name": "Cursed",
        "description": "The character is cursed and suffers from reduced stats.",
        "modifiers": {"Strength": -2, "Agility": -2, "Wisdom": -2}
    }
}

# Function to get a status by ID
func get_status_by_id(id: int) -> Dictionary:
    if statuses.has(id):
        return statuses[id]
    else:
        return {}

# Function to get all status IDs
func get_all_status_ids() -> Array:
    return statuses.keys()

# Example usage in a character script
func apply_status_to_character(character, status_id: int):
    var status = get_status_by_id(status_id)
    if status:
        for stat in status["modifiers"]:
            character.stats[stat] += status["modifiers"][stat]
        character.character_statuses.append({"id": status_id, "name": status["name"], "description": status["description"]})