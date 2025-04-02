extends Node

# Define Party class
class Party:
	var party_id: String = ""
	var party_name: String = ""
	var members: Array = []

# You can add more global classes or variables here

func _ready():
	print("Globals script initialized")
