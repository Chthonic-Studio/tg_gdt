extends Node

var male_names = ["Aragorn", "Legolas", "Gimli"]
var female_names = ["Arwen", "Eowyn", "Galadriel"]
var non_binary_names = ["Alex", "Jordan", "Taylor"]

func generate_first_name(gender: String) -> String:
    if gender == "Male":
        return male_names[randi() % male_names.size()]
    elif gender == "Female":
        return female_names[randi() % female_names.size()]
    else:
        return non_binary_names[randi() % non_binary_names.size()]

func generate_last_name() -> String:
    var last_names = ["Baggins", "Brandybuck", "Took"]
    return last_names[randi() % last_names.size()]