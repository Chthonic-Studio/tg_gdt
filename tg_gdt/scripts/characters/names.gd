extends Node

var names = {
    "Human": {
        "Male": ["John", "Robert", "Michael"],
        "Female": ["Mary", "Patricia", "Linda"],
        "Non-Binary": []
    },
    "Elf": {
        "Male": ["Aragorn", "Legolas", "Elrond"],
        "Female": ["Arwen", "Galadriel", "Tauriel"],
        "Non-Binary": ["Finrod", "Melian", "Aredhel"]
    },
    "Dwarf": {
        "Male": ["Thorin", "Balin", "Dwalin"],
        "Female": ["Dis", "Hilda", "Gimra"],
        "Non-Binary": []
    },
    "Orc": {
        "Male": ["Gorbag", "Ugluk", "Azog"],
        "Female": ["Lugdush", "Grishnakh", "Shagrat"],
        "Non-Binary": []
    }
}

var last_names = {
    "Human": ["Smith", "Johnson", "Williams"],
    "Elf": ["Baggins", "Brandybuck", "Took"],
    "Dwarf": ["Ironfoot", "Stonehelm", "Oakenshield"],
    "Orc": ["Bloodfist", "Skullcrusher", "Bonegnasher"]
}   

func generate_first_name(race: String, gender: String) -> String:
    var gender_names = names[race].get(gender, [])
    if gender == "Non-Binary":
        gender_names += names[race]["Male"] + names[race]["Female"]
    return gender_names[randi() % gender_names.size()]

func generate_last_name(race: String) -> String:
    return last_names[race][randi() % last_names[race].size()]