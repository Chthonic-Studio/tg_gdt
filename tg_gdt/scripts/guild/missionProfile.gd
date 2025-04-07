extends Node

enum MissionStatus { LISTED, WAITING_FOR_ADVENTURERS, IN_PROGRESS }

@export var mission_id: String = ""
@export var title: String = ""
@export var description: String = ""
@export var rank: String = ""
@export var rewards: Dictionary = {}
@export var time_to_complete: int = 0
@export var stages: Array = []
@export var status: MissionStatus = MissionStatus.LISTED

# Add the item_rewards property to store an array of item reward dictionaries
@export var item_rewards: Array = []

# New member variables for mission management
@export var start_day: int = 0
@export var resolution_day: int = 0
@export var participant = null

func _ready():
    print("Mission ready function initiated with ID: ", mission_id)