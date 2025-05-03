extends Node

class_name AIBehavior

# Preload external scripts:
var Message = preload("res://scripts/guild/message.gd")
var actionCalculations = preload("res://scripts/characters/AI/actionCalculations.gd").new()
var AI_Utilities = preload("res://scripts/characters/AI/ai_utilities.gd").new()

var last_action_day = 0  

# CALL THIS FUNCTION FROM THE DAILY SIMULATION OR AFTER AN ACTION COMPLETES.
func simulate_daily_action(character, current_day):
	# Check if character is still a valid instance.
	if character == null or not is_instance_valid(character):
		return

	# Update daily AI utility values
	update_daily_utilities(character)
	
	var totalDays = 30
	var last_day = 0
	if character.has_meta("last_action_day"):
		last_day = character.get_meta("last_action_day")
	
	var day_diff = current_day - last_day
	if day_diff < 0:
		day_diff += totalDays
	
	# If character is still within the cooldown period, do nothing.
	if day_diff < 10:
		return  # Still on cooldown
	
	# If between 10 and 30 days, roll the chance normally (1/10 chance).
	if day_diff < 30:
		if randi() % 10 != 0:
			return  # Chance failed, do nothing.
	else:
		# If 30 or more days have passed, force an immediate roll.
		pass

	# Update meta data for last action day and execute an action.
	character.set_meta("last_action_day", current_day)
	select_and_perform_action(character)

# New helper function that computes and stores the daily utility values.
func update_daily_utilities(character):
	# Create a dictionary (or update an existing one) to store the utilities.
	var utilities = {}

	utilities["creativityNeed"] = actionCalculations.creativity_calculateNeed(character.stats, character.ai_variables)
	utilities["creativityDesire"] = actionCalculations.creativity_calculateDesire(character.stats, character.ai_variables)
	utilities["creativityUtility"] = actionCalculations.creativity_calculateUtility(character.stats, character.ai_variables)
	
	utilities["explorationNeed"] = actionCalculations.exploration_calculateNeed(character.stats, character.ai_variables)
	utilities["explorationDesire"] = actionCalculations.exploration_calculateDesire(character.stats, character.ai_variables)
	utilities["explorationUtility"] = actionCalculations.exploration_calculateUtility(character.stats, character.ai_variables)

	utilities["helpingNeed"] = actionCalculations.helping_calculateNeed(character.stats, character.ai_variables)
	utilities["helpingDesire"] = actionCalculations.helping_calculateDesire(character.stats, character.ai_variables)
	utilities["helpingUtility"] = actionCalculations.helping_calculateUtility(character.stats, character.ai_variables)

	utilities["relaxationNeed"] = actionCalculations.relaxation_calculateNeed(character.stats, character.ai_variables)
	utilities["relaxationDesire"] = actionCalculations.relaxation_calculateDesire(character.stats, character.ai_variables)
	utilities["relaxationUtility"] = actionCalculations.relaxation_calculateUtility(character.stats, character.ai_variables)

	#utilities["restNeed"] = actionCalculations.rest_calculateNeed(character.stats, character.ai_variables)
	#utilities["restDesire"] = actionCalculations.rest_calculateDesire(character.stats, character.ai_variables)
	utilities["restingUtility"] = actionCalculations.rest_calculateUtility(character.stats, character.ai_variables)

	utilities["shoppingNeed"] = actionCalculations.shopping_calculateNeed(character.stats, character.ai_variables)
	utilities["shoppingDesire"] = actionCalculations.shopping_calculateDesire(character.stats, character.ai_variables)
	utilities["shoppingUtility"] = actionCalculations.shopping_calculateUtility(character.stats, character.ai_variables)

	utilities["trainingNeed"] = actionCalculations.training_calculateNeed(character.stats, character.ai_variables)
	utilities["trainingDesire"] = actionCalculations.training_calculateDesire(character.stats, character.ai_variables)
	utilities["trainingUtility"] = actionCalculations.training_calculateUtility(character.stats, character.ai_variables)

	utilities["socializationNeed"] = actionCalculations.socialization_calculateNeed(character.stats, character.ai_variables)
	utilities["socializationDesire"] = actionCalculations.socialization_calculateDesire(character.stats, character.ai_variables)
	utilities["socializationUtility"] = actionCalculations.socialization_calculateUtility(character.stats, character.ai_variables)

	utilities["spiritualityNeed"] = actionCalculations.spirituality_calculateNeed(character.stats, character.ai_variables)
	utilities["spiritualityDesire"] = actionCalculations.spirituality_calculateDesire(character.stats, character.ai_variables)
	utilities["spiritualityUtility"] = actionCalculations.spirituality_calculateUtility(character.stats, character.ai_variables)

	utilities["entertainmentNeed"] = actionCalculations.entertainment_calculateNeed(character.stats, character.ai_variables)
	utilities["entertainmentDesire"] = actionCalculations.entertainment_calculateDesire(character.stats, character.ai_variables)
	utilities["entertainmentUtility"] = actionCalculations.entertainment_calculateUtility(character.stats, character.ai_variables)

	utilities["studyingNeed"] = actionCalculations.studying_calculateNeed(character.stats, character.ai_variables)
	utilities["studyingDesire"] = actionCalculations.studying_calculateDesire(character.stats, character.ai_variables)
	utilities["studyingUtility"] = actionCalculations.studying_calculateUtility(character.stats, character.ai_variables)

	utilities["villainyNeed"] = actionCalculations.villainy_calculateNeed(character.stats, character.ai_variables)
	utilities["villainyDesire"] = actionCalculations.villainy_calculateDesire(character.stats, character.ai_variables)
	utilities["villainyUtility"] = actionCalculations.villainy_calculateUtility(character.stats, character.ai_variables)

	character.set_meta("current_utilities", utilities)

