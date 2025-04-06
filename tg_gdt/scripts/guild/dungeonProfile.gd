extends Node

var Message = preload("res://scripts/guild/message.gd")

enum DungeonStatus { LISTED, DUNGEON_BREAK, WAITING_FOR_ADVENTURERS, SCOUTING, EXPLORATION, MEASUREMENT, CLEARING, BOSS_ROOM }

var dungeon_id: String = ""
var title: String = ""
var description: String = ""
var rank: String = ""
var rewards: Dictionary = {}
var stages: Array = []
var status: DungeonStatus = DungeonStatus.LISTED

func init(_dungeon_id: String, _title: String, _description: String, _rank: String, _rewards: Dictionary, _stages: Array, _status: DungeonStatus = DungeonStatus.LISTED):
	dungeon_id = _dungeon_id
	title = _title
	description = _description
	rank = _rank
	rewards = _rewards
	stages = _stages
	status = _status
	return self

func _simulate_dungeon_notification():
	GameManager.add_message(Message.MessageType.DUNGEON_NOTIFICATION)
