extends Node

var names = {
	"Human": {
		"Male": [
			"John", "Robert", "Michael", "William", "David", "Richard", "Charles",
			"Joseph", "Thomas", "Christopher", "Daniel", "Matthew", "Anthony", "Mark",
			"Paul", "Steven", "Andrew", "Kenneth", "George", "Joshua", "Kevin", "Brian",
			"Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Jacob", "Gary"
		],
		"Female": [
			"Mary", "Patricia", "Linda", "Barbara", "Elizabeth", "Jennifer", "Maria",
			"Susan", "Margaret", "Dorothy", "Lisa", "Nancy", "Karen", "Betty", "Helen",
			"Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Sarah",
			"Kimberly", "Deborah", "Jessica", "Shirley", "Cynthia", "Angela", "Melissa"
		],
		"Non-Binary": []
	},
	"Half-Elf": {
		"Male": [
			"Eldrin", "Felarion", "Galadon", "Aerendil", "Lorien", "Thalion", "Erlan",
			"Aelor", "Kael", "Rolen", "Evelis", "Olorin", "Elion", "Theron", "Aegir",
			"Varian", "Darius", "Ehrin", "Alaric", "Belion", "Cirdan", "Draven", "Faelar",
			"Galdor", "Haldor", "Ithil", "Jorim", "Korian", "Lyran", "Mythan"
		],
		"Female": [
			"Alariel", "Elaria", "Faela", "Galadriel", "Luthien", "Elvina", "Aerin",
			"Mellia", "Sariel", "Talindra", "Yavanna", "Zephyra", "Ara", "Brielle",
			"Caelia", "Delya", "Elora", "Fayra", "Gwyneth", "Halina", "Isolde", "Jasmine",
			"Kaelina", "Liora", "Meliana", "Naia", "Ophelia", "Peri", "Quenya", "Rielle"
		],
		"Non-Binary": []
	},
	"Dwarf": {
		"Male": [
			"Thorin", "Balin", "Dwalin", "Oin", "Gloin", "Bifur", "Bofur", "Bombur",
			"Dori", "Nori", "Ori", "Fundin", "Durin", "Gror", "Thrain", "Thror", "Modi",
			"Lofar", "Harn", "Rurik", "Kor", "Gim", "Kil", "Marn", "Furin", "Vorin",
			"Olric", "Jorin", "Rudor", "Farlan"
		],
		"Female": [
			"Dis", "Hilda", "Astrid", "Helga", "Sigrid", "Inga", "Freya", "Gretchen",
			"Yara", "Ragna", "Solveig", "Lena", "Marta", "Thora", "Gerda", "Elin", "Ulla",
			"Sif", "Liva", "Dagna", "Ida", "Roar", "Mira", "Olga", "Ulrica", "Elke", "Arna",
			"Berta", "Freda", "Gunna"
		],
		"Non-Binary": []
	},
	"Elf": {
		"Male": [
			"Aragorn", "Legolas", "Elrond", "Thranduil", "Finrod", "Glorfindel", "Ecthelion",
			"Celebrimbor", "Fingolfin", "Erestor", "Amdir", "Eöl", "Imrahil", "Maeglin",
			"Orodreth", "Amroth", "Círdan", "Turgon", "Romendacil", "Angrod", "Haldir",
			"Rúmil", "Voronwë", "Eärendil", "Finarfin", "Galdor", "Eirien", "Nimrodel",
			"Elladan", "Elrohir"
		],
		"Female": [
			"Arwen", "Galadriel", "Lúthien", "Celebrían", "Finduilas", "Idril", "Melian",
			"Nimrodel", "Eärwen", "Aredhel", "Elwing", "Míriel", "Anaire", "Alatariel",
			"Elenwë", "Ithilwen", "Laurelin", "Nessa", "Nienor", "Rána", "Seraphine",
			"Tauriel", "Yavanna", "Zimraphel", "Aerin", "Eleniel", "Fionwe", "Hiril",
			"Isilme", "Nimriel"
		],
		"Non-Binary": []
	},
	"Halfling": {
		"Male": [
			"Frodo", "Samwise", "Peregrin", "Meriadoc", "Hamfast", "Filibert", "Roscoe",
			"Tobin", "Alton", "Bingo", "Cade", "Doderic", "Elwin", "Finnan", "Gimble",
			"Harfoot", "Ira", "Jolly", "Kipper", "Largo", "Milo", "Nimble", "Odo",
			"Pip", "Quentin", "Rascal", "Silas", "Titch", "Ulric", "Viggo"
		],
		"Female": [
			"Rosie", "Primula", "Marigold", "Ruby", "Daisy", "Lobelia", "Esmeralda",
			"Poppy", "Bree", "Clover", "Elanor", "Frolic", "Glimmer", "Honey", "Ivy",
			"Jasmine", "Kerry", "Lily", "Mabel", "Nimblet", "Opal", "Peony", "Queenie",
			"Rory", "Saffron", "Tansy", "Uma", "Violet", "Winnie", "Xara"
		],
		"Non-Binary": []
	},
	"Half-Orc": {
		"Male": [
			"Gorbag", "Ugluk", "Azog", "Bolg", "Lugdush", "Grishnakh", "Snaga", "Mauhur",
			"Ruguk", "Throkk", "Durg", "Karg", "Zug", "Brak", "Ghash", "Hruk", "Muk",
			"Narzug", "Orgor", "Rok", "Sug", "Thrag", "Varg", "Warg", "Yug", "Zog", "Bog",
			"Crak", "Durk", "Frog", "Muzg"
		],
		"Female": [
			"Lugdush", "Grishna", "Sharga", "Ugluka", "Azoga", "Bolgina", "Mauhura",
			"Rugula", "Throka", "Durga", "Karga", "Zuga", "Braka", "Ghasha", "Hruka",
			"Muka", "Narzuga", "Orgora", "Roka", "Suga", "Thraga", "Varga", "Warga",
			"Yuga", "Zoga", "Bogina", "Craka", "Durka", "Froga", "Grisha", "Lugga"
		],
		"Non-Binary": []
	}
}