func select_and_perform_action(character):
	# Build a list of available weighted actions for the character.
	var weighted_actions = _build_dynamic_weighted_actions(character)
	if weighted_actions.size() == 0:
		print("No available actions for ", character.name)
		return
	var chosen_action = _choose_weighted_action(weighted_actions)
	
	# Execute the chosen action.
	match chosen_action:
		"adjust_single_relationship":
			_adjust_single_relationship(character, GameManager.characters)
		"simulate_fight":
			_simulate_fight(character, GameManager.characters)
		"try_couple":
			_try_couple(character, GameManager.characters)
		"send_mission_solo_message":
			_send_mission_solo_message(character)
		"train_character":
			_train_character(character)
		"commit_crime":
			_commit_crime(character)
		"request_guild_support":
			_request_guild_support(character)
		"donate_to_guild":
			_donate_to_guild(character)
		"increase_rank":
			_increase_rank(character)
		_:
			print("Unknown action: ", chosen_action)

	character.update_ai_after_action()  

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
		# Use a new helper function that uses utility calculation from actionCalculations
		var weight = _calculate_action_weight(action, character)
		if weight > 0:
			weighted_actions.append({"action": action, "weight": weight})
	return weighted_actions

# New helper function: calculates weight using action utilities.
func _calculate_action_weight(action: String, character) -> float:
	var base_weight = 1.0   # default multiplier if no specific calculation
	
	match action:
		"train_character":
			# Call training utility from actionCalculations and scale appropriately.
			var utility = actionCalculations.training_calculateUtility(character.stats, character.ai_variables)
			base_weight = 15.0 * clamp(utility / 100.0, 0.5, 2.0)
		"commit_crime":
			var utility = actionCalculations.commit_crime_calculateUtility(character.stats, character.ai_variables) if actionCalculations.has_method("commit_crime_calculateUtility") else 0
			base_weight = 10.0 * clamp(utility / 100.0, 0.5, 2.0) if utility > 0 else 0
		"adjust_single_relationship":
			var utility = actionCalculations.creativity_calculateUtility(character.stats, character.ai_variables)
			base_weight = 20.0 * clamp(utility / 100.0, 0.5, 2.0)
		# For other actions, fallback to the original simplistic weight function.
		_:
			base_weight = get_dynamic_weight(action, character)
	return base_weight

