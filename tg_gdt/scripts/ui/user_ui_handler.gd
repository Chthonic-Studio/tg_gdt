extends Control

var Message = preload("res://scripts/guild/message.gd")
# Left menu variables

@onready var left_menu = $leftMenu

# Book menu variables 
@onready var character_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_characterList
@onready var character_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/characterInfo
@onready var parties_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_partiesList
@onready var parties_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/partyInfo
@onready var item_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_itemList
@onready var item_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/economyInfo
@onready var guild_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_guildList
@onready var guild_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/guildInfo
@onready var mission_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_missionsList
@onready var mission_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/missionInfo
@onready var world_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_dungeonList
@onready var world_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/dungeonInfo

# Message menu variables

@onready var notification_list = $notificationMenu/menuMargin/notificationBg/notificationList/notificationVBox
@onready var notification_margin = $notificationMenu
@onready var message_display = $notificationMenu/messageMargin/messageBg
@onready var inboxMenu = $leftMenu/VBoxContainer/baseLeftMenu/NinePatchRect/MarginContainer/StatContainer/inboxNotification
@onready var inboxNotificationValue = $leftMenu/VBoxContainer/baseLeftMenu/NinePatchRect/MarginContainer/StatContainer/inboxNotification/inboxNotificationValue
@onready var inboxAlert = $inboxAlert
@onready var accept_button = message_display.get_node("buttonContainer/acceptButton")
@onready var reject_button = message_display.get_node("buttonContainer/rejectButton")
@onready var dismiss_button = message_display.get_node("buttonContainer/dismissButton")

var current_message = null

func _ready():
	print("UIHandler initialized")
	# Signal listening
	UIManager.connect("toggle_leftMenu", Callable(self, "toggle_leftMenu"))
	UIManager.connect("toggle_characterList", Callable(self, "toggle_characterList"))
	UIManager.connect("toggle_partiesList", Callable(self, "toggle_partiesList"))
	UIManager.connect("toggle_economyList", Callable(self, "toggle_itemList"))
	UIManager.connect("toggle_guildList", Callable(self, "toggle_guildList"))
	UIManager.connect("toggle_missionList", Callable(self, "toggle_missionList"))
	UIManager.connect("toggle_dungeonList", Callable(self, "toggle_worldList"))
	
	# Message system connections
	GameManager.connect("new_message_received", Callable(self, "_on_new_message_received"))
	GameManager.connect("new_message_received", Callable(self, "_update_inbox_notification"))
	GameManager.connect("unread_message_count_changed", Callable(self, "_update_inbox_notification"))
	
	# Button connections 
	accept_button.connect("pressed", Callable(self, "_on_accept_button_pressed"))
	reject_button.connect("pressed", Callable(self, "_on_reject_button_pressed"))
	dismiss_button.connect("pressed", Callable(self, "_on_dismiss_button_pressed"))
	inboxMenu.connect("pressed", Callable(self, "_on_inbox_notification_pressed"))
	inboxAlert.connect("pressed", Callable(self, "_on_inbox_alert_pressed"))
		
	_update_inbox_notification()
		
func toggle_leftMenu():
	left_menu.visible = not left_menu.visible

func toggle_characterList():
	character_list_left.visible = not character_list_left.visible
	character_list_right.visible = not character_list_right.visible

func toggle_partiesList():
	parties_list_left.visible = not parties_list_left.visible
	parties_list_right.visible = not parties_list_right.visible
	
func toggle_itemList():
	print("Toggling Item Menu")
	item_list_left.visible = not item_list_left.visible
	item_list_right.visible = not item_list_right.visible
	
func toggle_guildList():
	print("Toggling Guild Menu")
	guild_list_left.visible = not guild_list_left.visible
	guild_list_right.visible = not guild_list_right.visible
	
func toggle_missionList():
	print("Toggling Mission Menu")
	mission_list_left.visible = not mission_list_left.visible
	mission_list_right.visible = not mission_list_right.visible	
	
func toggle_worldList():
	print("Toggling Dungeon Menu")
	world_list_left.visible = not world_list_left.visible
	world_list_right.visible = not world_list_right.visible	

