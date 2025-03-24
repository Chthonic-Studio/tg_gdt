extends Node

var genders = ["Male", "Female", "Non-Binary"]

func get_random_gender() -> String:
    return genders[randi() % genders.size()]