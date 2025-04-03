extends Control

# Left menu variables

@onready var left_menu = $leftMenu

# Book menu variables 

@onready var character_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_characterList
@onready var character_list_right = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/rightPage/rp_vbox/rp_title/rp_content/characterInfo
@onready var parties_list_left = $bookMenu/bookMenuVBox/bookMenuBase/book9PatchRect/leftPage/lp_vbox/lp_title/lp_content/lp_partiesList


# Bottom menu variables

func _ready():
	print("UIHandler initialized")
	# Signal listening
	UIManager.connect ("toggle_leftMenu", Callable (self, "toggle_leftMenu"))
	UIManager.connect("toggle_characterList", Callable (self, "toggle_characterList"))
	UIManager.connect ("toggle_partiesList", Callable (self, "toggle_partiesList"))
		
func toggle_leftMenu():
	left_menu.visible = not left_menu.visible

func toggle_characterList():
	character_list_left.visible = not character_list_left.visible
	character_list_right.visible = not character_list_right.visible

func toggle_partiesList():
	parties_list_left.visible = not parties_list_left.visible
