extends Node

# Preload MissionProfile and Message so they can be used in this script.
var MissionProfile = preload("res://scripts/guild/missionProfile.gd")
var Message = preload("res://scripts/guild/message.gd")

var rank_values = {"E": 1, "D": 2, "C": 3, "B": 4, "A": 5, "S": 6}

# global_day is now expected to be a continuous day count.
func simulate_daily_missions(global_day: int) -> void:
	# Loop over missions in WAITING_FOR_ADVENTURERS status.
	for mission in GameManager.active_missions:
		if mission.status == MissionProfile.MissionStatus.WAITING_FOR_ADVENTURERS:
			print("CHECKING: Mission ", mission.mission_id, " on global day ", global_day)
			var candidate = _check_candidates_for_mission(mission, global_day)
			if candidate != null:
				print("Candidate found: ", candidate.name, " for mission ", mission.mission_id)
				_start_mission(mission, candidate, global_day)
			else:
				print("DEBUG: No candidate accepted mission ", mission.mission_id, " on global day ", global_day)
	# Resolve missions that are due.
	_resolve_due_missions(global_day)

func _check_candidates_for_mission(mission, global_day: int):
	# Check eligible solo adventurers.
	for adventurer in GameManager.characters:
		if _is_adventurer_eligible(adventurer, mission, global_day):
			var chance = 0.1  # base 10% chance
			# For missions of rank E, if the adventurer is also rank E, make it 5 times more likely.
			if mission.rank == "E" and adventurer.rank == "E":
				chance *= 5.0
			var roll = randf()
			print("DEBUG: Adventurer ", adventurer.name, " checked for mission ", mission.mission_id,
				" -> Calculated Chance: ", chance, " Roll: ", roll)
			if roll < chance:
				print("DEBUG: Adventurer ", adventurer.name, " ACCEPTS mission ", mission.mission_id)
				return adventurer
			else:
				print("DEBUG: Adventurer ", adventurer.name, " fails roll for mission ", mission.mission_id)
	# Check eligible parties.
	for party in GameManager.parties:
		if _is_party_eligible(party, mission, global_day):
			var roll = randf()
			print("DEBUG: Party ", party.party_name, " checked for mission ", mission.mission_id,
				" -> Fixed Chance: 0.1, Roll: ", roll)
			if roll < 0.1:
				print("DEBUG: Party ", party.party_name, " ACCEPTS mission ", mission.mission_id)
				return party
			else:
				print("DEBUG: Party ", party.party_name, " fails roll for mission ", mission.mission_id)
	return null

func _is_adventurer_eligible(adventurer, mission, global_day: int) -> bool:
	if adventurer.has_meta("busy_until"):
		var busy_until = adventurer.get_meta("busy_until")
		if global_day < busy_until:
			print("DEBUG: Adventurer ", adventurer.name, " is busy until ", busy_until, " for mission ", mission.mission_id)
			return false
	if mission.rank == "A" or mission.rank == "S":
		print("DEBUG: Mission ", mission.mission_id, " is rank ", mission.rank, " which is not available for solo adventurers")
		return false
	if mission.rank in ["B", "C", "D"]:
		var adv_rank_val = rank_values.get(adventurer.rank, 0)
		var mission_rank_val = rank_values.get(mission.rank, 0)
		if adv_rank_val <= mission_rank_val:
			print("DEBUG: Adventurer ", adventurer.name, " (rank ", adventurer.rank, "=", adv_rank_val, 
				  ") does not exceed mission ", mission.mission_id, " rank (", mission.rank, "=", mission_rank_val, ")")
			return false
	return true

func _is_party_eligible(party, mission, global_day: int) -> bool:
	if party.has_meta("busy_until"):
		var busy_until = party.get_meta("busy_until")
		if global_day < busy_until:
			print("DEBUG: Party ", party.party_name, " is busy until ", busy_until, " for mission ", mission.mission_id)
			return false
	if (rank_values[mission.rank] - rank_values[party.party_rank]) >= 2:
		print("DEBUG: Party ", party.party_name, " (rank ", party.party_rank, ") does not meet rank requirements for mission ", mission.mission_id, " (mission rank: ", mission.rank, ")")
		return false
	return true

# Mark the mission as accepted and store the participant.
func _start_mission(mission, participant, global_day: int) -> void:
	mission.status = MissionProfile.MissionStatus.IN_PROGRESS
	mission.start_day = global_day
	mission.resolution_day = global_day + mission.time_to_complete
	mission.participant = participant  # Save the accepted participant.
	
	# Mark the participant as busy until resolution day plus a 15-day cooldown.
	var busy_until = mission.resolution_day + 15
	participant.set_meta("busy_until", busy_until)
	
	GameManager.emit_signal("update_mission_list", GameManager.missions)
	GameManager.emit_signal("update_active_mission_list", GameManager.active_missions)
	print("DEBUG: Mission ", mission.mission_id, " started by ", participant.name, " on global day ", global_day, " and participant will be busy until global day ", busy_until)
	LogManager.add_log(participant.name + " have accepted the mission '" + mission.title + "' and departed to complete it!")

# Resolve missions that have reached or passed their resolution day.
func _resolve_due_missions(global_day: int) -> void:
	for mission in GameManager.active_missions.duplicate():
		if mission.status == MissionProfile.MissionStatus.IN_PROGRESS and global_day >= mission.resolution_day:
			print("DEBUG: Mission ", mission.mission_id, " is due for resolution on global day ", global_day)
			_resolve_mission(mission, global_day)

