extends Node

# Load the attribute scripts
var Gender = preload("res://scripts/characters/gender.gd").new()
var Race = preload("res://scripts/characters/races.gd").new()
var Class = preload("res://scripts/characters/classes.gd").new()
var Traits = preload("res://scripts/characters/traits.gd").new()
var Personality = preload("res://scripts/characters/personality.gd").new()
var Backstory = preload("res://scripts/characters/backstory.gd").new()
var Names = preload("res://scripts/characters/names.gd").new()
var CharacterProfileScene = preload("res://character.tscn")

# Define base stats
var base_stats = {
	"Strength": 10,
	"Dexterity": 10,
	"Intelligence": 10,
	"Constitution": 10,
	"Courage": 10
}

# Function to generate a unique character
func generate_character() -> Node2D:
	var character = CharacterProfileScene.instantiate() as Node2D

	character.character_gender = Gender.get_random_gender()
	character.selected_race = Race.get_random_race()
	character.selected_class = Class.get_random_class()
	character.selected_traits = Traits.get_random_traits(3)
	character.selected_personality = Personality.get_random_personality()
	character.selected_backstory = Backstory.get_random_backstory() 
	character.character_first_name = Names.generate_first_name(character.selected_race["name"], character.character_gender)
	character.character_last_name = Names.generate_last_name(character.selected_race["name"])
	character.age = randi_range (18, 30)  
	character.gold = randi_range (10, 100)

	# Initialize stats
	character.calculate_stats()

	# Set the name of the node
	character.name = character.character_first_name + " " + character.character_last_name + " " + character.character_id

	return character
