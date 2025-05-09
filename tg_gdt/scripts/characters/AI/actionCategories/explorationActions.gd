extends Node

class_name ExplorationActions

func visit_landmarks(character):
    print(character.character_fullName, "is visiting a known landmark")

func go_out_of_town(character):
    print(character.character_fullName, "is going out of town")

func treasure_hunt(character):
    print(character.character_fullName, "is going on a treasure hunt")

func go_to_local_festival(character):
    print(character.character_fullName, "is going to a local festival")

func tomb_raiding(character):
    print(character.character_fullName, "is going tomb raiding")

func map_environment(character):
    print(character.character_fullName, "is mapping the environment")
    