func toggle_messageList():
	notification_margin.visible = not notification_margin.visible
	message_display.visible = not message_display.visible
	
	
# Message System Functions

func _on_new_message_received(message):
	update_unread_message_list()

func update_unread_message_list():
	# Clear the VBoxContainer by removing all its children
	for child in notification_list.get_children():
		child.queue_free()
		
	var unread_messages = GameManager.get_unread_messages()
	for message in unread_messages:
		var unread_message_instance = preload("res://unread_message.tscn").instantiate()
		var button = unread_message_instance.get_node("unreadMessageButton")
		var label = unread_message_instance.get_node("Label")
		label.text = message.preview
		button.connect("pressed", Callable(self, "_on_unread_message_pressed").bind(message))
		notification_list.add_child(unread_message_instance)
	_update_inbox_notification()

func _on_unread_message_pressed(message):
	# Do not mark the message as read immediately.
	# Simply show the message content.
	show_message_content(message)
	_update_inbox_notification()  # Update the inbox notification if necessary

func show_message_content(message):
	current_message = message
	var message_text_node = message_display.get_node("messageText")
	if message_text_node:
		message_text_node.text = message.text
		message_display.show()
		
		# Show or hide buttons based on the message type.
		# For an adventurer application message, show Accept and Reject and hide Dismiss.
		match message.messageType:
			Message.MessageType.NOTIFICATION, Message.MessageType.WORLD_NEWS, Message.MessageType.ADVENTURER_UPDATES:
				accept_button.hide()
				reject_button.hide()
				dismiss_button.show()
			Message.MessageType.TOWN_SUPPORT_REQUEST, Message.MessageType.ADVENTURER_SUPPORT, Message.MessageType.DUNGEON_NOTIFICATION:
				accept_button.show()
				reject_button.show()
				dismiss_button.hide()
			# New case for adventurer application:
			Message.MessageType.ADVENTURER_APPLIES:
				accept_button.show()
				reject_button.show()
				dismiss_button.hide()
			_:
				accept_button.hide()
				reject_button.hide()
				dismiss_button.show()
	else:
		print("Error: Node 'messageText' not found in 'message_display'")

func _on_accept_button_pressed():
	print("Accept button pressed")
	if current_message != null:
		match current_message.messageType:
			Message.MessageType.ADVENTURER_APPLIES:
				GameManager.accept_adventurer_application(current_message.applied_adventurer)
			_:
				print("Other accept action")
		# Mark the current message as read only when an action is taken
		GameManager.mark_message_as_read(current_message)
	message_display.hide()
	update_unread_message_list()

func _on_reject_button_pressed():
	print("Reject button pressed")
	if current_message != null:
		match current_message.messageType:
			Message.MessageType.ADVENTURER_APPLIES:
				GameManager.decline_adventurer_application(current_message.applied_adventurer)
			_:
				print("Other reject action")
		# Mark the current message as read only when an action is taken
		GameManager.mark_message_as_read(current_message)
	message_display.hide()
	update_unread_message_list()

func _on_dismiss_button_pressed():
	print("Dismiss button pressed")
	if current_message and (current_message.messageType in [
		Message.MessageType.NOTIFICATION,
		Message.MessageType.WORLD_NEWS,
		Message.MessageType.ADVENTURER_UPDATES
	]):
		GameManager.mark_message_as_read(current_message)
	message_display.hide()
	_update_inbox_notification()
	update_unread_message_list()

func _on_inbox_notification_pressed():
	toggle_messageList()

func _on_inbox_alert_pressed():
	left_menu.visible = true

func _update_inbox_notification(unread_message_count = 0):
	var unread_messages = GameManager.get_unread_messages()
	print("Unread messages count: ", unread_messages.size())
	if unread_messages.size() > 0:
		inboxNotificationValue.text = "There are unopened letters at your desk!"
		inboxAlert.visible = true
	else:
		inboxNotificationValue.text = "Your desk is clear"
		inboxAlert.visible = false
