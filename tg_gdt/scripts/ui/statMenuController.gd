extends VBoxContainer

@onready var playerName = $playerNameContainer/playerName
@onready var goldCounter = $goldCounter

var playername: String = "Player"
var gold: String

func _ready():
	playername = "Player"
	gold = str(GameManager.gold)
	update_player_name()

func update_player_name():
	playerName.text = ("Guildmaster " + playername)

func update_gold():
	goldCounter.text = ("Gold: " + gold)
