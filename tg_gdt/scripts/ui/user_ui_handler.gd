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
@onready var world_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_worldList
@onready var world_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/worldInfo

# Bottom menu variables

func _ready():
	print("UIHandler initialized")
	# Signal listening
	UIManager.connect ("toggle_leftMenu", Callable (self, "toggle_leftMenu"))
	UIManager.connect ("toggle_characterList", Callable (self, "toggle_characterList"))
	UIManager.connect ("toggle_partiesList", Callable (self, "toggle_partiesList"))
	UIManager.connect ("toggle_economyList", Callable (self, "toggle_itemList"))
	UIManager.connect ("toggle_guildList", Callable (self, "toggle_guildList"))
	UIManager.connect ("toggle_missionList", Callable (self, "toggle_missionList"))
		
func toggle_leftMenu():
	left_menu.visible = not left_menu.visible

func toggle_characterList():
	character_list_left.visible = not character_list_left.visible
	character_list_right.visible = not character_list_right.visible

func toggle_partiesList():
	parties_list_left.visible = not parties_list_left.visible
	parties_list_right.visible = not parties_list_right.visible
	
func toggle_itemList():
	item_list_left.visible = not item_list_left.visible
	item_list_right.visible = not item_list_right.visible
	
func toggle_guildList():
	guild_list_left.visible = not guild_list_left.visible
	guild_list_right.visible = not guild_list_right.visible
	
func toggle_missionlist():
	mission_list_left.visible = not mission_list_left.visible
	mission_list_right.visible = not mission_list_right.visible	
	
func toggle_worldlist():
	world_list_left.visible = not world_list_left.visible
	world_list_right.visible = not world_list_right.visible	
	
