extends Node

class_name ActionSelector

# Calculate the overall utility for each category using existing formulas 
var ac = preload("res://scripts/characters/AI/actionCalculations.gd").new()

# This dictionary defines utility categories and, for each category, its sub-actions
var subaction_map = {
	"creativity": ["craft_items", "crowd_performing", "sculpting", "singing", "poetry", "playwriting", "gardening", "cooking", "composing"],
	"exploration": ["visit_landmarks", "go_out_of_town", "treasure_hunt", "go_to_local_festival", "tomb_raiding", "map_environment"],
	"helping": ["help_homeless", "charity_work", "help_townsfolk", "volunteer_work", "attend_town_council", "donate_to_church", "donate_to_guild", "mentor_young"],
	"relaxation": ["go_to_bathhouse", "birdwatching", "fishing", "meditation", "go_to_whorehouse", "get_drunk"],
	"rest": ["sleep", "nap", "take_a_break", "vacation"],
	"training": ["sparring", "attend_workshop", "practice_skill", "train_with_mentor", "lifting", "climbing", "running", "swimming", "mental_training"],
	"socialization": ["go_to_guild_meeting", "talk_with_collegue", "talk_with_townsfolk", "go_to_club", "try_for_romance", "talk_with_soulmate"],
	"shopping": ["buy_items", "sell_items", "barter", "comission_item", "buy_gift"],
	"spirituality": ["go_to_church", "pray", "spiritual_guidance", "read_religious_texts", "inner_reflection"],
	"entertainment": ["watch_performance", "attend_tournament", "gambling", "go_to_bonfire", "play_games", "go_to_tavern", "dancing"],
	"studying": ["go_to_library", "read_book", "read_skill_book", "attend_lecture", "read_history", "read_research_paper"],
	"villainy": ["pickpocket", "rob_house", "spy", "gang_work", "assasination", "match_fixing", "blackmail", "slander"]
}

# Main function: select the best action for the character
func choose_action(character) -> Dictionary:
	var action_utilities = {}

	# For simplicity, we define a dictionary mapping category to its utility
	action_utilities["creativity"] = ac.creativity_calculateUtility(character.stats, character.ai_variables)
	action_utilities["exploration"] = ac.exploration_calculateUtility(character.stats, character.ai_variables)
	action_utilities["helping"] = ac.helping_calculateUtility(character.stats, character.ai_variables)
	action_utilities["relaxation"] = ac.relaxation_calculateUtility(character.stats, character.ai_variables)
	action_utilities["rest"] = ac.rest_calculateUtility(character.stats, character.ai_variables)
	action_utilities["training"] = ac.training_calculateUtility(character.stats, character.ai_variables)
	action_utilities["socialization"] = ac.socialization_calculateUtility(character.stats, character.ai_variables)
	action_utilities["shopping"] = ac.shopping_calculateUtility(character.stats, character.ai_variables)
	action_utilities["spirituality"] = ac.spirituality_calculateUtility(character.stats, character.ai_variables)
	action_utilities["entertainment"] = ac.entertainment_calculateUtility(character.stats, character.ai_variables)
	action_utilities["studying"] = ac.studying_calculateUtility(character.stats, character.ai_variables)
	action_utilities["villainy"] = ac.villainy_calculateUtility(character.stats, character.ai_variables)

	# Add other utility categories as needed

	# Determine the category with the highest utility
	var best_category = null
	var best_cat_value = -INF
	for category in action_utilities.keys():
		if action_utilities[category] > best_cat_value:
			best_cat_value = action_utilities[category]
			best_category = category
	if best_category == null:
		return {}  # No action chosen

	# For the best category, select the best sub-action
	var candidate_subactions = subaction_map.get(best_category, [])
	if candidate_subactions.size() == 0:
		# If no specific sub-actions are defined, fall back to the category action.
		return {"category": best_category, "subaction": null, "utility": best_cat_value}
	
	# Compute utility for each candidate sub-action.
	# For modularity, we assume sub-action utilities are computed in a separate function for each sub-action.
	var best_subaction = candidate_subactions[0]
	var best_sub_value = -INF
	for subaction in candidate_subactions:
		var sub_value = compute_subaction_utility(best_category, subaction, character)
		if sub_value > best_sub_value:
			best_sub_value = sub_value
			best_subaction = subaction
	return {"category": best_category, "subaction": best_subaction, "utility": best_sub_value}

