extends Node

var classes = {
    "Warrior": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [3, 7], 
            "Strength": [9, 14], 
            "Agility": [7, 12], 
            "Constitution": [10, 14], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 12]
        }
    },
    "Archer": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Rogue": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [12, 16], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Wizard": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Priest": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [12, 20], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [10, 15], 
            "Intelligence": [8, 12], 
            "Charisma": [8, 12]
        }
    },
    "Warlock": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [15, 25], 
            "Strength": [6, 12], 
            "Agility": [5, 10], 
            "Constitution": [7, 12], 
            "Wisdom": [8, 12], 
            "Intelligence": [10, 15], 
            "Charisma": [8, 12]
        }
    },
    "Paladin": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [10, 15], 
            "Strength": [10, 15], 
            "Agility": [5, 10], 
            "Constitution": [12, 16], 
            "Wisdom": [8, 12], 
            "Intelligence": [5, 10], 
            "Charisma": [8, 12]
        }
    },
    "Monk": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [8, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [10, 15], 
            "Intelligence": [8, 12], 
            "Charisma": [5, 10]
        }
    },
    "Sorcerer": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [8, 12], 
            "Intelligence": [12, 18], 
            "Charisma": [10, 15]
        }
    },
    "Battle Master": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [5, 10], 
            "Strength": [10, 15], 
            "Agility": [7, 12], 
            "Constitution": [12, 16], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Cavalier": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [5, 10], 
            "Strength": [10, 15], 
            "Agility": [5, 10], 
            "Constitution": [10, 15], 
            "Wisdom": [8, 12], 
            "Intelligence": [5, 10], 
            "Charisma": [8, 12]
        }
    },
    "Gladiator": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [3, 7], 
            "Strength": [10, 15], 
            "Agility": [8, 12], 
            "Constitution": [12, 16], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Magic Swordsman": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [10, 15], 
            "Strength": [8, 12], 
            "Agility": [8, 12], 
            "Constitution": [10, 15], 
            "Wisdom": [8, 12], 
            "Intelligence": [8, 12], 
            "Charisma": [8, 12]
        }
    },
    "Rune Knight": {
        "weight": 0.2, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [10, 15], 
            "Strength": [10, 15], 
            "Agility": [5, 10], 
            "Constitution": [12, 16], 
            "Wisdom": [8, 12], 
            "Intelligence": [8, 12], 
            "Charisma": [5, 10]
        }
    },
    "Ronin": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [5, 10], 
            "Strength": [10, 15], 
            "Agility": [10, 15], 
            "Constitution": [10, 15], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Ranger": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [8, 12], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Hunter": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [8, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Tracker": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [8, 12], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Assassin": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [8, 12], 
            "Agility": [12, 16], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Scout": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [8, 12], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Swashbuckler": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [8, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },    
    "Thief": {
        "weight": 1.0, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [5, 10], 
            "Strength": [7, 12], 
            "Agility": [12, 16], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Bard": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [10, 15], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [10, 15]
        }
    },
    "Sword Bard": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [10, 15], 
            "Strength": [8, 12], 
            "Agility": [10, 15], 
            "Constitution": [10, 15], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [10, 15]
        }
    },
    "Bladecaster": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [12, 20], 
            "Strength": [8, 12], 
            "Agility": [10, 15], 
            "Constitution": [8, 12], 
            "Wisdom": [8, 12], 
            "Intelligence": [10, 15], 
            "Charisma": [5, 10]
        }
    },
    "Abjurer": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Conjurer": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Illusionist": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Necromancer": {
        "weight": 0.2, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Invoker": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [8, 15], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [6, 10], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "War Mage": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [12, 20], 
            "Strength": [8, 12], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Artificer": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [10, 15], 
            "Strength": [7, 12], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [5, 10], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Barbarian": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [3, 7], 
            "Strength": [10, 15], 
            "Agility": [7, 12], 
            "Constitution": [12, 16], 
            "Wisdom": [5, 10], 
            "Intelligence": [5, 10], 
            "Charisma": [5, 10]
        }
    },
    "Alchemist": {
        "weight": 0.6, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "Artillerist": {
        "weight": 0.2, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [15, 25], 
            "Strength": [8, 12], 
            "Agility": [5, 10], 
            "Constitution": [10, 15], 
            "Wisdom": [10, 15], 
            "Intelligence": [12, 18], 
            "Charisma": [5, 10]
        }
    },
    "War Cleric": {
        "weight": 0.4, 
        "stat_ranges": {
            "Health": [12, 20], 
            "Mana": [12, 20], 
            "Strength": [10, 15], 
            "Agility": [5, 10], 
            "Constitution": [10, 15], 
            "Wisdom": [10, 15], 
            "Intelligence": [8, 12], 
            "Charisma": [5, 10]
        }
    },
    "Druid": {
        "weight": 0.8, 
        "stat_ranges": {
            "Health": [10, 18], 
            "Mana": [15, 25], 
            "Strength": [5, 10], 
            "Agility": [5, 10], 
            "Constitution": [8, 12], 
            "Wisdom": [10, 15], 
            "Intelligence": [8, 12], 
            "Charisma": [5, 10]
        }
    },
    "Fallen Paladin": {
        "weight": 0.2, 
        "stat_ranges": {
            "Health": [15, 25], 
            "Mana": [10, 15], 
            "Strength": [10, 15], 
            "Agility": [5, 10], 
            "Constitution": [12, 16], 
            "Wisdom": [8, 12], 
            "Intelligence": [8, 12], 
            "Charisma": [5, 10]
        }
    }}

func get_random_class() -> Dictionary:
    var total_weight = 0.0
    for charClass in classes.values():
        total_weight += charClass.weight
    
    var random_weight_point = randf() * total_weight
    
    for charClass_name in classes.keys():
        if random_weight_point < classes[charClass_name].weight:
            return {"name": charClass_name, "stat_ranges": classes[charClass_name].stat_ranges}
        random_weight_point -= classes[charClass_name].weight
    
    return {}

func generate_class_stats(class_ranges: Dictionary) -> Dictionary:
    var stats = {}
    for stat in class_ranges.keys():
        var range = class_ranges[stat]
        stats[stat] = randi_range(range[0], range[1])
    return stats