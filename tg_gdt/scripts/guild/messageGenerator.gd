extends Node

@export var message_scene = preload("res://message.tscn")
var Message = preload("res://scripts/guild/message.gd")

var messages = []

func generate_message(messageType, extra_info = null):
	var message_text: String
	var preview_text: String
	var sender: String

	match messageType:
		Message.MessageType.NOTIFICATION:
			message_text = "This is a notification."
			preview_text = "Notification"
			sender = "System"
		Message.MessageType.TOWN_SUPPORT_REQUEST:
			var requested_item = extra_info["requested_item"]
			message_text = "The town needs your support. They are requesting " + str(requested_item) + "."
			preview_text = "Town Support Request"
			sender = "Town Council"
		Message.MessageType.WORLD_NEWS:
			message_text = "Breaking news from around the world!"
			preview_text = "World News"
			sender = "News Agency"
		Message.MessageType.ADVENTURER_SUPPORT:
			var adventurer_name = extra_info["adventurer_name"]
			var requested_item = extra_info["requested_item"]
			message_text = adventurer_name + " needs your support. They are requesting " + str(requested_item) + "."
			preview_text = "Adventurer Support"
			sender = adventurer_name
		Message.MessageType.DUNGEON_NOTIFICATION:
			message_text = "A dungeon needs immediate attention. You must send a party to it."
			preview_text = "Dungeon Notification"
			sender = "Dungeon Master"
		Message.MessageType.ADVENTURER_UPDATES:
			message_text = "Updates from our adventurers."
			preview_text = "Adventurer Updates"
			sender = "Adventurer's Guild"
		Message.MessageType.ADVENTURER_APPLIES:
			# extra_info should contain the new adventurer character.
			var adv = extra_info["adventurer"]
			message_text = "Hello boss! We just received a new adventurer applying to our guild, it's a rookie " + adv.selected_race["name"] + " " + adv.selected_class["name"] + ", we did our evaluation and we determined it's a " + adv.guild_eval + ", we just need your decision!"
			preview_text = "Adventurer Application"
			sender = "Guild Recruitment"
	# Create the message
	var message = Message.new()
	message.initialize(message_text, preview_text, sender, messageType)
	# For ADVENTURER_APPLIES messages, store the applied adventurer reference.
	if messageType == Message.MessageType.ADVENTURER_APPLIES:
		message.applied_adventurer = extra_info["adventurer"]
		
	messages.append(message)
	return message

func get_messages():
	return messages

func generate_random_notification():
	var random_messages = [
		"This is a random notification 1.",
		"This is a random notification 2.",
		"This is a random notification 3.",
		"This is a random notification 4.",
		"This is a random notification 5."
	]
	var random_index = randi() % random_messages.size()
	var random_message = random_messages[random_index]
	var message = Message.new()
	message.initialize(random_message, "Random Notification", "Debug System", Message.MessageType.NOTIFICATION)
	messages.append(message)
	return message