# Computes the utility of a candidate sub-action.
func compute_subaction_utility(category: String, subaction: String, character) -> float:
	if category == "creativity":
		match subaction:
			"craft_items":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"crowd_performing":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"sculpting":
				return character.stats["Creativity"] * 0.5 + randi_range(0, 10)
			"singing":
				return character.stats["Creativity"] * 0.5 + randi_range(0, 10)
			"poetry":
				return character.stats["Creativity"] * 0.5 + randi_range(0, 10)
			"playwriting":
				return character.stats["Creativity"] * 0.5 + randi_range(0, 10)
			"gardening":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"cooking":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"composing":
				return character.stats["Creativity"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "exploration":
		match subaction:
			"visit_landmarks":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"go_out_of_town":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"treasure_hunt":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"go_to_local_festival":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"tomb_raiding":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"map_environment":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "helping":
		match subaction:
			"help_homeless":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"charity_work":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"help_townsfolk":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"volunteer_work":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"attend_town_council":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"donate_to_church":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"donate_to_guild":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			"mentor_young":
				return character.stats["Empathy"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "relaxation":
		match subaction:
			"go_to_bathhouse":
				return character.stats["Relaxation"] * 0.5 + randi_range(0, 10)
			"birdwatching":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"fishing":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"meditation":
				return character.stats["Willpower"] * 0.5 + randi_range(0, 10)
			"go_to_whorehouse":
				return character.stats["Sociability"] * 0.5 + randi_range(0, 10)
			"get_drunk":
				return character.stats["Sociability"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "rest":
		match subaction:
			"sleep":
				return character.stats["Morale"] * 0.5 + randi_range(0, 10)
			"nap":
				return character.stats["Morale"] * 0.5 + randi_range(0, 10)
			"take_a_break":
				return character.stats["Morale"] * 0.5 + randi_range(0, 10)
			"vacation":
				return character.stats["Morale"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "training":
		match subaction:
			"sparring":
				return character.stats["Strength"] * 0.5 + randi_range(0, 10)
			"attend_workshop":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"practice_skill":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"train_with_mentor":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"lifting":
				return character.stats["Strength"] * 0.5 + randi_range(0, 10)
			"climbing":
				return character.stats["Strength"] * 0.5 + randi_range(0, 10)
			"running":
				return character.stats["Constitution"] * 0.5 + randi_range(0, 10)
			"swimming":
				return character.stats["Constitution"] * 0.5 + randi_range(0, 10)
			"mental_training":
				return character.stats["Intelligence"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "socialization":
		match subaction:
			"go_to_guild_meeting":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"talk_with_collegue":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"talk_with_townsfolk":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"go_to_club":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"try_for_romance":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"talk_with_soulmate":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "shopping":
		match subaction:
			"buy_items":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"sell_items":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"barter":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"comission_item":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"buy_gift":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "spirituality":
		match subaction:
			"go_to_church":
				return character.stats["Integrity"] * 0.5 + randi_range(0, 10)
			"pray":
				return character.stats["Integrity"] * 0.5 + randi_range(0, 10)
			"spiritual_guidance":
				return character.stats["Integrity"] * 0.5 + randi_range(0, 10)
			"read_religious_texts":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"inner_reflection":
				return character.stats["Integrity"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "entertainment":
		match subaction:
			"watch_performance":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"attend_tournament":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"gambling":
				return character.stats["Luck"] * 0.5 + randi_range(0, 10)
			"go_to_bonfire":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"play_games":
				return character.stats["Resourcefulness"] * 0.5 + randi_range(0, 10)
			"go_to_tavern":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"dancing":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "studying":
		match subaction:
			"go_to_library":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"read_book":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"read_skill_book":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"attend_lecture":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"read_history":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			"read_research_paper":
				return character.stats["Curiosity"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	elif category == "villainy":
		match subaction:
			"pickpocket":
				return character.stats["Agility"] * 0.5 + randi_range(0, 10)
			"rob_house":
				return character.stats["Agility"] * 0.5 + randi_range(0, 10)
			"spy":
				return character.stats["Agility"] * 0.5 + randi_range(0, 10)
			"gang_work":
				return character.stats["Strength"] * 0.5 + randi_range(0, 10)
			"assasination":
				return character.stats["Strength"] * 0.5 + randi_range(0, 10)
			"match_fixing":
				return character.stats["Luck"] * 0.5 + randi_range(0, 10)
			"blackmail":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			"slander":
				return character.stats["Charisma"] * 0.5 + randi_range(0, 10)
			_:
				return 0.0
	return 0.0
