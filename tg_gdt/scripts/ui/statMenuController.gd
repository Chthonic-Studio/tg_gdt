extends VBoxContainer

@onready var playerName = $playerNameContainer/playerName
@onready var goldCounter = $goldCounter

var playername: String = "Player"
var gold: String

func _ready():
	playername = "Player"
	gold = str(GameManager.gold)
	GameManager.connect("gold_spent", Callable(self, "update_gold"))
	update_player_name()
	update_gold()

func update_player_name():
	playerName.text = ("Guildmaster " + playername)

func update_gold():
	gold = str(GameManager.gold)
	goldCounter.text = ("Gold: " + gold)

func _process(_delta):
	update_gold()
