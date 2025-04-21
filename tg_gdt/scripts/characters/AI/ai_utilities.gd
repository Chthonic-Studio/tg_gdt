extends Node

class_name AIUtilities

# Update variables after an action is complete
func update_ai_variables_after_action(character):
	character.ai_variables["Stress"] = clamp(character.ai_variables["Fatigue"] * 0.4 - character.ai_variables["Mood"] * 0.1 + character.ai_variables["Loneliness"] * 0.1, 0, 100)
	character.ai_variables["Comfort"] = clamp(30 - character.ai_variables["Stress"] * 0.3 + character.ai_variables["Mood"] * 0.1, 0, 100)
	character.ai_variables["Loneliness"] = clamp(character.ai_variables["Sociability"] * 0.2 - character.ai_variables["Mood"] * 0.1 + randi() % 15 + 1, 0, 100)
	character.ai_variables["Mood"] = clamp(character.ai_variables["Morale"] * 0.3 + randi() % 15 + 1, 0, 100)
	# isHurt remains a boolean updated elsewhere when damage is taken
	return

# Update variables daily if character is idle
func daily_update_ai_variables(character):
	if not character.isPerformingAction:
		update_ai_variables_after_action(character)