extends Node

enum DungeonStatus { LISTED, DUNGEON_BREAK, WAITING_FOR_ADVENTURERS, SCOUTING, EXPLORATION, MEASUREMENT, CLEARING, BOSS_ROOM }

var dungeon_id: String = ""
var title: String = ""
var description: String = ""
var rank: String = ""
var rewards: Dictionary = {}
var time_to_complete: int = 0
var stages: Array = []
var status: DungeonStatus = DungeonStatus.LISTED