# Resolve a mission (calculate success chance, process rewards/failures).
func _resolve_mission(mission, _global_day: int) -> void:
	var participant = mission.participant
	var base_success = _get_base_success_chance(mission.rank)
	var bonus = 0.0
	if participant in GameManager.characters:
		var stat_sum = _sum_main_stats(participant)
		bonus = _calculate_bonus(stat_sum)
		print("DEBUG: For adventurer ", participant.name, ", stat sum: ", stat_sum, " gives bonus: ", bonus)
	else:
		# For a party, compute the average of main stats among members.
		var total = 0
		var count = 0
		for member_id in participant.members:
			var member = _get_character_by_id(member_id)
			if member:
				total += _sum_main_stats(member)
				count += 1
		if count > 0:
			bonus = _calculate_bonus(total / count)
			print("DEBUG: For party ", participant.party_name, ", average stat bonus: ", bonus)
	var success_chance = base_success + bonus
	if success_chance > 100:
		success_chance = 100
	print("DEBUG: Resolving mission ", mission.mission_id, " with base success: ", base_success, " and bonus: ", bonus, " => final success chance: ", success_chance, "%")
	if randf() * 100 <= success_chance:
		print("DEBUG: Mission ", mission.mission_id, " RESULT: SUCCESS")
		_mission_success(mission)
	else:
		print("DEBUG: Mission ", mission.mission_id, " RESULT: FAILURE")
		_mission_failure(mission)
	GameManager.active_missions.erase(mission)
	GameManager.emit_signal("update_active_mission_list", GameManager.active_missions)

# Base success chance by mission rank.
func _get_base_success_chance(mission_rank: String) -> float:
	match mission_rank:
		"E": return 80.0
		"D": return 70.0
		"C": return 60.0
		"B": return 50.0
		"A": return 40.0
		"S": return 30.0
	return 0.0

# Sum the main stats (Strength, Agility, Constitution, Wisdom, Intelligence, Charisma) of an adventurer.
func _sum_main_stats(entity) -> int:
	var s = entity.stats
	return s.get("Strength", 0) + s.get("Agility", 0) + s.get("Constitution", 0) + s.get("Wisdom", 0) + s.get("Intelligence", 0) + s.get("Charisma", 0)

# Calculate bonus success chance: for every 5 points above 50, add 5%.
func _calculate_bonus(stat_sum: float) -> float:
	if stat_sum <= 50:
		return 0.0
	var bonus_steps = int((stat_sum - 50) / 5)
	return bonus_steps * 5.0

# Process mission success rewards.
func _mission_success(mission) -> void:
	var participant = mission.participant
	var exp_reward = _get_experience_reward(mission.rank)
	if participant in GameManager.characters:
		participant.add_experience(exp_reward)
		GameManager.add_message(Message.MessageType.NOTIFICATION, {"text": "Adventurer " + participant.character_fullName + " succeeded in mission " + mission.title})
	else:
		var party_exp = int(exp_reward / 2)
		for member_id in participant.members:
			var member = _get_character_by_id(member_id)
			if member:
				member.add_experience(party_exp)
		GameManager.add_message(Message.MessageType.NOTIFICATION, {"text": "Party " + participant.party_name + " succeeded in mission " + mission.title})
	if participant.has_method("add_log_entry"):
		participant.add_log_entry("Mission " + mission.title + " succeeded on global day " + str(mission.resolution_day))
	
	# ADDED CODE: Award reward items to player's inventory.
	# Ensure that the Inventory node path is correct.
	for reward in mission.item_rewards:
		# Each reward is a dictionary with "item_id" and "quantity" keys.
		Inventory.add_item(reward["item_id"], reward["quantity"])
	print("DEBUG: Rewards added to inventory: ", mission.item_rewards)
	if participant in GameManager.characters:
		LogManager.add_log(participant.character_fullName + " has returned successful! They cleared the mission '" + mission.title + "'")
	else:
		LogManager.add_log(participant.party_name + " has returned successful! They cleared the mission '" + mission.title + "'")
	

# Process mission failure: each participant rolls a 50% chance of dying.
func _mission_failure(mission) -> void:
	var participant = mission.participant
	if participant in GameManager.characters:
		if randf() < 0.5:
			_kill_character(participant)
	else:
		for member_id in participant.members:
			var member = _get_character_by_id(member_id)
			if member and randf() < 0.5:
				_kill_character(member)
	if participant in GameManager.characters:
		GameManager.add_message(Message.MessageType.NOTIFICATION, {"text": "Adventurer " + participant.character_fullName + " failed mission " + mission.title})
	else:
		GameManager.add_message(Message.MessageType.NOTIFICATION, {"text": "Party " + participant.party_name + " failed mission " + mission.title})
	if participant.has_method("add_log_entry"):
		participant.add_log_entry("Mission " + mission.title + " failed on global day " + str(mission.resolution_day))
	LogManager.add_log(participant + "has returned defeated... They failed to clear the mission '" + mission.title + "'")

# Mark a character as dead.
func _kill_character(character) -> void:
	print("DEBUG: Character ", character.character_fullName, " has died.")
	LogManager.add_log("We are sorry to let you know that " + character.character_fullName + " has sadly perished")
	GameManager.characters.erase(character)
	GameManager.dead_characters.append(character)

# Experience rewards per mission rank for solo adventurers.
func _get_experience_reward(mission_rank: String) -> int:
	match mission_rank:
		"E": return 50
		"D": return 60
		"C": return 70
		"B": return 80
		"A": return 90
		"S": return 100
	return 0

# Helper: retrieve a character by its ID from GameManager.characters.
func _get_character_by_id(character_id: String):
	for character in GameManager.characters:
		if character.character_id == character_id:
			return character
	return null
