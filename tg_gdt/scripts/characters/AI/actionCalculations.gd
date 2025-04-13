extends Node

func creativity_calculateDesire(character_stats, ai_variables) -> float:
	# Use behavior stats and variables to calculate desire
	return randi_range(10, 20) + character_stats["Curiosity"]

func creativity_calculateNeed(character_stats, ai_variables) -> float:
	# Calculate need value
	return randi_range(5, 15) + character_stats["Perception"]

func creativity_calculateUtility(character_stats, ai_variables) -> float:
	# Utility might be sum or weighted combination of desire and need
	return creativity_calculateDesire(character_stats, ai_variables) + creativity_calculateNeed(character_stats, ai_variables)