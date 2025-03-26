extends Node

var backstories = [
    {"name": "Orphan", "modifiers": {"Courage": 3, "Empathy": 2}},
    {"name": "Noble", "modifiers": {"Charisma": 5, "Intelligence": 2}},
    # Add more backstories as needed
]

func get_random_backstory() -> Dictionary:
    return backstories[randi() % backstories.size()]