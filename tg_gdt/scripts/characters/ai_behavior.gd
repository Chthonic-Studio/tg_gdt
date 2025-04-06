extends Node

class_name AIBehavior

var Message = preload("res://scripts/guild/message.gd")

var last_action_day = 0  # Optional: used for debugging; per-character metadata is stored on the character.

func simulate_daily_action(character, current_day):
	# Assume character has a meta field "last_action_day" indicating the last day an action was taken.
	var last_day = 0
	if character.has_meta("last_action_day"):
		last_day = character.get_meta("last_action_day")
	
	var day_diff = current_day - last_day
	
	# If character is still within the cooldown period, do nothing.
	if day_diff < 10:
		return  # Still on cooldown
	
	# If between 10 and 30 days, roll the chance normally (1/10 chance).
	if day_diff < 30:
		if randi() % 10 != 0:
			return  # Chance failed, do nothing.
	else:
		# If 30 or more days have passed, force an immediate roll.
		# You may choose to set up a guaranteed chance by for example "forcing" the roll,
		# or you might just proceed regardless of the outcome check.
		# In this example, we simply bypass the chance check so that an action occurs.
		# Alternatively, you could roll normally and if it fails, trigger the action anyway.
		pass  # No chance check; go ahead with the action.
	
	# If the roll is successful or forced, update the last action day and simulate the action.
	character.set_meta("last_action_day", current_day)
	# Perform the character's action.
	perform_character_action(character)
	
func perform_character_action(character):
	# Implementation of the character action simulation. For example:
	print("Character " + character.name + " takes an action on day " + str(character.get_meta("last_action_day")))

func _build_dynamic_weighted_actions(character) -> Array:
	var actions = [
		"adjust_single_relationship",
		"simulate_fight",
		"try_couple",
		"send_mission_solo_message",
		"train_character",
		"commit_crime",
		"request_guild_support",
		"donate_to_guild",
		"increase_rank"
	]
	var weighted_actions = []
	for action in actions:
		var weight = get_dynamic_weight(action, character)
		if weight > 0:
			weighted_actions.append({"action": action, "weight": weight})
	return weighted_actions

func get_dynamic_weight(action: String, character) -> float:
	var empathy = character.stats.get("Empathy", 50)
	var aggression = character.stats.get("Aggression", 50)
	var confidence = character.stats.get("Confidence", 50)
	var discipline = character.stats.get("Discipline", 50)
	var evil = character.stats.get("Evil", 50)
	match action:
		"adjust_single_relationship":
			return 20.0 * clamp(empathy / 50.0, 0.5, 2.0)
		"simulate_fight":
			return 10.0 * clamp(aggression / 50.0, 0.5, 2.0)
		"try_couple":
			return 5.0 * clamp(confidence / 50.0, 0.5, 2.0)
		"send_mission_solo_message":
			return 5.0 * clamp(confidence / 50.0, 0.5, 2.0)
		"train_character":
			return 15.0 * clamp(discipline / 50.0, 0.5, 2.0)
		"commit_crime":
			if evil < 0:
				return 10.0 * clamp(abs(evil) / 50.0, 0.5, 2.0)
			else:
				return 0
		"request_guild_support":
			return 5.0
		"donate_to_guild":
			return 10.0
		"increase_rank":
			if character.experience > 800:
				return 5.0 * clamp(character.experience / 1000.0, 0.5, 2.0)
			return 0
		_:
			return 0

func _choose_weighted_action(weighted_actions: Array) -> String:
	var total_weight = 0.0
	for item in weighted_actions:
		total_weight += item.weight
	var rand_point = randf() * total_weight
	for item in weighted_actions:
		rand_point -= item.weight
		if rand_point <= 0:
			return item.action
	return weighted_actions[weighted_actions.size()-1].action

func _adjust_single_relationship(character, active_characters):
	if active_characters.size() <= 1:
		return
	var others = []
	for other in active_characters:
		if other != character:
			others.append(other)
	var selected_other = others[randi() % others.size()]
	var delta = randf_range(0, 3) * (character.stats.get("Empathy", 50) / 50.0)
	character.adjust_relationship(selected_other.character_id, delta)
	print(character.name, "improved their relationship with", selected_other.name)

