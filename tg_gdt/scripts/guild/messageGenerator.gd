extends Node

@export var message_scene = preload("res://message.tscn")

var messages = []

func generate_message(messageType):
	var message_text: String
	var sender: String

	match messageType:
		message_scene.MessageType.NOTIFICATION:
			message_text = "This is a notification."
			sender = "System"
		message_scene.MessageType.TOWN_SUPPORT_REQUEST:
			message_text = "The town needs your support."
			sender = "Town Council"
		message_scene.MessageType.WORLD_NEWS:
			message_text = "Breaking news from around the world!"
			sender = "News Agency"
		message_scene.MessageType.ADVENTURER_SUPPORT:
			message_text = "An adventurer needs your support."
			sender = "Adventurer's Guild"
		message_scene.MessageType.DUNGEON_NOTIFICATION:
			message_text = "New dungeon discovered!"
			sender = "Dungeon Master"
		message_scene.MessageType.ADVENTURER_UPDATES:
			message_text = "Updates from our adventurers."
			sender = "Adventurer's Guild"

	var message = message_scene.new(message_text, sender, messageType)
	messages.append(message)
	return message

func get_messages():
	return messages
