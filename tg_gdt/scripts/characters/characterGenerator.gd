extends Node

# Load the attribute scripts
var Gender = preload("res://scripts/characters/gender.gd").new()
var Race = preload("res://scripts/characters/races.gd").new()
var Class = preload("res://scripts/characters/classes.gd").new()
var Traits = preload("res://scripts/characters/traits.gd").new()
var Personality = preload("res://scripts/characters/personality.gd").new()
var Backstory = preload("res://scripts/characters/backstory.gd").new()
var Names = preload("res://scripts/characters/names.gd").new()
var characterProfile = preload("res://scripts/characters/characterProfile.gd").new()

# Define base stats
var base_stats = {
    "Strength": 10,
    "Dexterity": 10,
    "Intelligence": 10,
    "Constitution": 10,
    "Courage": 10
}

# Function to generate a unique character
func generate_character() -> Node:
    var character = characterProfile.new()
    character.character_gender = Gender.get_random_gender()
    character.selected_race = Race.get_random_race()
    character.selected_class = Class.get_random_class()
    character.selected_traits = Traits.get_random_traits(3)
    character.selected_personality = Personality.get_random_personality()
    character.selected_backstory = Backstory.get_random_backstory()
    character.character_first_name = Names.generate_first_name(character.character_gender)
    character.character_last_name = Names.generate_last_name()
    character.age = randi() % 50 + 20  # Random age between 20 and 70
    character.gold = randi() % 100

    # Initialize stats
    character.calculate_stats()

    # Set the name of the node
    character.name = character.character_first_name + " " + character.character_last_name + " " + character.character_id

    return character

# Example usage
func _ready():
    var new_character = generate_character()
    add_child(new_character)
    print(new_character)