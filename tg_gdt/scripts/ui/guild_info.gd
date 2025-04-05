extends VBoxContainer

# Define references to UI elements
@onready var tavern_level = $HSplitContainer/tavern/tavernLevel
@onready var tavern_status = $HSplitContainer/tavern/tavernStatus
@onready var training_grounds_level = $HSplitContainer/trainingGrounds/trainingGroundsLevel
@onready var training_grounds_status = $HSplitContainer/trainingGrounds/trainingGroundsStatus
@onready var forge_level = $HSplitContainer2/forge/forgeLevel
@onready var forge_status = $HSplitContainer2/forge/forgeStatus
@onready var apothecary_level = $HSplitContainer2/apothecary/apothecaryLevel
@onready var apothecary_status = $HSplitContainer2/apothecary/apothecaryStatus
@onready var cartography_level = $HSplitContainer3/cartography/cartographyLevel
@onready var cartography_status = $HSplitContainer3/cartography/cartographyStatus
@onready var enchantment_level = $HSplitContainer3/enchantment/enchantmentLevel
@onready var enchantment_status = $HSplitContainer3/enchantment/enchantmentStatus
@onready var guild_tavern_income = $HBoxContainer/VBoxContainer2/guildTavernIncome
@onready var guild_forge_income = $HBoxContainer/VBoxContainer2/guildForgeIncome
@onready var cartographer_table_income = $HBoxContainer/VBoxContainer2/cartographerTableIncome
@onready var training_grounds_income = $HBoxContainer/VBoxContainer4/trainingGroundsIncome
@onready var apothecary_income = $HBoxContainer/VBoxContainer4/apothecaryIncome
@onready var enchantment_table_income = $HBoxContainer/VBoxContainer4/enchantmentTableIncome

# Function to handle the upgrade button press
func _on_upgrade_button_pressed(building: String):
	GameManager.upgrade_building(building)
	update_ui()

# Function to handle the hire button press
func _on_hire_button_pressed(building: String):
	GameManager.hire_workers(building)
	update_ui()

# Function to update the UI after an action
func update_ui():
	# Update the UI elements with the new stats from the GameManager
	var guild_stats = GameManager.get_guild_stats()
	update_guild_stats(guild_stats)

# Function to update guild stats
func update_guild_stats(stats):
	tavern_level.text = str(stats.tavern_level)
	tavern_status.text = stats.tavern_status
	training_grounds_level.text = str(stats.training_grounds_level)
	training_grounds_status.text = stats.training_grounds_status
	forge_level.text = str(stats.forge_level)
	forge_status.text = stats.forge_status
	apothecary_level.text = str(stats.apothecary_level)
	apothecary_status.text = stats.apothecary_status
	cartography_level.text = str(stats.cartography_level)
	cartography_status.text = stats.cartography_status
	enchantment_level.text = str(stats.enchantment_level)
	enchantment_status.text = stats.enchantment_status
	guild_tavern_income.text = str(stats.guild_tavern_income)
	guild_forge_income.text = str(stats.guild_forge_income)
	cartographer_table_income.text = str(stats.cartographer_table_income)
	training_grounds_income.text = str(stats.training_grounds_income)
	apothecary_income.text = str(stats.apothecary_income)
	enchantment_table_income.text = str(stats.enchantment_table_income)

# Function to initialize the button handler
func initialize():
	# Check and connect each button
	if $HSplitContainer/tavern/tavernUpgrade:
		$HSplitContainer/tavern/tavernUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("tavern"))
	
	if $HSplitContainer/tavern/tavernHire:
		$HSplitContainer/tavern/tavernHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("tavern"))

	if $HSplitContainer/trainingGrounds/trainingGroundsUpgrade:
		$HSplitContainer/trainingGrounds/trainingGroundsUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("training_grounds"))
	
	if $HSplitContainer/trainingGrounds/trainingGroundsHire:
		$HSplitContainer/trainingGrounds/trainingGroundsHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("training_grounds"))
	
	if $HSplitContainer2/forge/forgeUpgrade:
		$HSplitContainer2/forge/forgeUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("forge"))
	
	if $HSplitContainer2/forge/forgeHire:
		$HSplitContainer2/forge/forgeHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("forge"))
	
	if $HSplitContainer2/apothecary/apothecaryUpgrade:
		$HSplitContainer2/apothecary/apothecaryUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("apothecary"))
	
	if $HSplitContainer2/apothecary/apothecaryHire:
		$HSplitContainer2/apothecary/apothecaryHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("apothecary"))
	
	if $HSplitContainer3/cartography/cartographyUpgrade:
		$HSplitContainer3/cartography/cartographyUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("cartography"))
	
	if $HSplitContainer3/cartography/cartographyHire:
		$HSplitContainer3/cartography/cartographyHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("cartography"))
	
	if $HSplitContainer3/enchantment/enchantmentUpgrade:
		$HSplitContainer3/enchantment/enchantmentUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("enchantment"))
	
	if $HSplitContainer3/enchantment/enchantmentHire:
		$HSplitContainer3/enchantment/enchantmentHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("enchantment"))

	# Update the UI initially
	update_ui()

# Call this function when the node is ready
func _ready():
	# Use call_deferred to ensure the nodes are loaded before connecting
	call_deferred("initialize")
