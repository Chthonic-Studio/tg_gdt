extends Node

var backstories = ["Orphaned", "Noble", "Merchant", "Farmer"]

func get_random_backstory() -> String:
    return backstories[randi() % backstories.size()]