# Fallback (original) dynamic weight calculation for actions without specific utility functions.
func get_dynamic_weight(action: String, character) -> float:
	var empathy = character.stats.get("Empathy", 50)
	var aggression = character.stats.get("Aggression", 30)
	var confidence = character.stats.get("Confidence", 50)
	var discipline = character.stats.get("Discipline", 50)
	var evil = character.stats.get("Evil", 30)
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
	return weighted_actions[weighted_actions.size() - 1].action

### ACTION IMPLEMENTATIONS ###

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
	print(character.character_fullName, "improved their relationship with", selected_other.character_fullName)

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
		LogManager.add_log("News: " + character.character_fullName + " had a fight with " + opponent.character_fullName)
		
func _try_couple(character, active_characters):
	if character.couple == null:
		for other in active_characters:
			if other == character:
				continue
			if other.couple != null:
				continue
			var rel = character.relationships.get(other.character_id, 0)
			if rel > 70:
				character.couple = other.character_id
				other.couple = character.character_id
				print(character.name, "and", other.name, "became a couple!")
				LogManager.add_log("News: " + character.character_fullName + " and " + other.character_fullName + " are now a couple!")
				break

func _send_mission_solo_message(character):
	print(character.name, "wants to take a mission solo!")

func _train_character(character):
	var stat_keys = character.stats.keys()
	if stat_keys.size() > 0:
		var chosen_stat = stat_keys[randi() % stat_keys.size()]
		var improvement = randf_range(0.1, 0.5)
		character.stats[chosen_stat] += improvement
		print(character.name, "improved", chosen_stat, "by", improvement)
		LogManager.add_log("News: " + character.character_fullName + " has been training hard and improved " + chosen_stat)

func _commit_crime(character):
	print(character.name, "committed a crime in secret!")
	character.stats["Evil"] = character.stats.get("Evil", 0) - randf_range(1, 3)

func _request_guild_support(character):
	var support_types = ["item", "gold", "guild_building"]
	var chosen_type = support_types[randi() % support_types.size()]
	var details = ""
	if chosen_type == "item":
		var inventory = character.get_inventory_items()
		if inventory.size() > 0:
			var random_item = inventory[randi() % inventory.size()]
			details = "Item: " + random_item.name
		else:
			chosen_type = support_types[randi() % 2 + 1]
	if chosen_type == "gold":
		var gold_amount = -randi() % 51 - 50
		details = "Gold: " + str(gold_amount) + " gold"
	if chosen_type == "guild_building":
		var buildings = ["tavern", "training_grounds", "forge", "apothecary", "cartography", "enchantment"]
		var building = buildings[randi() % buildings.size()]
		var cost_modifier = randi() % 31 + 20
		details = "Guild building: " + building + " with cost reduction of " + str(cost_modifier) + " for 3 months"
	var extra_info = {
		"requested_item": details,
		"adventurer_name": character.character_fullName
	}
	GameManager.add_message(Message.MessageType.ADVENTURER_SUPPORT, extra_info)
	
func _donate_to_guild(character):
	print(character.name, "donated to the guild!")
	if character.gold > 0:
		var donation = min(character.gold, int(randf_range(10, 50)))
		character.gold -= donation
		GameManager.modify_gold(donation)
		print(character.name, "donated", donation, "gold.")
		LogManager.add_log("News: " + character.character_fullName + " donated " + str(donation) + " gold to the guild!")

func _increase_rank(character):
	if character.rank != null:
		character.rank += "+"
	else:
		character.rank = "E+"
	print(character.name, "increased their rank!")
	LogManager.add_log("News: " + character.character_fullName + " has been promoted to rank " + character.rank + "!")
