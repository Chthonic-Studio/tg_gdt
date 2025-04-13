extends Node

class_name AIUtilities

# Update variables after an action is complete
func update_ai_variables_after_action(character):
	# Calculate Stress, Comfort, Loneliness, Mood based on formulas
	# Example for Stress: Fatigue * 0.4 - Mood * 0.1 + Loneliness * 0.1
	character.ai_variables["Stress"] = clamp(character.ai_variables["Fatigue"] * 0.4 - character.ai_variables["Mood"] * 0.1 + character.ai_variables["Loneliness"] * 0.1, 0, 100)
	character.ai_variables["Comfort"] = clamp(30 - character.ai_variables["Stress"] * 0.3 + character.ai_variables["Mood"] * 0.1, 0, 100)
	# ... (other calculations)
	# isHurt remains a boolean updated elsewhere when damage is taken
	return

# Update variables daily if character is idle
func daily_update_ai_variables(character):
	if not character.isPerformingAction:
		# Recalculate using the same formulas (and random components)
		# Random components: example for Loneliness would add a random number from 1 to 15
		character.ai_variables["Loneliness"] = clamp(character.stats["Sociability"] * 0.2 - character.ai_variables["Mood"] * 0.1 + randi() % 15 + 1, 0, 100)
		# Similarly for Mood:
		character.ai_variables["Mood"] = clamp(character.stats["Morale"] * 0.3 + randi() % 15 + 1, 0, 100)
		# And recalc Stress and Comfort accordingly, perhaps by calling the above function
		update_ai_variables_after_action(character)