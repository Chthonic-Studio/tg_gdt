extends Node

# Define player stats
var gold: int = 0
var reputation: int = 0
var leadership: int = 0
var wisdom: int = 0
var charisma: int = 0
var resources: int = 0
var morale: int = 0
var influence: int = 0
var adventurer_support: int = 0
var guild_prestige: int = 0
var security: int = 0

# Define global bool variables
var noGold: bool = false
var noResources: bool = false

# Define signals
signal stat_modified

# Function to modify gold
func modify_gold(value: int):
	gold += value
	if gold < 0:
		gold = 0
		noGold = true
	else:
		noGold = false
	emit_signal("stat_modified")
	print("Gold modified. New value: " + str(gold))

# Function to modify reputation
func modify_reputation(value: int):
	reputation += value
	reputation = clamp(reputation, -100, 100)
	emit_signal("stat_modified")
	print("Reputation modified. New value: " + str(reputation))

# Function to modify leadership
func modify_leadership(value: int):
	leadership += value
	leadership = clamp(leadership, 0, 100)
	emit_signal("stat_modified")
	print("Leadership modified. New value: " + str(leadership))

# Function to modify wisdom
func modify_wisdom(value: int):
	wisdom += value
	wisdom = clamp(wisdom, 0 , 20)
	emit_signal("stat_modified")
	print("Wisdom modified. New value: " + str(wisdom))

# Function to modify charisma
func modify_charisma(value: int):
	charisma += value
	charisma = clamp(charisma, 0, 20)
	emit_signal("stat_modified")
	print("Charisma modified. New value: " + str(charisma))

# Function to modify resources
func modify_resources(value: int):
	resources += value
	if resources < 0:
		resources = 0
		noResources = true
	else:
		noResources = false
	emit_signal("stat_modified")
	print("Resources modified. New value: " + str(resources))

# Function to modify morale
func modify_morale(value: int):
	morale += value
	morale = clamp(morale, -100, 100)
	emit_signal("stat_modified")
	print("Morale modified. New value: " + str(morale))

# Function to modify influence
func modify_influence(value: int):
	influence += value
	influence = clamp(influence, 0, 100)
	emit_signal("stat_modified")
	print("Influence modified. New value: " + str(influence))

# Function to modify adventurer support
func modify_adventurer_support(value: int):
	adventurer_support += value
	adventurer_support = clamp(adventurer_support, 0, 100)
	emit_signal("stat_modified")
	print("Adventurer support modified. New value: " + str(adventurer_support))

# Function to modify guild prestige
func modify_guild_prestige(value: int):
	guild_prestige += value
	guild_prestige = clamp(guild_prestige, 0, 100)
	emit_signal("stat_modified")
	print("Guild prestige modified. New value: " + str(guild_prestige))

# Function to modify security
func modify_security(value: int):
	security += value
	security = clamp(security, -100, 100)
	emit_signal("stat_modified")
	print("Security modified. New value: " + str(security))

# Function to get the value of a player stat
func get_stat(stat_name: String) -> int:
	match stat_name:
		"gold":
			return gold
		"reputation":
			return reputation
		"leadership":
			return leadership
		"wisdom":
			return wisdom
		"charisma":
			return charisma
		"resources":
			return resources
		"morale":
			return morale
		"influence":
			return influence
		"adventurer_support":
			return adventurer_support
		"guild_prestige":
			return guild_prestige
		"security":
			return security
		_:
			print("Stat '" + stat_name + "' does not exist.")
			return -1
