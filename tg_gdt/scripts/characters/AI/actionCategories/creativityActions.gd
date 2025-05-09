extends Node

class_name CreativityActions

func craft_items(character):
    print(character.character_fullName, "is crafting an item")
    
func crowd_performing(character):
    print(character.character_fullName, "is performing for a crowd")

func sculpting(character):
    print(character.character_fullName, "is sculpting a masterpiece.")

func singing(character):
    print(character.character_fullName, "is singing a beautiful song.")

func poetry(character):
    print(character.character_fullName, "is writing a poem.")

func playwriting(character):
    print(character.character_fullName, "is writing a play.")

func gardening(character):
    print(character.character_fullName, "is gardening.")

func cooking(character):
    print(character.character_fullName, "is cooking a delicious meal.")
    
func composing(character):
    print(character.character_fullName, "is composing a soulful song.")
