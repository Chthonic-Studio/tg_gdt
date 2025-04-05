extends Node

enum MissionStatus { LISTED, WAITING_FOR_ADVENTURERS, IN_PROGRESS }

var mission_id: String = ""
var title: String = ""
var description: String = ""
var rank: String = ""
var rewards: Dictionary = {}
var time_to_complete: int = 0
var stages: Array = []
var status: MissionStatus = MissionStatus.LISTED

func _ready():
	print("Mission ready function initiated with ID: ", mission_id)  # Debug print
