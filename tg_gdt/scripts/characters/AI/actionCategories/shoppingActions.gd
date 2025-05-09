extends Node

class_name ShoppingActions

func buy_items(character):
    print(character.character_fullName, "went to buy some items")

func sell_items(character):
    print(character.character_fullName, "went to sell some items")

func barter(character):
    print(character.character_fullName, "went to barter some items")

func comission_item(character):
    print(character.character_fullName, "went to commission an custom item")

func buy_gift(character):
    print(character.character_fullName, "went to buy a gift for someone")