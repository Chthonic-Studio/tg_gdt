extends Node


var isHurt: int = 0

# Special variables

func isHurtCheck(ai_variables):
	if (ai_variables["isHurt"] == true):
		isHurt = 100
	else:
		isHurt = 0

### CREATIVITY ### 

func creativity_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Creativity"] * 0.3) + (character_stats["Curiosity"] * 0.1) + (ai_variables["Stress"] * 0.1)

func creativity_calculateNeed(character_stats, _ai_variables) -> float:
	return (character_stats["Creativity"] * 0.3) + (character_stats["Patience"] * 0.1) + (character_stats["Morale"] * 0.1)

func creativity_calculateUtility(character_stats, ai_variables) -> float:
	return (creativity_calculateDesire(character_stats, ai_variables) + creativity_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### EXPLORATION ###

func exploration_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Curiosity"] * 0.4) + (character_stats["Perception"] * 0.1) - (ai_variables["Stress"] * 0.1)

func exploration_calculateNeed(character_stats, ai_variables) -> float:
	return ((exploration_calculateDesire(character_stats, ai_variables)) * 0.3) + (character_stats["Resourcefulness"] * 0.1) - (ai_variables["Loneliness"] * 0.2)

func exploration_calculateUtility(character_stats, ai_variables) -> float:
	return (exploration_calculateDesire(character_stats, ai_variables) + exploration_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))


### HELPING ###

func helping_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Good"] * 0.5) + (character_stats["Empathy"] * 0.3) + (character_stats["Leadership"] * 0.1) + (character_stats["Diplomacy"] * 0.1) - (ai_variables["Stress"] * 0.3) - (character_stats["Cunning"] * 0.2)

func helping_calculateNeed(character_stats, ai_variables) -> float:
	return (ai_variables["Loneliness"] * 0.1) + (character_stats["Sociability"] * 0.1) + (character_stats["Patience"] * 0.1) + ((helping_calculateDesire(character_stats, ai_variables)) * 0.3) - (character_stats["Evil"] * 0.4)

func helping_calculateUtility(character_stats, ai_variables) -> float:
	return (helping_calculateDesire(character_stats, ai_variables) + helping_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))


### RELAX ###

func relax_calculateDesire(character_stats, ai_variables) -> float:
	return (ai_variables["Stress"] * 0.8) + (ai_variables["Fatigue"] * 0.6) - (character_stats["Morale"] * 0.2) - (ai_variables["Comfort"] * 0.2) - (character_stats["Discipline"] * 0.2)

func relax_calculateNeed(character_stats, ai_variables) -> float:
	return (ai_variables["Stress"] * 0.8) + (ai_variables["Comfort"] * 0.1) - (character_stats["Ambition"] * 0.2) + (ai_variables["Fatigue"] * 0.3) - (character_stats["Tenacity"] * 0.2)

func relax_calculateUtility(character_stats, ai_variables) -> float:
	return (relax_calculateDesire(character_stats, ai_variables) + relax_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### REST ###

func rest_calculateUtility(character_stats, ai_variables) -> float:
	return (ai_variables["Fatigue"] * 1) - (character_stats["Tenacity"] * 0.2) + randi_range (0, 15)

### TRAINING ###

func training_calculateDesire(character_stats, ai_variables) -> float:
	isHurtCheck(ai_variables)
	return (character_stats["Willpower"] * 0.2) + (character_stats["Ambition"] * 0.3) - isHurt * 1 + (character_stats["Discipline"] * 0.1)

func training_calculateNeed(character_stats, ai_variables) -> float:
	return (character_stats["Tenacity"] * 0.4) + (character_stats["Ambition"] * 0.5) - (ai_variables["Fatigue"] * 0.7)

func training_calculateUtility(character_stats, ai_variables) -> float:
	return (training_calculateDesire(character_stats, ai_variables) + training_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### SOCIALIZATION ###

func socialization_calculateDesire(character_stats, _ai_variables) -> float:
	return (character_stats["Sociability"] * 0.3) + (character_stats["Charisma"] * 0.15) + (character_stats["Confidence"] * 0.3)

func socialization_calculateNeed(character_stats, ai_variables) -> float:
	return (character_stats["Sociability"] * 0.3) * (ai_variables["Loneliness"] * 0.3)

func socialization_calculateUtility(character_stats, ai_variables) -> float:
	return (socialization_calculateDesire(character_stats, ai_variables) + socialization_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### SHOPPING ###

func shopping_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Ambition"] * 0.3) + (character_stats["Curiosity"] * 0.1) - (ai_variables["Stress"] * 0.1)

func shopping_calculateNeed(character_stats, _ai_variables) -> float:
	return (character_stats["Confidence"] * 0.3) + (randi_range(0, 30)) + (character_stats["Resourcefulness"] * 0.1)

func shopping_calculateUtility(character_stats, ai_variables) -> float:
	return (shopping_calculateDesire(character_stats, ai_variables) + shopping_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### SPIRITUALITY ###

func spirituality_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Discipline"] * 0.2) + (character_stats["Humility"] * 0.2) + (character_stats["Willpower"] * 0.1) + (character_stats["Patience"] * 0.1) - (ai_variables["Stress"] * 0.1)

func spirituality_calculateNeed(character_stats, ai_variables) -> float:
	return ((spirituality_calculateDesire(character_stats, ai_variables)) * 0.3) + (character_stats["Empathy"] * 0.2) + (character_stats["Curiosity"] * 0.1) - (character_stats["Morale"] * 0.3)

func spirituality_calculateUtility(character_stats, ai_variables) -> float:
	return (spirituality_calculateDesire(character_stats, ai_variables) + spirituality_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### ENTERTAINMENT ###

func entertainment_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Humor"] * 0.3) + (character_stats["Curiosity"] * 0.1) + (character_stats["Sociability"] * 0.1)

func entertainment_calculateNeed(character_stats, ai_variables) -> float:
	return (character_stats["Humor"] * 0.2) + (ai_variables["Stress"] * 0.3)

func entertainment_calculateUtility(character_stats, ai_variables) -> float:
	return (entertainment_calculateDesire(character_stats, ai_variables) + entertainment_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### VILLAINY ###

func villainy_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Evil"] * 0.3) + (character_stats["Cunning"] * 0.1) + (character_stats["Aggression"] * 0.1) - (character_stats["Good"] * 0.2)

func villainy_calculateNeed(character_stats, ai_variables) -> float:
	return ((villainy_calculateDesire(character_stats, ai_variables)) * 0.3) + (character_stats["Intimidation"] * 0.1) + (character_stats["Deception"] * 0.1)

func villainy_calculateUtility(character_stats, ai_variables) -> float:
	return (villainy_calculateDesire(character_stats, ai_variables) + villainy_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))

### STUDYING ###

func studying_calculateDesire(character_stats, ai_variables) -> float:
	return (character_stats["Resourcefulness"] * 0.3) + (character_stats["Adaptability"] * 0.1) + (character_stats["Curiosity"] * 0.1) + (character_stats["Patience"] * 0.1) - (ai_variables["Stress"] * 0.2)

func studying_calculateNeed(character_stats, ai_variables) -> float:
	return (character_stats["Intelligence"] * 0.4) + (character_stats["Willpower"] * 0.2) 

func studying_calculateUtility(character_stats, ai_variables) -> float:
	return (studying_calculateDesire(character_stats, ai_variables) + studying_calculateNeed(character_stats, ai_variables) * 0.7 + randi_range (0, 15))
