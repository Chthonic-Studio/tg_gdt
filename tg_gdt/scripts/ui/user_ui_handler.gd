extends Control

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

@onready var notification_list = $notificationMenu
@onready var message_display = $notificationMenu/messageMargin

func _ready():
	print("UIHandler initialized")
	# Signal listening
	UIManager.connect ("toggle_leftMenu", Callable (self, "toggle_leftMenu"))
	UIManager.connect ("toggle_characterList", Callable (self, "toggle_characterList"))
	UIManager.connect ("toggle_partiesList", Callable (self, "toggle_partiesList"))
	UIManager.connect ("toggle_economyList", Callable (self, "toggle_itemList"))
	UIManager.connect ("toggle_guildList", Callable (self, "toggle_guildList"))
	UIManager.connect ("toggle_missionList", Callable (self, "toggle_missionList"))
	UIManager.connect ("toggle_dungeonList", Callable (self, "toggle_worldList"))
	
	# Message system connections
	GameManager.connect("new_message_received", Callable (self, "_on_new_message_received"))
		
func toggle_leftMenu():
	left_menu.visible = not left_menu.visible

func toggle_characterList():
	character_list_left.visible = not character_list_left.visible
	character_list_right.visible = not character_list_right.visible

func toggle_partiesList():
	parties_list_left.visible = not parties_list_left.visible
	parties_list_right.visible = not parties_list_right.visible
	
func toggle_itemList():
	print ("Toggling Item Menu")
	item_list_left.visible = not item_list_left.visible
	item_list_right.visible = not item_list_right.visible
	
func toggle_guildList():
	print ("Toggling Guild Menu")
	guild_list_left.visible = not guild_list_left.visible
	guild_list_right.visible = not guild_list_right.visible
	
func toggle_missionList():
	print ("Toggling Mission Menu")
	mission_list_left.visible = not mission_list_left.visible
	mission_list_right.visible = not mission_list_right.visible	
	
func toggle_worldList():
	print ("Toggling Dungeon Menu")
	world_list_left.visible = not world_list_left.visible
	world_list_right.visible = not world_list_right.visible	
	
	
# Message System Functions

func _on_new_message_received(message):
	update_unread_message_list()

func update_unread_message_list():
	notification_list.clear()
	var unread_messages = GameManager.get_unread_messages()
	for message in unread_messages:
		var unread_message_instance = preload("res://unread_message.tscn").instantiate()
		unread_message_instance.get_node("Label").text = message.text
		unread_message_instance.connect("pressed", Callable(self, "_on_unread_message_pressed").bind(message))
		notification_list.add_child(unread_message_instance)

func _on_unread_message_pressed(message):
	GameManager.mark_message_as_read(message)
	show_message_content(message)

func show_message_content(message):
	message_display.get_node("messageText").text = message.text
	message_display.show()
