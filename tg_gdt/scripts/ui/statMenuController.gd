extends VBoxContainer

@onready var playerName = $HBoxContainer/playerName
@onready var goldCounter = $goldCounter

var playername: String
var gold: String

func _ready():
	update_player_name()

func update_player_name():
	playerName.text = "Guildmaster " + playername

func update_gold():
	goldCounter.text = "Gold: " + gold