var last_names = {
	"Human": [
		"Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
		"Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
		"Thomas", "Taylor", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
		"White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson"
	],
	"Half-Elf": [
		"Evenwood", "Silverleaf", "Moonbrook", "Dawnstar", "Lightfoot", "Windrunner",
		"Stargazer", "Sunwhisper", "Duskblade", "Mistwalker", "Oakenshade", "Shadowgrove",
		"Amberfield", "Goldbranch", "Swiftleaf", "Brightwood", "Nightbreeze", "Frostwind",
		"Stormcaller", "Ironglade", "Rivermoon", "Snowrise", "Wildflower", "Starfallow",
		"Greenbriar", "Clearwater", "Duskwind", "Fairgrove", "Brightbrook"
	],
	"Dwarf": [
		"Ironfoot", "Stonehelm", "Oakenshield", "Battlehammer", "Goldbeard", "Coppervein",
		"Strongaxe", "Deepdelver", "Ironfist", "Stonebreaker", "Hammerfall", "Grimforge",
		"Bronzehelm", "Rocksplitter", "Earthguard", "Blackanvil", "Frostbeard", "Boulder",
		"Deepstone", "Steelmantle", "Goldmantle", "Grudgebearer", "Oathkeeper", "Ironshield",
		"Stoneheart", "Mithrilborn", "Deepbrow", "Hammerhand", "Grimstone", "Anvilborn"
	],
	"Elf": [
		"Evenstar", "Silvermoon", "Dawnstrider", "Brightspear", "Goldleaf", "Moonwhisper",
		"Shadowdancer", "Stormwind", "Lightweaver", "Starbreeze", "Sunrider", "Mistvale",
		"Duskwood", "Riverheart", "Silverbark", "Windshadow", "Celestia", "Frostleaf",
		"Skydancer", "Nightfall", "Aurorawhisper", "Eversong", "Wildflower", "Moonstream",
		"Sunstone", "Starglow", "Brightvale", "Dreamweaver", "Lightriver", "Elderwood"
	],
	"Halfling": [
		"Goodbarrel", "Greenbottle", "Tealeaf", "Underhill", "Bramblefoot", "High-hill",
		"Farfoot", "Smallburrow", "Quickwhistle", "Leafrunner", "Windfoot", "Merrythorn",
		"Hilltopple", "Brandybuck", "Tunnelly", "Oakshield", "Amberhill", "Softstep",
		"Nimbletread", "Cozycorner", "Swiftburrow", "Rollingbarrel", "Sunmeadow", "Lightfoot",
		"Brookside", "Breezeborn", "Meadowlark", "Hillgrove", "Cloverfield", "Dustywander"
	],
	"Half-Orc": [
		"Bloodfist", "Skullcrusher", "Bonegnasher", "Ironmaw", "Darkskull", "Grimtooth",
		"Blackheart", "Fleshrender", "Ragecleaver", "Doomhammer", "Graveborn", "Ashmaw",
		"Redscar", "Steelmaw", "Mortalbane", "Nightcleaver", "Thornfist", "Bitterblade",
		"Warfist", "Ironhide", "Deathreaper", "Skullsplitter", "Rageborn", "Grimfang",
		"Bonebreaker", "Fleshsunder", "Crushbane", "Ruthless", "Savageclaw", "Goremaster"
	]
}

func generate_first_name(race: String, gender: String) -> String:
	var gender_names = names[race].get(gender, [])
	if gender == "Non-Binary":
		gender_names += names[race]["Male"] + names[race]["Female"]
	return gender_names[randi() % gender_names.size()]

func generate_last_name(race: String) -> String:
	return last_names[race][randi() % last_names[race].size()]
