extends Node

var personalities = ["Cheerful", "Gloomy", "Aggressive", "Calm"]

func get_random_personality() -> String:
    return personalities[randi() % personalities.size()]