func _simulate_fight(character, active_characters):
	var potential_opponents = []
	for other in active_characters:
		if other == character:
			continue
		var char_aggression = character.stats.get("Aggression", 50)
		var other_aggression = other.stats.get("Aggression", 50)
		if char_aggression > other_aggression:
			potential_opponents.append(other)
	if potential_opponents.size() > 0:
		var opponent = potential_opponents[randi() % potential_opponents.size()]
		if randi() % 100 < 50:
			character.adjust_relationship(opponent.character_id, 5)
			opponent.adjust_relationship(character.character_id, -5)
		else:
			character.adjust_relationship(opponent.character_id, -5)
			opponent.adjust_relationship(character.character_id, 5)
		print(character.name, "fought with", opponent.name)

func _try_couple(character, active_characters):
	# Assuming a "couple" property exists and is set to null if single.
	if character.couple == null:
		for other in active_characters:
			if other == character:
				continue
			# Check if other character is already coupled.
			if other.couple != null:
				continue
			var rel = character.relationships.get(other.character_id, 0)
			if rel > 70:
				# Form a couple.
				character.couple = other.character_id
				other.couple = character.character_id
				print(character.name, "and", other.name, "became a couple!")
				break

func _send_mission_solo_message(character):
	print(character.name, "wants to take a mission solo!")

func _train_character(character):
	var stat_keys = character.stats.keys()
	if stat_keys.size() > 0:
		var chosen_stat = stat_keys[randi() % stat_keys.size()]
		var improvement = randf_range(0.5, 2.0)
		character.stats[chosen_stat] += improvement
		print(character.name, "improved", chosen_stat, "by", improvement)

func _commit_crime(character):
	print(character.name, "committed a crime in secret!")
	character.stats["Evil"] = character.stats.get("Evil", 0) - randf_range(1, 3)

func _request_guild_support(character):
	# Randomly choose a type of support: "item", "gold", or "guild_building".
	var support_types = ["item", "gold", "guild_building"]
	var chosen_type = support_types[randi() % support_types.size()]
	var details = ""
	
	# If the support type is "item", check the character's inventory.
	if chosen_type == "item":
		var inventory = character.get_inventory_items()
		if inventory.size() > 0:
			var random_item = inventory[randi() % inventory.size()]
			details = "Item: " + random_item.name
		else:
			chosen_type = support_types[randi() % 2 + 1]  # picks index 1 or 2
	
	if chosen_type == "gold":
		var gold_amount = randi() % 51 + 50  # amount between 50 and 100.
		details = "Gold: " + str(gold_amount) + " gold"
	
	if chosen_type == "guild_building":
		var buildings = ["tavern", "training_grounds", "forge", "apothecary", "cartography", "enchantment"]
		var building = buildings[randi() % buildings.size()]
		var cost_modifier = randi() % 31 + 20  # cost modifier between 20 and 50.
		details = "Guild building: " + building + " with cost reduction of " + str(cost_modifier) + " for 3 months"
	
	var extra_info = {
		"requested_item": details,
		"adventurer_name": character.character_fullName
	}
	# Send the support request using Adventurer Support message type
	GameManager.add_message(Message.MessageType.ADVENTURER_SUPPORT, extra_info)
	
func _donate_to_guild(character):
	print(character.name, "donated to the guild!")
	# Since gold is defined on every character, we can simply check if they have any.
	if character.gold > 0:
		var donation = min(character.gold, int(randf_range(10, 50)))
		character.gold -= donation
		print(character.name, "donated", donation, "gold.")

func _increase_rank(character):
	# Assuming a "rank" property exists.
	# You might want to convert rank from a string to a numeric value for increasing rank properly.
	# For this example, we simply assign a new rank.
	if character.rank != null:
		# Increase rank (for simplicity, just appending a "+" here)
		character.rank += "+"
	else:
		character.rank = "E+"
	print(character.name, "increased their rank!")
