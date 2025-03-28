extends VBoxContainer

var game_manager: GameManager

@onready var MoraleBar = $mainStatsBars/mainStatsBarContainer/moraleBar
@onready var ReputationBar = $mainStatsBars/mainStatsBarContainer/reputationBar
@onready var InfluenceBar = $mainStatsBars/mainStatsBarContainer/influenceBar
@onready var SupportBar = $mainStatsBars/mainStatsBarContainer/supportBar
@onready var PrestigeBar = $mainStatsBars/mainStatsBarContainer/prestigeBar

func _ready():
	update_progress_bars()

# Function to update the progress bars
func update_progress_bars():
	ReputationBar = GameManager.reputation
	MoraleBar = GameManager.morale
	InfluenceBar = GameManager.influence
	SupportBar = GameManager.adventurer_support
	PrestigeBar = GameManager.guild_prestige
	
# Function to be called when stats are modified
func on_stat_modified():
	update_progress_bars()
